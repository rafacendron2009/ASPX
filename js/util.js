var win = null;
function NewWindow(mypage, myname, w, h, scroll) {
    LeftPosition = (screen.width) ? (screen.width - w) / 2 : 0;
    TopPosition = (screen.height) ? (screen.height - h) / 2 : 0;
    settings = 'height=' + h + ',width=' + w + ',top=' + TopPosition + ',left=' + LeftPosition + ',scrollbars=' + scroll + ',resizable=yes'
    win = window.open(mypage, '', settings);
}

function CheckValidationGroup(valGrp) {
    if (Page_ClientValidate(valGrp)) {
        return true;
    }
    else {
        return false;
    }
}

//Carrega Página no Pageview e mostra o RadAjaxLoadingPanel
function SetParentUrl(id, url) {
    if (window.parent.setUrl) {
        window.parent.setUrl(id,url);
    }
}

function GetWnd(windowname) {
    var oManager = GetRadWindowManager();
    var oWnd = oManager.GetWindowByName(windowname);
    if (!oWnd) oWnd = $find(windowname);
    return oWnd;
}

function GetParentWnd(windowname) {
    var oManager = parent.GetRadWindowManager();
    var oWnd = oManager.GetWindowByName(windowname);
    return oWnd;
}

function GetRadWindow() {
    var oWindow = null;
    if (window.radWindow) oWindow = window.radWindow; //Will work in Moz in all cases, including clasic dialog
    else if (window.frameElement) {
        oWindow = window.frameElement.radWindow; //IE (and Moz as well)
    }
    return oWindow;
}


function CloseRadWindow(window, parent) {
    if (parent) {
        oWnd = GetParentWnd(window);
    }
    else {
        oWnd = GetWnd(window);
    }

    oWnd.close();
}

//Para utilizar o autosize adequadamente o ideal é ter a página a ser aberta com a largura já definida em pixels: ver change_pass.aspx
function OpenRadWindow(window, url, paramname, paramvalue, title, vwidth, vheight, windowbehaviors, discountmenusize, maximize, allowshortcut, autosize) {

    allparamname = paramname.split('|');
    allparamvalue = paramvalue.split('|');
    allwindowbehaviors = windowbehaviors.split('|');
    param = '';

    if (paramname) {
        param = '?';
        for (i = 0; i < allparamname.length; i++) {
            param += allparamname[i] + '=' + allparamvalue[i];
            if (i < allparamname.length - 1) { param += '&' }
        }
    }

    oWnd = GetWnd(window);
    if (autosize) {
        // Carregar página para saber o tamanho exato e não redimensionar na página com timeout
        oWnd.show();
        oWnd.moveTo(-1000, -1000);
        //Se KeepInScreenBounds=True 
        //div = $get('RadWindowWrapper_' + window);
        //if (div) {
        //    //div.style.left = '-1000px';
        //    //div.style.top = '-1000px';
        //}
        //---------------------------------------------------
        oWnd.add_pageLoad(contentIsLoaded);
    }

    oWnd.setUrl(url + param);
    oWnd.set_title(title);
    oWnd.set_initialBehaviors(Telerik.Web.UI.WindowBehaviors.None); // set the desired behaviours

    // Behaviours
    //Default - Default object behavior. 
    //None - The user can perform none of the actions on the window.  
    //Resize - The user can resize the window by dragging its border.  
    //Minimize - The window can be minimized, and has a minimize button on the title bar. 
    //Close - The user can close the window using a title bar button. 
    //Pin - The window can be pinned, and has a pin button on the title bar. 
    //Maximize - The window can be maximized, and has a maximize button on the title bar. 
    //Move - The user can click on the window title bar and drag it to a new location. 
    //Reload - The user can reload the window contents using a title bar button. 

    function SetBehaviours() {
        var ret = 0;
        //Default e None admitem apenas esses valores.
        if (windowbehaviors.indexOf("Default") != -1) { ret = Telerik.Web.UI.WindowBehaviors.Default }
        if (windowbehaviors.indexOf("None") != -1) { ret = Telerik.Web.UI.WindowBehaviors.None }
        if (windowbehaviors.indexOf("Resize") != -1) { ret += Telerik.Web.UI.WindowBehaviors.Resize }
        if (windowbehaviors.indexOf("Minimize") != -1) { ret += Telerik.Web.UI.WindowBehaviors.Minimize }
        if (windowbehaviors.indexOf("Close") != -1) { ret += Telerik.Web.UI.WindowBehaviors.Close }
        if (windowbehaviors.indexOf("Pin") != -1) { ret += Telerik.Web.UI.WindowBehaviors.Pin }
        if (windowbehaviors.indexOf("Maximize") != -1) { ret += Telerik.Web.UI.WindowBehaviors.Maximize }
        if (windowbehaviors.indexOf("Move") != -1) { ret += Telerik.Web.UI.WindowBehaviors.Move }
        if (windowbehaviors.indexOf("Reload") != -1) { ret += Telerik.Web.UI.WindowBehaviors.Reload }
        return ret
    }

    oWnd.set_behaviors(SetBehaviours());

    if(allowshortcut==null || allowshortcut==true){
        oWnd.addShortcut("Reload", "R");
        oWnd.addShortcut("Close", "Esc");
        //shortcut.add("R", function () { oWnd.Reload(); });
        //shortcut.add("Esc", function () { oWnd.Close(); });
    }   

    if (!isNumber(vwidth)) {
        vwidth = vwidth.replace("%", "");
        vwidth = getDocWidth() * vwidth / 100;
    }
    if (!isNumber(vheight)) {
        vheight = vheight.replace("%", "");
        vheight = getDocHeight() * vheight / 100;
    }
    
    vtop = 0;
    vleft = 0;
    //Discount Menu Size (26px)
    if (discountmenusize) {
        if (vheight < getDocHeight()) {
            vheight -= 28;
            if (vheight + 28 >= getDocHeight()) {
                vtop = 28;
            } else {
                vtop = (getDocHeight() - vheight) / 2;
                if (vtop < 28) vtop = 28;
            }
        } else {
            vheight -= 26;
            if (vheight + 26 >= getDocHeight()) {
                vtop = 26;
            } else {
                vtop = (getDocHeight() - vheight) / 2;
                if (vtop < 26) vtop = 26;
            }
        }

        if (vwidth < getDocWidth()) {
            vleft = (getDocWidth() - vwidth) / 2;
        }
    }
    
    //Se não for autosize segue abaixo, senão executa: contentIsLoaded
    if (autosize == null || autosize == false) {
        oWnd.setSize(vwidth, vheight);
        oWnd.show();
        if (discountmenusize) {
            oWnd.MoveTo(vleft, vtop);
        } else {
            oWnd.Center();
        }
    }    

    if (maximize) oWnd.Maximize();

}

function contentIsLoaded(oWnd, args) {
    oWnd.remove_pageLoad(contentIsLoaded);
    oWnd.autoSize();
    //oWnd.hide();
    //oWnd.show();
    setTimeout(function () {
        oWnd.Center();
    }, 0)
}

function isNumber(n) {
    return !isNaN(parseFloat(n)) && isFinite(n);
}

function getDocHeight() {
    var D = document;
    if (D.documentElement.clientHeight) {
        return D.documentElement.clientHeight;
    } else {
        return Math.max(
            Math.max(D.body.scrollHeight, D.documentElement.scrollHeight),
            Math.max(D.body.offsetHeight, D.documentElement.offsetHeight),
            Math.max(D.body.clientHeight, D.documentElement.clientHeight)
        );
    }
}

function getDocWidth() {
    var D = document;
    return Math.max(
        Math.max(D.body.scrollWidth, D.documentElement.scrollWidth),
        Math.max(D.body.offsetWidth, D.documentElement.offsetWidth),
        Math.max(D.body.clientWidth, D.documentElement.clientWidth)
    );
}

function ComboGetValue(IDCombo) {
    var combo = $find(IDCombo);
    if(combo.get_selectedItem()) return combo.get_selectedItem().get_value();
}

function SetValue(IDCampo,Valor) {
    var radInput = $find(IDCampo);
    var NormalInput = document.getElementById(IDCampo);
    if (radInput) {
        radInput.set_value(Valor);
    }
    else {
        NormalInput.value = Valor;
    }
}

function ReadOnlyRadCombobox(sender) {
    var input = sender.get_inputDomElement();
    input.readOnly = true;
    $telerik.$(input).keydown(function (e) { return false; });
    sender.add_dropDownOpening(function (s, e) { e.set_cancel(true); });
}

// SetFocus para um campo desejado on Enter Key
function SetFocus(event, IDFocus, click, IDCur) {

    var keyCode = event.keyCode ? event.keyCode : event.which ? event.which : event.charCode;
    if (keyCode) {
        if (keyCode == 13) {

            var RadInput = $find(IDFocus);            
            if (IDCur) {
                var CurRadInput = $find(IDCur);
                var comboCur = CurRadInput._inputDomElement
                if (comboCur) {
                    comboCur.style.backgroundColor = "";
                    comboCur.style.border = "";
                }
                if (typeof CurRadInput.get_dateInput === 'function') CurRadInput.hidePopup();
                if (typeof CurRadInput.set_emptyMessage === 'function') CurRadInput.set_emptyMessage(CurRadInput.get_emptyMessage());
            }
            var NormalInput = document.getElementById(IDFocus);          

            if (RadInput) {
                //Testa para ver se é combobox
                var combo = RadInput._inputDomElement
                //Testa para ver se é RadDatePicker
                if (typeof RadInput.get_dateInput === 'function') var datepicker = RadInput.get_dateInput();
                if (typeof RadInput.getID === 'function') var asyncupload = RadInput.getID();

                if (combo) {
                    //if (typeof RadInput.set_emptyMessage === 'function') RadInput.set_emptyMessage(RadInput.get_emptyMessage());
                    combo.focus();
                    //combo.style.backgroundColor = "red";
                    //RadInput.showDropDown();
                }
                else if (datepicker) {
                    datepicker.focus();
                }
                else if (asyncupload) {
                    document.getElementById(IDFocus+'file0').click();
                }
                else {
                    RadInput.focus();
                    RadInput.selectAllText();
                }
            }
            else {
                document.getElementById(IDFocus).focus();
                if (NormalInput.type != 'button') document.getElementById(IDFocus).select();
                if (click) document.getElementById(IDFocus).click();
            }
        }       
    }
}

function Set_Focus(IDFocus) {
    var RadInput = $find(IDFocus);
    var NormalInput = document.getElementById(IDFocus);
    if (RadInput) {
        //Testa para ver se é combobox
        var combo = RadInput._inputDomElement
        //Testa para ver se é RadDatePicker
        if (typeof RadInput.get_dateInput === 'function') var datepicker = RadInput.get_dateInput();

        if (combo) {
            //if (typeof RadInput.set_emptyMessage === 'function') RadInput.set_emptyMessage(RadInput.get_emptyMessage());
            combo.focus();
            //combo.style.backgroundColor = "red";
            //RadInput.showDropDown();
        }
        else if (datepicker) {
            datepicker.focus();
        }
        else {
            RadInput.focus();
            RadInput.selectAllText();
        }
    }
    else {
        document.getElementById(IDFocus).focus();
        if (NormalInput.type != 'button') document.getElementById(IDFocus).select();
    }
}

function TimeoutFocus(IDFocus,Timeout) {
    setTimeout(function () {
        Set_Focus(IDFocus);
    }, Timeout);
}

function Set_Mask(id) {
    $("#" + id).inputmask({
        mask: ["(99) 9999-9999", "(99) 99999-9999", ],
        keepStatic: true
    });
}

function ClearCombo(ID) {
    var combo = $find(ID);
    combo.hideDropDown();
    combo.clearSelection();
    return false;
}

function OnRadComboClientLoad(sender, args) {
    var combo = sender._inputDomElement;
    combo.focus();
}

function FocusOnClientLoad(sender, args) {
    var RadInput = sender;
    var NormalInput = sender;
    if (RadInput) {
        //Testa para ver se é combobox
        var combo = RadInput._inputDomElement
        //Testa para ver se é RadDatePicker
        if (typeof RadInput.get_dateInput === 'function') var datepicker = RadInput.get_dateInput();
        if (combo) {
            combo.focus();
        }
        else if (datepicker) {
            datepicker.focus();
        }
        else {
            RadInput.focus();
            RadInput.selectAllText();
        }
    }
    else {
        document.getElementById(IDFocus).focus();

    }
}

function RadComboShowDropDownOnFocus(sender, args) {
    var combo = sender._inputDomElement;
    combo.style.border = "2px solid #7A9CD3";
    sender.selectText(0, sender.get_text().length);
    sender.showDropDown();
}
function OnRadComboClientFocus(sender, args) {
    var combo = sender._inputDomElement;
    ////combo.style.backgroundColor = "#E2FCCB";
    combo.style.border = "2px solid #7A9CD3";
    //combo.className = "glowing-border";
}
function OnRadComboClientBlur(sender, args) {
    var combo = sender._inputDomElement;
    combo.style.backgroundColor = "";
    combo.style.border = "";
}

//Evitar Post Back on Enter para todos os RadInputs - RadDataPicker - RadNumericTextBox - RadTextbox
function PreventPostBack(sender, args) {
    args = args || window.event;
    if (args.keyCode == 13) {
        args.cancelBubble = true;
        args.returnValue = false;
        if (args.preventDefault) args.preventDefault();
        if (args.stopPropagation) args.stopPropagation();
    }
}


//global DOM ID registry.  filled up by scripts rendered from templates.
var registeredElements = [];
function GetRegisteredServerElement(serverID) {
    var clientID = "";
    for (var i = 0; i < registeredElements.length; i++) {
        clientID = registeredElements[i];
        if (clientID.indexOf(serverID) >= 0)
            break;
    }
    return clientID; 
    //return $get(clientID);
    //return $find(clientID);
}

// Previne que dispare o Grid quando pressionar o Enter
function keyPressed(sender, args) {
    if (args.get_keyCode() == 13) {
        var e = args.get_domEvent().rawEvent;
        e.returnValue = false;
        e.cancelBubble = true;

        if (e.stopPropagation) {
            e.preventDefault();
            e.stopPropagation();
        }
    }
}

function DownloadFile(url) {
    var iframe = document.createElement("iframe");
    document.body.appendChild(iframe);
    setTimeout(function () {
        iframe.src = url;
        iframe.style.display = "none";
    }, 100);
    setTimeout(function () {
        document.body.removeChild(iframe);
    }, 7500);
}

function formatNumber(num, dec, thou, pnt, curr1, curr2, n1, n2) { var x = Math.round(num * Math.pow(10, dec)); if (x >= 0) n1 = n2 = ''; var y = ('' + Math.abs(x)).split(''); var z = y.length - dec; if (z < 0) z--; for (var i = z; i < 0; i++) y.unshift('0'); y.splice(z, 0, pnt); if (y[0] == pnt) y.unshift('0'); while (z > 3) { z -= 3; y.splice(z, 0, thou); } var r = curr1 + n1 + y.join('') + n2 + curr2; return r; }

function secondstominutes(secs) {
    return ((arguments[1] = (Math.floor(secs / 60))) < 10 ? "0" : "") + arguments[1] + ":" + ((arguments[2] = secs % 60) < 10 ? "0" : "") + arguments[2];
}
function replaceAll(str, find, replace) {
    return str.replace(new RegExp(find, 'g'), replace);
}
String.format = function () {
    var s = arguments[0];
    for (var i = 0; i < arguments.length - 1; i++) {
        var reg = new RegExp("\\{" + i + "\\}", "gm");
        s = s.replace(reg, arguments[i + 1]);
    }
    return s;
}
function GetFooterHTML(RGrid) {
    html = "<tr>" + $("#" + RGrid + "_GridFooter .rgFooter").html() + "</tr>";
    if (html == "<tr>null</tr>" || html == "<tr>undefined</tr>") {
        html = "<tr>" + $("#" + RGrid + " .rgFooter").html() + "</tr>";
    }
    html = replaceAll(html, "<br>", "<br />");
    $find("gridfooter").set_value(html);
}

function AjaxSaveReportFile(url, report, idref, filename, render, saveinfile, rootfolder, masterfolder, tempfolder) {
    $.ajax({
        async: true,
        url: url,
        data: { report: report, idref: idref, filename: filename, render: render, saveinfile: saveinfile, rootfolder: rootfolder, masterfolder: masterfolder, tempfolder: tempfolder },
    })
    .done(function (msg) {
        //var oWnd = radalert('Termo de Designação encaminhado para Documentos para Assinatura com sucesso!', 380, 170, 'Mensagem'); oWnd.add_close(function () { window.location.reload(); });
    });
}
//------------------------ Grid Utils-------------------------------------------------------
function RefreshGrid(RGrid, ClearItems) {
    if (ClearItems) ClearSelectedItems(RGrid);
    var masterTable = $find(RGrid).get_masterTableView();
    masterTable.rebind();
}
function Clear_Filter(RGrid) {
    var grid = $find(RGrid);
    var masterTableView = grid.get_masterTableView();
    var Columns = masterTableView.get_columns();
    var filterRow = $(grid.get_element()).find(".rgFilterRow");
    for (var i = 0; i < Columns.length; i++) {
        var column = Columns[i];
        var columnUniqueName = column.get_uniqueName();
        masterTableView._updateFilterControlValue(null, columnUniqueName, Telerik.Web.UI.GridFilterFunction.NoFilter);
        column.set_filterFunction(Telerik.Web.UI.GridFilterFunction.NoFilter);//Remove filter function
        if ($telerik.findControl(filterRow[0], columnUniqueName)) {
            //GridDateTimeColumn
            $telerik.findControl(filterRow[0], columnUniqueName).clear();
        } else if ($telerik.findElement(filterRow[0], columnUniqueName)) {
            //GridBoundColumn
            $telerik.findElement(filterRow[0], columnUniqueName).value = "";
        }
    }
    masterTableView.get_filterExpressions().clear();
    masterTableView.rebind();
}
function InitiateAjaxRequest(AManager, argument) {
    var ajaxManager = $find(AManager);
    ajaxManager.ajaxRequest(argument);
}
function ClearSelectedItems(RGrid) {
    var grid = $find(RGrid);
    grid.clearSelectedItems();
}
//--------------------------------------------------------------------------------------------

var wnd = null;
var wnd2 = null;
//Open Window With Pop-up check
function OpenWindowPopupCheck(mypage, domain) {
    wnd = window.open('', '_blank', 'width=1,height=1,left=100000,top=100000,scrollbars=no');
    setTimeout("CheckPopupBlock()", 250);
    setTimeout("RunWindow('" + mypage + "','" + domain + "')", 500);
}

function RunWindow(mypage, domain) {
    if (!popUpsBlocked) {
        wnd2 = window.open(mypage);
    }
    else {
        radalert('O bloqueador de pop-up do navegador está ativado.<br>Para continuar adicione o seguinte endereço na lista de sites permitidos:<br><strong>' + domain + '</strong>', 500, 150, 'Mensagem');
    }
}

var popUpsBlocked = '';
function CheckPopupBlock() {
    if (!wnd) {
        //Teste para todos os Navegadores
        popUpsBlocked = true;
    }
    else if (wnd) {
        //Teste para Chrome
        setTimeout(function () {
            if (wnd.screenX == 0) {
                popUpsBlocked = true;
                wnd.close();
            }
            else {
                popUpsBlocked = false
                wnd.close();
            }
        }, 0);
    }
}

// dd/MM/yyyy Or d/M/yyyy
function isDate(arg) {
    var str = arg;
    re = /^([0-9]{1,2})\/([0-9]{1,2})\/([0-9]{4})$/;

    if (str != '') {
        if (regs = str.match(re)) {
            // day value between 1 and 31
            if (parseInt(regs[1]) < 1 || parseInt(regs[1]) > 31) {
                return false;
            }
            // month value between 1 and 12
            if (parseInt(regs[2]) < 1 || parseInt(regs[2]) > 12) {
                return false;
            }
            // year value between 1902 and 2099
            if (parseInt(regs[3]) < 1901 || parseInt(regs[3]) > 2099) {
                return false;
            }
        } else {
            return false;
        }
    }
    return true;
}
