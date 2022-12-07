<%@ Page Language="vb" AutoEventWireup="true" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<%@ Register Assembly="DevExpress.Web.v15.1, Version=15.1.15.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" Namespace="DevExpress.Web" TagPrefix="dx" %>









<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
	<script src="jquery.js"></script>
	<title></title>
</head>
<body>
	<script type="text/javascript">
		function OnBeginCallback(s, e) {
			var html = $(".content").html();
			htmlHidden.Set("Value", html);
			htmlHidden.Set("PageIndex", dataView.GetPageIndex());
		}
		function OnEndCallback(s, e) {
			if (htmlHidden.Get("PageIndex") != dataView.GetPageCount() - 1) {
				dataView.PerformCallback();
				return;
			}
			loadingPanel.Hide();
			button.DoClick();
		}
		function OnClick(s, e) {
			if (htmlHidden.Get("PageIndex") != dataView.GetPageCount() - 1) {
				loadingPanel.Show();
				dataView.PerformCallback();
				e.processOnServer = false;
			}
		}
	</script>
	<form id="form1" runat="server">
		<dx:ASPxHiddenField ID="HtmlHiddenField" runat="server" ClientInstanceName="htmlHidden"></dx:ASPxHiddenField>
		<div>
			<dx:ASPxDataView ID="DataViewExport" runat="server" DataSourceID="sqlData" ClientInstanceName="dataView" OnCustomCallback="ASPxDataView1_CustomCallback" ClientVisible="false" PageIndex="0">
				<ClientSideEvents BeginCallback="OnBeginCallback" EndCallback="OnEndCallback" />
				<ContentStyle CssClass="content"></ContentStyle>
				<PagerSettings ShowNumericButtons="False"></PagerSettings>
				<ItemTemplate>
					<b>ProductID</b>:
					<asp:Label ID="ProductIDLabel" runat="server" Text='<%#Eval("ProductID")%>' />
					<br />
					<b>ProductName</b>:
					<asp:Label ID="ProductNameLabel" runat="server" Text='<%#Eval("ProductName")%>' />
					<br />
					<b>CategoryID</b>:
					<asp:Label ID="CategoryIDLabel" runat="server" Text='<%#Eval("CategoryID")%>' />
					<br />
					<b>UnitPrice</b>:
					<asp:Label ID="UnitPriceLabel" runat="server" Text='<%#Eval("UnitPrice")%>' />
					<br />
					<b>UnitsOnOrder</b>:
					<asp:Label ID="UnitsOnOrderLabel" runat="server" Text='<%#Eval("UnitsOnOrder")%>' />
					<br />
					<b>Discontinued</b>:
					<asp:Label ID="DiscontinuedLabel" runat="server" Text='<%#Eval("Discontinued")%>' />
					<br />
				</ItemTemplate>
			</dx:ASPxDataView>

			<dx:ASPxDataView ID="DataViewDisplay" runat="server" DataSourceID="sqlData">
				<PagerSettings ShowNumericButtons="False"></PagerSettings>
				<ItemTemplate>
					<b>ProductID</b>:
					<asp:Label ID="ProductIDLabel" runat="server" Text='<%#Eval("ProductID")%>' />
					<br />
					<b>ProductName</b>:
					<asp:Label ID="ProductNameLabel" runat="server" Text='<%#Eval("ProductName")%>' />
					<br />
					<b>CategoryID</b>:
					<asp:Label ID="CategoryIDLabel" runat="server" Text='<%#Eval("CategoryID")%>' />
					<br />
					<b>UnitPrice</b>:
					<asp:Label ID="UnitPriceLabel" runat="server" Text='<%#Eval("UnitPrice")%>' />
					<br />
					<b>UnitsOnOrder</b>:
					<asp:Label ID="UnitsOnOrderLabel" runat="server" Text='<%#Eval("UnitsOnOrder")%>' />
					<br />
					<b>Discontinued</b>:
					<asp:Label ID="DiscontinuedLabel" runat="server" Text='<%#Eval("Discontinued")%>' />
					<br />
				</ItemTemplate>
			</dx:ASPxDataView>
			<dx:ASPxButton ID="Button" runat="server" Text="Download" OnClick="Button1_Click" ClientInstanceName="button">
				<ClientSideEvents Click="OnClick" />
			</dx:ASPxButton>
			<dx:ASPxLoadingPanel ID="LoadingPanel" runat="server" ClientInstanceName="loadingPanel"></dx:ASPxLoadingPanel>
			<asp:SqlDataSource ID="sqlData" runat="server"
				ConnectionString="<%$ ConnectionStrings:NORTHWINDConnectionString %>"
				SelectCommand="SELECT [ProductID], [ProductName], [CategoryID], [UnitPrice], [UnitsOnOrder], [Discontinued] FROM [Products]" />
		</div>
	</form>
</body>
</html>