
Imports System.Data.SqlClient
Imports AcessarDados
Partial Class Default3
    Inherits System.Web.UI.Page

    Protected Sub BtSalvar_Click(sender As Object, e As EventArgs) Handles BtSalvar.Click
        Response.Write(TbCSenha.Text)

        If TbCSenha.Text.Equals(tbSenha.Text) And Not tbSenha.Text.Equals(" ") Or Not Tbuser.Equals(" ") Then

            Using Conexao = New SqlConnection(ConnString)
                Conexao.Open()
                Dim adapter As New SqlDataAdapter
                adapter.InsertCommand = New SqlCommand("Insert Into dbo.usuarios (usuario,password) Values (@0,@1)", Conexao)
                adapter.InsertCommand.Parameters.AddWithValue("@0", Tbuser.Text)
                adapter.InsertCommand.Parameters.AddWithValue("@1", tbSenha.Text)
                adapter.InsertCommand.ExecuteNonQuery()

            End Using

            Response.Redirect("Default2.aspx")

        Else
            Response.Redirect("Cadastrar.aspx")
        End If

    End Sub
End Class
