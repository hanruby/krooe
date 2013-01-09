<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_EmployeeTimeEntryReport, App_Web_ewyvs0tt" title="TimeLive - Task Billing By Projects/Clients" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlEmployeeTimeEntry.ascx" TagName="ctlEmployeeTimeEntry"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlEmployeeTimeEntry id="CtlEmployeeTimeEntry1" runat="server">
    </uc1:ctlEmployeeTimeEntry>
</asp:Content>

