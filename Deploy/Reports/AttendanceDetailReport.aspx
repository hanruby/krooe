<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_AttendanceDetailReport, App_Web_ewyvs0tt" title="TimeLive - Attendance Detail Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlAttendanceDetailReport.ascx" TagName="ctlAttendanceDetailReport"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAttendanceDetailReport ID="CtlAttendanceDetailReport1" runat="server" />
</asp:Content>

