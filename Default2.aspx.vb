
Imports System.Data.SqlClient
Imports AcessarDados
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub BtLogar_Click(sender As Object, e As EventArgs) Handles BtLogar.Click

        Using Conexao = New SqlConnection(ConnString)
            Conexao.Open()
            Dim adapter As New SqlDataAdapter
            adapter.SelectCommand = New SqlCommand("Select id from  dbo.usuarios where usuario=@0 and password=@1", Conexao)
            adapter.SelectCommand.Parameters.AddWithValue("@0", user.Text)
            adapter.SelectCommand.Parameters.AddWithValue("@1", password.Text)
            Dim existe As Boolean = IIf(adapter.SelectCommand.ExecuteScalar() > 0, True, False)
            If existe = True Then

                Session("user") = user.Text
                Session("senha") = password.Text
                Response.Redirect("testeGrid.aspx")

            Else
                Response.Write(user.Text.ToUpper + " seu longin está incorreto! TENTE NOVAMENTE")

            End If

        End Using


    End Sub

    Private Sub BtCadastrar_Click(sender As Object, e As EventArgs) Handles BtCadastrar.Click
        Response.Redirect("Cadastrar.aspx")
    End Sub
End Class
