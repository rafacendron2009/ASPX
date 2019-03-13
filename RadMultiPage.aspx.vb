
Partial Class RadMultiPage

    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not String.IsNullOrEmpty(Request.QueryString("page")) Then
            RadPageView1.ContentUrl = Request.QueryString("page")
        End If
    End Sub
    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        RadPageView1.ContentUrl = "Cadastrar.aspx"
    End Sub
    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        RadPageView1.ContentUrl = "testeGrid.aspx"
    End Sub
    Protected Sub Button3_Click(sender As Object, e As EventArgs) Handles Button3.Click
        RadPageView1.ContentUrl = "Default2.aspx"
    End Sub
End Class
