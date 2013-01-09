<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_MyReports, App_Web_ewyvs0tt" title="TimeLive - My Reports" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsReports/ctlMyReports.ascx" TagName="ctlMyReports" TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlMyReports ID="CtlMyReports1" runat="server" />
</asp:Content>

