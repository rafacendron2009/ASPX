<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testeQueryString.aspx.vb" Inherits="testeQueryString" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
            <telerik:RadGrid ID="RadGrid1" runat="server" Culture="pt-BR" DataSourceID="SqlDataSource1">
<GroupingSettings CollapseAllTooltip="Collapse all groups"></GroupingSettings>
                <MasterTableView AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1">
                    <Columns>
                        <telerik:GridBoundColumn DataField="id" DataType="System.Int32" FilterControlAltText="Filter id column" HeaderText="id" ReadOnly="True" SortExpression="id" UniqueName="id">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="nome" FilterControlAltText="Filter nome column" HeaderText="nome" SortExpression="nome" UniqueName="nome">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="email" FilterControlAltText="Filter email column" HeaderText="email" SortExpression="email" UniqueName="email">
                        </telerik:GridBoundColumn>
                        <telerik:GridBoundColumn DataField="idade" DataType="System.Int32" FilterControlAltText="Filter idade column" HeaderText="idade" SortExpression="idade" UniqueName="idade">
                        </telerik:GridBoundColumn>
                    </Columns>
                </MasterTableView>
            </telerik:RadGrid>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rafaelConnectionString %>" SelectCommand="SELECT * FROM [users] WHERE ([id] = @id)">
                <SelectParameters>
                    <asp:QueryStringParameter DefaultValue="0" Name="id" QueryStringField="iduser" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>

        </div>
    </form>
    </body>
</html>

