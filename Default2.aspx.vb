
Partial Class Default2
    Inherits System.Web.UI.Page

    Protected Sub BtLogar_Click(sender As Object, e As EventArgs) Handles BtLogar.Click
        If user.Text.Equals("rafael") And password.Text.Equals("123456") Then
            Response.Write(user.Text)
            Response.Write("<br>" + password.Text)
            Response.Write("<br> LOGIN EFETUADO COM SUCESSO")
        Else
            Response.Write("ERROU")

        End If
    End Sub
End Class
