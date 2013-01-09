<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="WebReport_ReportDesign, App_Web_zg10hi0a" title="TimeLive - Report Design" validaterequest="false" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Design/Controls/ctlReportDesign.ascx" TagName="ctlReportDesign"
    TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlReportDesign ID="CtlReportDesign1" runat="server" />
</asp:Content>

