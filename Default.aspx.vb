
Imports System.Data.SqlClient
Imports AcessarDados

Partial Class _Default
    Inherits System.Web.UI.Page


    Protected Sub btnEnviar_Click(sender As Object, e As EventArgs) Handles btnEnviar.Click

        Response.Write(Nome.Text)
        Response.Write("<br>" + Email.Text)

        Using Conexao = New SqlConnection(ConnString)
            Conexao.Open()
            Dim adapter As New SqlDataAdapter
            adapter.InsertCommand = New SqlCommand("Insert Into dbo.users (nome,email) Values (@0,@1)", Conexao)
            adapter.InsertCommand.Parameters.AddWithValue("@0", Nome.Text)
            adapter.InsertCommand.Parameters.AddWithValue("@1", Email.Text)
            adapter.InsertCommand.ExecuteNonQuery()

        End Using

        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub btnDelete_Click(sender As Object, e As EventArgs) Handles btnDelete.Click

        Using Conexao = New SqlConnection(ConnString)
            Conexao.Open()
            Dim adapter As New SqlDataAdapter
            adapter.DeleteCommand = New SqlCommand("Delete from dbo.users where nome=@0", Conexao)
            adapter.DeleteCommand.Parameters.AddWithValue("@0", Nome.Text)
            adapter.DeleteCommand.ExecuteNonQuery()

        End Using
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub brnAlterar_Click(sender As Object, e As EventArgs) Handles brnAlterar.Click
        Using Conexao = New SqlConnection(ConnString)
            Conexao.Open()
            Dim adapter As New SqlDataAdapter
        End Using
        Response.Redirect("Default.aspx")
    End Sub

    Protected Sub btnSelect_Click(sender As Object, e As EventArgs) Handles btnSelect.Click
        Using Conexao = New SqlConnection(ConnString)
            Conexao.Open()
            Dim adapter As New SqlDataAdapter
            adapter.SelectCommand = New SqlCommand("Select nome from  dbo.users where nome=@0", Conexao)
            adapter.SelectCommand.Parameters.AddWithValue("@0", "henrique")
            Dim nome As String = adapter.SelectCommand.ExecuteScalar

            Response.Write(nome)

        End Using
        Response.Redirect("Default.aspx")
    End Sub
    Protected Sub btnSelect2_Click(sender As Object, e As EventArgs) Handles btnSelect2.Click
        Using Conexao = New SqlConnection(ConnString)
            Conexao.Open()
            Dim adapter As New SqlDataAdapter
            adapter.SelectCommand = New SqlCommand("Select * from  dbo.users", Conexao)
            Dim rst = adapter.SelectCommand.ExecuteReader
            While rst.Read
                Response.Write(rst("nome") + "  " + rst("email") + "<br>")
            End While
            rst.Close()
        End Using
    End Sub
    Protected Sub btnAtualizar_Click(sender As Object, e As EventArgs) Handles btnAtualizar.Click
        Using Conexao = New SqlConnection(ConnString)
            Dim idade As Integer

            Conexao.Open()
            Dim adapter As New SqlDataAdapter
            adapter.SelectCommand = New SqlCommand("Select * from  dbo.users", Conexao)
            Dim rst = adapter.SelectCommand.ExecuteReader
            While rst.Read

                idade += 2

                adapter.UpdateCommand = New SqlCommand("Update dbo.users SET idade=@0  where id=@1", Conexao)
                adapter.UpdateCommand.Parameters.AddWithValue("@0", idade)
                adapter.UpdateCommand.Parameters.AddWithValue("@1", rst("id"))
                adapter.UpdateCommand.ExecuteNonQuery()
            End While
            rst.Close()
        End Using
        Response.Redirect("Default.aspx")
    End Sub

End Class
