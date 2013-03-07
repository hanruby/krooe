<%@ page language="VB" masterpagefile="~/Masters/MasterPageMobileEmployee.master" autoeventwireup="false" inherits="Mobile_AccountEmployeeTimeEntryPeriodView, App_Web_mxtuh3qy" title="Period View" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeTimeEntryPeriodViewList.ascx" TagName="ctlAccountEmployeeTimeEntryPeriodViewList"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ctlAccountEmployeeTimeEntryPeriodViewList ID="CtlAccountEmployeeTimeEntryPeriodViewList1"
        runat="server" />
</asp:Content>

