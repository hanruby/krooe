<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_DepartmentListReport, App_Web_m2vvsnbz" title="TimeLive - All Departments Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlDepartmentListReport.ascx" TagName="ctlDepartmentListReport"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlDepartmentListReport ID="CtlDepartmentListReport1" runat="server" />
</asp:Content>

