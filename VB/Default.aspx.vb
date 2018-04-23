Imports Microsoft.VisualBasic
Imports DevExpress.XtraRichEdit
Imports System
Imports System.IO
Imports System.Web.UI

Partial Public Class _Default
	Inherits System.Web.UI.Page
	Public Property Html() As String
		Get
			Return TryCast(Session("Html"), String)
		End Get
		Set(ByVal value As String)
			Session("Html") = value
		End Set
	End Property
	Protected Sub Page_Load(ByVal sender As Object, ByVal e As EventArgs)
		If (Not IsPostBack) Then
			Html = String.Empty
		End If
	End Sub
	Private Sub WriteToResponse(ByVal text As String)
		Using server As New RichEditDocumentServer()
			Using stream As New MemoryStream()
				server.HtmlText = text
				server.ExportToPdf(stream)

				stream.WriteTo(Response.OutputStream)

				Page.Response.ContentType = "application/pdf"
				Page.Response.AddHeader("Content-Disposition", "attachment; filename=dataview.pdf")
				Page.Response.End()
			End Using

		End Using
	End Sub
	Protected Sub Button1_Click(ByVal sender As Object, ByVal e As EventArgs)
		WriteToResponse(Html)
	End Sub
	Protected Sub ASPxDataView1_CustomCallback(ByVal sender As Object, ByVal e As DevExpress.Web.ASPxClasses.CallbackEventArgsBase)
		Html += CStr(HtmlHiddenField.Get("Value"))
		Dim pageIndex As Integer = Convert.ToInt32(HtmlHiddenField.Get("PageIndex"))
		If pageIndex <> DataViewExport.PageCount - 1 Then
			DataViewExport.PageIndex += 1
			HtmlHiddenField.Set("PageIndex", pageIndex)
			pageIndex += 1
		End If
	End Sub
End Class