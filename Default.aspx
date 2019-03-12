<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

<style>

    div.teste{
        text-align:center;
        border:groove;
    }

    body{
        padding-top:10%;
        padding-left:10px;
        padding-right:10%;
        padding:10%;
        background-color:white;
        border:hidden;
    }

    #Text1 {
        width: 310px;
        margin-bottom: 0px;
    }

    #Nome {
        width: 177px;
    }
    #email {
        width: 178px;
    }

</style>
</head>
<body>
    
    <form id="form1" runat="server" method="post" >
        <div class="teste">
            <h1>FORMULÁRIO</h1>
            <asp:Label ID="Label1" runat="server" Text="Label">Nome</asp:Label>&nbsp;<br>
            <asp:TextBox ID="Nome" runat="server"></asp:TextBox>
            <%--<input id="Nome" type="text" placeholder="Digite seu nome" />--%>
            <br/><br />
            <asp:Label ID="lblemail" runat="server" Text="Label">Email </asp:Label>
            <br />
            <asp:TextBox ID="Email" runat="server" Width="169px"></asp:TextBox>
          
     
            
            <br /><br />
         
            

            <asp:Button ID="btnEnviar" runat="server" Text="Enviar" />
            <asp:Button ID="btnDelete" runat="server" Text="Delete" />
            <asp:Button ID="brnAlterar" runat="server" Text="Alterar" />
            <asp:Button ID="btnSelect" runat="server" Text="Select" />
             <asp:Button ID="btnSelect2" runat="server" Text="Select2" />
            <asp:Button ID="btnAtualizar" runat="server" Text="Atualizar" />
            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <br /><br />
        

            <asp:SqlDataSource ID="Rafael" runat="server" ConnectionString="<%$ ConnectionStrings:rafaelConnectionString2 %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>


        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rafaelConnectionString %>" SelectCommand="SELECT * FROM [users]"></asp:SqlDataSource>
    </form>
</body>
</html>
