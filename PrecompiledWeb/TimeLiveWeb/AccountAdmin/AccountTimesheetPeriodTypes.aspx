<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountTimesheetPeriodTypes, App_Web_ivwc32h1" title="TimeLive - Timesheet Period Types" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTimesheetPeriodTypeList.ascx" TagName="ctlAccountTimesheetPeriodTypeList"
    TagPrefix="uc2" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc2:ctlAccountTimesheetPeriodTypeList ID="CtlAccountTimesheetPeriodTypeList1" runat="server" />
</asp:Content>

