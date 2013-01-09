<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="WebReport_ShowReport, App_Web_zg10hi0a" title="TimeLive - Show Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<%@ Register Src="Reports/Controls/ctlShowReport.ascx" TagName="ctlShowReport" TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
<uc1:ctlShowReport ID="CtlShowReport1" runat="server" />

</asp:Content>

