<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AccountEmployeeTimeEntryPeriodList, App_Web_v0exk3tf" title="TimeLive - Timesheet Period List" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeTimeEntryPeriodList.ascx" TagName="ctlAccountEmployeeTimeEntryPeriodList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeTimeEntryPeriodList ID="CtlAccountEmployeeTimeEntryPeriodList1"
        runat="server" />
</asp:Content>

