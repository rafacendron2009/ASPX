<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Cadastrar.aspx.vb" Inherits="Default3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <fieldset>

<!-- Form Name -->
<legend><h1>Cadastra usuario</h1></legend>


<center><div class="form-group">
  <asp:Label ID="Label1" runat="server" Text="USUARIO"></asp:Label>
  <div class="col-md-2">
   <asp:TextBox ID="Tbuser" placeholder="Digite nome um usuario" runat="server"></asp:TextBox>
  </div>
</div></center>
                <br />
<center><div class="form-group">
  <asp:Label ID="Label2" runat="server" Text="SEHHA"></asp:Label>
  <div class="col-md-2">
   <asp:TextBox ID="tbSenha" type="password" placeholder="Digite uma senha" runat="server"></asp:TextBox>
  </div>
</div></center>
<br />
<center><div class="form-group">
  <asp:Label ID="Label3" runat="server"  Text="CONFIRMAR SENHA"></asp:Label>
  <div class="col-md-2">
   <asp:TextBox ID="TbCSenha" type="password" placeholder="Confirme sua senha" runat="server" Width="161px"></asp:TextBox>
  </div>
</div></center>

 <br />
<center><asp:Button ID="BtSalvar" runat="server" Text="Salvar" /><asp:Button ID="BtLimpar" runat="server" Text="Limpar" /></center>

<br />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:rafaelConnectionString %>"
                    DeleteCommand="DELETE FROM [usuarios] WHERE [id] = @id"
                    InsertCommand="INSERT INTO [usuarios] ([usuario], [password], [data]) VALUES (@usuario, @password, @data)"
                    SelectCommand="SELECT * FROM [usuarios]"
                    UpdateCommand="UPDATE [usuarios] SET [usuario] = @usuario, [password] = @password, [data] = @data WHERE [id] = @id">
                    <DeleteParameters>
                        <asp:Parameter Name="id" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="usuario" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="data" Type="DateTime" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="usuario" Type="String" />
                        <asp:Parameter Name="password" Type="String" />
                        <asp:Parameter Name="data" Type="DateTime" />
                        <asp:Parameter Name="id" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
                <br /></fieldset>

        </div>
    </form>
</body>
</html>
