<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountPriorities, App_Web_ivwc32h1" title="TimeLive - Priorities" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountPriorityList.ascx" TagName="ctlAccountPriorityList"
    TagPrefix="uc1" %>

<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountPriorityList id="CtlAccountPriorityList1" runat="server">
    </uc1:ctlAccountPriorityList>
</asp:Content>

