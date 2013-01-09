<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_frmAccountEmployeeAttendance, App_Web_pv0uxbk0" title="Untitled Page" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeAttendanceList.ascx" TagName="ctlAccountEmployeeAttendanceList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeAttendanceList ID="CtlAccountEmployeeAttendanceList1" runat="server" />
</asp:Content>

