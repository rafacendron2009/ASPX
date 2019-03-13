

<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testeGrid.aspx.vb" Inherits="testeGrid" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="js/blockradconfirm.js"></script>
    <script src="js/util.js"></script>

<script type="text/javascript">
    <%--Pega informação do id quando clica--%>

    var nome = 'rafael';
    var CurID = '';
        function RowSelected(sender, eventArgs) {
            CurID = eventArgs.getDataKeyValue("id");
            alert(CurID);
    } 
    <%--Abre uma janeja dentro da janela principal--%>
    function abrirRadWindow(){
        OpenRadWindow('RadWindow1', 'Default.aspx', '', '', 'TEste', '90%', '90%', 'Close|Reload|Move|Maximize|Resize');
    }
    <%--PAremetros para passar chaves na URL--%>
      function abrirRadWindow2(){
        OpenRadWindow('RadWindow1', 'testeQueryString.aspx', 'iduser|usuario', ''+ CurID +'|'+ nome +'', 'TEste', '90%', '90%', 'Close|Reload|Move|Maximize|Resize');
    }
    <%--Atualiza a pagina apos gechar radWindow--%>
    function ClientClose(sender, eventArgs) {
                    RefreshGrid("RadGrid1");
            }
</script>
<style>
   
    .par{
       background-color:honeydew;
       color:black;
    }
   .impar{
       background-color:moccasin;
       color:black;
    }


</style>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>GRID 1</title>
</head>
<body>
    <form id="form1" runat="server">
        <%--Não pode esquecer--%>
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
        <telerik:RadWindow ID="RadWindow1" runat="server" OnClientClose="ClientClose"></telerik:RadWindow>
            
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>
        <%--CSS dentro da DIV do grid--%>
        <div style="width:70%; margin:0px auto ">
            <telerik:RadAjaxPanel ID="RadAjaxPanel1" runat="server" LoadingPanelID="RadAjaxLoadingPanel1">

                <center><h1>Teste Grid</h1></center>
                <asp:Button ID="Button2" runat="server" Text="Confirmação" OnClientClick ="return blockConfirm('DEseja excluir o registro?', 'Confirmação', 300, 100, this);return false" />
                <asp:Button ID="Button1" runat="server" Text="Alerta" OnClientClick="radalert('TESTE',300,100,'Mensagem');return false " />
                <asp:Button ID="Button3" runat="server" Text="Button" OnClientClick ="abrirRadWindow();return false"  />
                   <asp:Button ID="Button4" runat="server" Text="TEste Query String" OnClientClick ="abrirRadWindow2();return false"  />
                <asp:Button ID="Button5" runat="server" Text="TEste Session"  />
                
                <%--MasterTableView-EditMode="Batch" tipo de edição do grid--%>
            <telerik:RadGrid ID="RadGrid1" runat="server" MasterTableView-EditMode="batch" AllowAutomaticUpdates="True" AllowAutomaticDeletes="true" AllowFilteringByColumn="True" AllowPaging="True"  AllowSorting="True" Culture="pt-BR" DataSourceID="DS_Users" Skin="Telerik">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
               <%--alterado --%>
                <ClientSettings EnablePostBackOnRowClick="false">
                    
                    <ClientEvents  OnRowSelected="RowSelected"  />
                    <Selecting  AllowRowSelect="True"  />                 
                </ClientSettings>
                 <%-- CommandItemDisplay="TopAndBottom" menu adicionar/salvar/cancelar ADD MASTERTableView--%>
                <MasterTableView  AutoGenerateColumns="False" CommandItemDisplay="top"  DataKeyNames="id,nome" ClientDataKeyNames="id" DataSourceID="DS_Users">
                     <BatchEditingSettings EditType="Cell" />
                   <%-- edita nome forms --%>
                    <EditFormSettings>
                    <EditColumn UpdateText="Atualizar registro" CancelText="Cancelar edição"></EditColumn>
                    </EditFormSettings>
            
                 <%--   se o MasterTableView-EditMode="InPlace" for  Batch--%>
                        <CommandItemSettings RefreshText="Atualizar" AddNewRecordText="Adicionar Registro" SaveChangesText="Salvar registro" CancelChangesText="Cancelar edição"  />
             
                    <Columns>
                        <telerik:GridEditCommandColumn ItemStyle-HorizontalAlign="center" ButtonType="ImageButton" UniqueName="EditCommandColumn" EditText="Editar Registro" HeaderStyle-Width="50">
                        <HeaderStyle Width="50px"></HeaderStyle>
                        
                <ItemStyle HorizontalAlign="Center" ></ItemStyle>
                        </telerik:GridEditCommandColumn>
                        <%--AllowFiltering="false" remove filtro--%>
                       <%--  AutoPostBackOnFilter="true" --%>
                       <%--  ShowFilterIcon="false"(Remove filtro do filtro)--%>


                        <telerik:GridBoundColumn AllowFiltering="false" DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="ID" ReadOnly="True" SortExpression="id" UniqueName="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn AutoPostBackOnFilter="true" ShowFilterIcon="false" DataField="nome" FilterControlAltText="Filter nome column" HeaderText="NOME" SortExpression="nome" UniqueName="nome">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn    DataField="email" FilterControlAltText="Filter email column" HeaderText="EMAIL" SortExpression="email" UniqueName="email">
                        </telerik:GridBoundColumn>
                        <telerik:GridNumericColumn   DataField="idade" DataType="System.Int32" FilterControlAltText="Filter idade column" HeaderText="IDADE" SortExpression="idade" UniqueName="idade">
                        </telerik:GridNumericColumn>
                         <%--item template--%>
                       <telerik:GridTemplateColumn UniqueName="template" HeaderText="TEMPLATE">
                           <ItemTemplate>
                                <a href="http://www.google.com" target="_blank"><img width="20" src="icones/icon.png" /></a>
                                <a href="http://www.youtube.com" target="_blank"><img width="20" src="icones/music.png" /></a>
                           </ItemTemplate>
                            <%--edita template quando clicado --%>
                         <EditItemTemplate>
                                   <%#Eval("idade")%> <%#Eval(" email")%>
                             <a href="http://www.google.com" target="_blank"><img src="icones/icon.png" /></a>
                         </EditItemTemplate>
                       </telerik:GridTemplateColumn>

                        <telerik:GridButtonColumn ConfirmText="Deseja excluir esse registro?" 
                            ConfirmDialogType="RadWindow" ConfirmDialogHeight="125" 
                            ConfirmTitle="Excluir" ButtonType="ImageButton" CommandName="Delete" 
                            Text="Excluir Registro" UniqueName="DeleteColumn">
                        </telerik:GridButtonColumn>
                    </Columns>
                    <%--Descrição botões do GRID--%>
                    <PagerStyle AlwaysVisible="True" FirstPageToolTip="Primeira Página" LastPageToolTip="Última Página" 
                                NextPagesToolTip="Próxima Página" NextPageToolTip="Próxima Página" 
                                PagerTextFormat="Alterar página: {4} &amp;nbsp;Página &lt;strong&gt;{0}&lt;/strong&gt; de &lt;strong&gt;{1}&lt;/strong&gt;, itens &lt;strong&gt;{2}&lt;/strong&gt; até &lt;strong&gt;{3}&lt;/strong&gt; de &lt;strong&gt;{5}&lt;/strong&gt;." 
                                PageSizeLabelText="Tamanho da Página:" PrevPagesToolTip="Páginas Anteriores" 
                                PrevPageToolTip="Página Anterior" />
                    <%--<PagerStyle FirstPageText="primeira pagina "  NextPageText="proxima pagina" PrevPageText="Voltar pagina "  LastPageText="proxima pagina" />--%>
            </MasterTableView>
                
                            </telerik:RadGrid>
                </telerik:RadAjaxPanel>
        </div>
        <asp:SqlDataSource ID="DS_Users" runat="server" OldValuesParameterFormatString="original_{0}" ConnectionString="<%$ ConnectionStrings:rafaelConnectionString %>"
            SelectCommand="SELECT * FROM [users]"
            DeleteCommand="DELETE FROM [users] WHERE [id] = @original_id"
            InsertCommand="INSERT INTO [users] ([nome], [email], [idade]) VALUES (@nome, @email, @idade)"
            UpdateCommand="UPDATE [users] SET [nome] = @nome, [email] = @email, [idade] = @idade WHERE [id] = @original_id">
            <DeleteParameters>
                <asp:Parameter Name="id" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="idade" Type="Int32" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="nome" Type="String" />
                <asp:Parameter Name="email" Type="String" />
                <asp:Parameter Name="idade" Type="Int32" />
                <asp:Parameter Name="original_id" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>
