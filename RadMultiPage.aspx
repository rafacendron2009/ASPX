<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RadMultiPage.aspx.vb" Inherits="RadMultiPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script>

    // função para  redimencionar pagina dentro do radMultiPage
        function pageLoad() {
            var $ = $telerik.$;
            var height = $(window).height();
            var multiPage = $find("RadMultiPage1");
            //Altura Total da Pagina menos altura do menu 
            //Menos altura do Menu BreadCrumb
            var totalHeight = height - 50;
            multiPage.get_element().style.height = totalHeight + "px";
        }



    </script>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>



        <div>
            <asp:Button ID="Button1" runat="server" Text="CADASTRAR" />
            <asp:Button ID="Button2" runat="server" Text="GRID" />
            <asp:Button ID="Button3" runat="server" Text="LOGIN" />

            <telerik:RadTabStrip ID="RadTabStrip1" runat="server" MultiPageID="RadMultiPage1" CausesValidation="False" SelectedIndex="1">
                <Tabs>
                    <telerik:RadTab runat="server" Text="Grid" PageViewID="RadPageView1" Value="1" Selected="True"></telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Autorizações sem Notas Lançadas" PageViewID="RadPageView2" Value="2"></telerik:RadTab>
                    <telerik:RadTab runat="server" Text="Autorizações sem Notas Lançadas" PageViewID="RadPageView3" Value="2"></telerik:RadTab>
                </Tabs>
            </telerik:RadTabStrip>

            <telerik:RadMultiPage Width="100%" Height="100%" ID="RadMultiPage1" SelectedIndex="0" runat="server">

                <telerik:RadPageView Height="100%" runat="server" ID="RadPageView1">
                    <div style="border: 1px solid #CCCCCC; padding: 10px">
                    </div>
                </telerik:RadPageView>


                <telerik:RadPageView Height="100%" runat="server" ID="RadPageView2">
                    <div style="border: 1px solid #CCCCCC; padding: 10px">
                        <telerik:RadGrid ID="RadGrid1" runat="server" AllowPaging="True" AllowSorting="True" Culture="pt-BR" DataSourceID="SqlDataSource1">
                            <GroupingSettings CollapseAllTooltip="Collapse all groups" />
                            <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                                <Columns>
                                    <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="usuario" FilterControlAltText="Filter usuario column" HeaderText="usuario" SortExpression="usuario" UniqueName="usuario">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="password" FilterControlAltText="Filter password column" HeaderText="password" SortExpression="password" UniqueName="password">
                                    </telerik:GridBoundColumn>
                                    <telerik:GridBoundColumn DataField="data" DataType="System.DateTime" FilterControlAltText="Filter data column" HeaderText="data" SortExpression="data" UniqueName="data">
                                    </telerik:GridBoundColumn>

                                </Columns>
                            </MasterTableView>
                        </telerik:RadGrid>

                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rafaelConnectionString %>" SelectCommand="SELECT * FROM [usuarios]"></asp:SqlDataSource>

                    </div>

                </telerik:RadPageView>
                <telerik:RadPageView Height="100%" runat="server" ID="RadPageView3">
                    <div style="border: 1px solid #CCCCCC; padding: 10px">
                        
                       
                    </div>
                </telerik:RadPageView>
            </telerik:RadMultiPage>
        </div>
    </form>
</body>
</html>
