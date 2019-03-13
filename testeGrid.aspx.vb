
Imports Telerik.Web.UI

Partial Class testeGrid
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If String.IsNullOrEmpty(Session("user")) Then
            Response.Redirect("Default2.aspx")
        End If

        'Pegar id lado servidor
        Dim id As Integer = 0
        If RadGrid1.SelectedItems.Count > 0 Then
            Dim dataitem As GridDataItem = RadGrid1.SelectedItems(0)
            id = dataitem.GetDataKeyValue("id")
            'Response.Write(id)
        End If


    End Sub

    Private Sub RadGrid1_ItemDataBound(sender As Object, e As GridItemEventArgs) Handles RadGrid1.ItemDataBound
        If TypeOf (e.Item) Is GridDataItem Then
            Dim dataitem As GridDataItem = e.Item
            Dim id As Integer = dataitem.GetDataKeyValue("id")
            Dim nome As String = dataitem.GetDataKeyValue("nome")
            'DEBBUG  System.Diagnostics.Debug.WriteLine(id.ToString)
            If id Mod 2 = 0 Then
                dataitem.CssClass = "par"
                'dataitem.BackColor = Drawing.Color.Beige
            Else
                dataitem.CssClass = "impar"
                'dataitem.BackColor = Drawing.Color.DarkGray

            End If
        End If
    End Sub


    Protected Sub Button2_Click(sender As Object, e As EventArgs) Handles Button2.Click
        Dim id As Integer = 0
        If RadGrid1.SelectedItems.Count > 0 Then
            Dim dataitem As GridDataItem = RadGrid1.SelectedItems(0)
            id = dataitem.GetDataKeyValue("id")
            'reconsulta forçada dos dados
            RadGrid1.Rebind()
        Else
            'injetar comando javaScript
            'Dim js As String = "radalert('Nenhum registro selecionado!',380, 170, 'Mensagem');"
            'ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "radalert", js, True)

            'Alerta com retorno 
            Dim js2 As String = "var oWnd=radalert('Nenhum registro selecionado!',380, 170, 'Mensagem'); oWnd.add_close(function() {window.open('http://www.google.com')});"
            ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "radalert", js2, True)


        End If
    End Sub
    Protected Sub Button5_Click(sender As Object, e As EventArgs) Handles Button5.Click
        Dim js As String = String.Format("radalert('{0}',380, 170, 'Mensagem');", Session("user"))
        ScriptManager.RegisterStartupScript(Me, Me.[GetType](), "radalert", js, True)

    End Sub
End Class
