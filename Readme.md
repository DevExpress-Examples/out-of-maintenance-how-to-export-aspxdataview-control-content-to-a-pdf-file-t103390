<!-- default file list -->
*Files to look at*:

* **[Default.aspx](./CS/Default.aspx) (VB: [Default.aspx](./VB/Default.aspx))**
* [Default.aspx.cs](./CS/Default.aspx.cs) (VB: [Default.aspx.vb](./VB/Default.aspx.vb))
<!-- default file list end -->
# How to export ASPxDataView control content to a PDF file
<!-- run online -->
**[[Run Online]](https://codecentral.devexpress.com/t103390/)**
<!-- run online end -->


<p>This example demonstrates how to export ASPxDataView control content to a PDF file. Currently, ASPxDataView does not support data export, therefore we suggest a workaround with two ASPxDataViews. One of the two ASPxDataView's has <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxGridViewASPxGridView_ClientVisibletopic">ASPxDataView.ClientVisible</a> set to False and we export its data, the second ASPxDataView is only used to display data we export. In this example, we also use the ASPxHiddenField control to transfer data from the client side to the server. We handle the following events:  <a href="https://documentation.devexpress.com/#AspNet/DevExpressWebASPxDataViewASPxDataViewBase_CustomCallbacktopic">ASPxDataView.CustomCallback</a>, <a href="https://documentation.devexpress.com/AspNet/DevExpressWebASPxDataViewScriptsASPxClientDataView_BeginCallbacktopic.aspx">ASPxClientDataView.BeginCallback</a>, <a href="https://documentation.devexpress.com/AspNet/DevExpressWebASPxDataViewScriptsASPxClientDataView_EndCallbacktopic.aspx">ASPxClientDataView.EndCallback</a>, <a href="https://documentation.devexpress.com/AspNet/DevExpressWebASPxEditorsASPxButton_Clicktopic.aspx">ASPxButton.Click</a>, <a href="https://documentation.devexpress.com/AspNet/DevExpressWebASPxEditorsScriptsASPxClientButton_Clicktopic.aspx">ASPxClientButton.Click</a>.<br /><br />First, we send a callback to an invisible ASPxDataView on <a href="https://documentation.devexpress.com/AspNet/DevExpressWebASPxEditorsScriptsASPxClientButton_Clicktopic.aspx">ASPxClientButton.Click</a>, then ASPxDataView html is obtained and written to ASPxHiddenField for each page on <a href="https://documentation.devexpress.com/AspNet/DevExpressWebASPxDataViewScriptsASPxClientDataView_BeginCallbacktopic.aspx">ASPxClientDataView.BeginCallback</a>. Finally, a next callback is sent by handling the <a href="https://documentation.devexpress.com/AspNet/DevExpressWebASPxDataViewScriptsASPxClientDataView_EndCallbacktopic.aspx">ASPxClientDataView.EndCallback</a> event. The html-markup of every ASPxDataView page is first written to the session and then to a response using <a href="https://documentation.devexpress.com/#corelibraries/clsDevExpressXtraRichEditRichEditDocumentServertopic">RichEditDocumentServer</a> component on the server side.</p>

<br/>


