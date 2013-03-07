<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_AccountEmployeeTimesheetSubmissionStatusReport, App_Web_m2vvsnbz" title="TimeLive - Account Employee Timesheet Submission Status Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlAccountEmployeeTimesheetSubmissionStatusReport.ascx"
    TagName="ctlAccountEmployeeTimesheetSubmissionStatusReport" TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeTimesheetSubmissionStatusReport ID="CtlAccountEmployeeTimesheetSubmissionStatusReport1"
        runat="server" />
</asp:Content>

