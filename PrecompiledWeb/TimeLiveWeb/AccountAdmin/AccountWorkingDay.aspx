<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_frmAccountWorkingDay, App_Web_ivwc32h1" title="TimeLive - Working Days" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountWorkingDayList.ascx" TagName="ctlAccountWorkingDayList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountWorkingDayList id="CtlAccountWorkingDayList1" runat="server">
    </uc1:ctlAccountWorkingDayList>
</asp:Content>

