<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default2.aspx.vb" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link href="css/mail.css" rel="stylesheet" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/all.css">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.1.0/css/v4-shims.css">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>

    <script>

    function abrirRadWindow(){
        OpenRadWindow('RadWindow1', 'Default.aspx', '', '', 'TEste', '90%', '90%', 'Close|Reload|Move|Maximize|Resize');
        }

        function ClientClose(sender, eventArgs) {
                    RefreshGrid("RadGrid1");
            }
    </script>

       <title>LOGIN</title>
</head>

<body>
    <div id="form">
	    <div id="content">
	
	 <center><div class="icon">
			<i class="material-icons">account_circle</i>
			<h4>Login</h4>
	 </div></center>
	 
    <form method="POST" id="formu" runat="server">
        <telerik:RadScriptManager ID="RadScriptManager1" runat="server"></telerik:RadScriptManager>
        <telerik:RadWindowManager ID="RadWindowManager1" runat="server"></telerik:RadWindowManager>
         <telerik:RadWindow ID="RadWindow1" runat="server" OnClientClose="ClientClose"></telerik:RadWindow>
        <telerik:RadAjaxLoadingPanel ID="RadAjaxLoadingPanel1" runat="server" Skin="Default"></telerik:RadAjaxLoadingPanel>


      	<span><i class="fas fa-user"></i>
        <asp:TextBox ID="user" placeholder="Usuario"  runat="server"></asp:TextBox><br />
        <asp:TextBox ID="password" type="password" name="pass" placeholder="Password"  runat="server"></asp:TextBox>
          
        <center><asp:Button class="button"  ID="BtLogar" runat="server" Text="Logar"  /></center>
        <center><asp:Button class="button"  ID="BtCadastrar" runat="server" Text="Cadastrar" OnClientClick ="abrirRadWindow();return false" /></center>   

		</form>
		</div>
</div>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rafaelConnectionString %>" SelectCommand="SELECT * FROM [usuarios]"></asp:SqlDataSource>
		
</body>
</html>
