<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_ProjectExpenseDetailReport, App_Web_m2vvsnbz" title="TimeLive - Project Expense Detail Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlProjectExpenseDetailReport.ascx" TagName="ctlProjectExpenseDetailReport"
    TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlProjectExpenseDetailReport id="CtlProjectExpenseDetailReport1" runat="server">
    </uc1:ctlProjectExpenseDetailReport>
</asp:Content>

