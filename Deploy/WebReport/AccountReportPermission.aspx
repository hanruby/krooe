<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="WebReport_Permission_AccountReportPermission, App_Web_zg10hi0a" title="TimeLive - Report Permission" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Permission/Controls/ctlAccountReportPermission.ascx" TagName="ctlAccountReportPermission"
    TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountReportPermission ID="CtlAccountReportPermission1" runat="server" />
</asp:Content>

