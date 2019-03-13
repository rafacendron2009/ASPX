
Partial Class testeQueryString
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        Response.Write(Request.QueryString("iduser"))
        Response.Write("<br>" + Request.QueryString("usuario"))
        Response.Write("<br>" + Session("user"))
        Response.Write("<br>" + Session("senha"))
    End Sub
End Class
