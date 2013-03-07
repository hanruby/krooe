<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_DepartmentWiseTimesheetReport, App_Web_m2vvsnbz" title="TimeLive - Department Wise Timesheet Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlDepartmentWiseTimesheetReport.ascx" TagName="ctlDepartmentWiseTimesheetReport"
    TagPrefix="uc1" %>



<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlDepartmentWiseTimesheetReport ID="CtlDepartmentWiseTimesheetReport1" runat="server" />

</asp:Content>

