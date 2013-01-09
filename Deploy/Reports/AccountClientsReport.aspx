<%@ page language="VB" autoeventwireup="false" masterpagefile="~/Masters/MasterPageEmployee.master" inherits="Reports_AccountClientsReport, App_Web_ewyvs0tt" title="TimeLive - All Clients Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlClientListReport.ascx" TagName="ctlClientListReport"
    TagPrefix="uc1" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
        <uc1:ctlClientListReport  ID="CtlClientListReport1" runat="server" />

</asp:Content>