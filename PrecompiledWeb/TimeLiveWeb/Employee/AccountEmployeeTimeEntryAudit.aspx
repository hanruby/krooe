<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AccountEmployeeTimeEntryAudit, App_Web_v0exk3tf" title="TimeLive - Timesheet Audit" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeTimeEntryAudit.ascx" TagName="ctlAccountEmployeeTimeEntryAudit"
    TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeTimeEntryAudit ID="CtlAccountEmployeeTimeEntryAudit1" runat="server" />
</asp:Content>

