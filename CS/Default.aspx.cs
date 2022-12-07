using DevExpress.XtraRichEdit;
using System;
using System.IO;
using System.Web.UI;

public partial class _Default : System.Web.UI.Page {
    public string Html {
        get {
            return Session["Html"] as string;
        }
        set {
            Session["Html"] = value;
        }
    }
    protected void Page_Load(object sender, EventArgs e) {
        if (!IsPostBack)
            Html = string.Empty;
    }
    private void WriteToResponse(string text) {
        using (RichEditDocumentServer server = new RichEditDocumentServer()) {
            using (MemoryStream stream = new MemoryStream()) {
                server.HtmlText = text;
                server.ExportToPdf(stream);

                stream.WriteTo(Response.OutputStream);

                Page.Response.ContentType = "application/pdf";
                Page.Response.AddHeader("Content-Disposition", "attachment; filename=dataview.pdf");
                Page.Response.End();
            }

        }
    }
    protected void Button1_Click(object sender, EventArgs e) {
        WriteToResponse(Html);
    }
    protected void ASPxDataView1_CustomCallback(object sender, DevExpress.Web.CallbackEventArgsBase e) {
        Html += (string)HtmlHiddenField.Get("Value");
        int pageIndex = Convert.ToInt32(HtmlHiddenField.Get("PageIndex"));
        if (pageIndex != DataViewExport.PageCount - 1) {
            DataViewExport.PageIndex++;
            HtmlHiddenField.Set("PageIndex", pageIndex++);
        }
    }
}