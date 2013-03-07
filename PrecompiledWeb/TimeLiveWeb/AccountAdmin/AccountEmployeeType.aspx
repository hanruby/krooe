<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountEmployeeType, App_Web_ivwc32h1" title="TimeLive - Employee Types" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeTypeList.ascx" TagName="ctlAccountEmployeeTypeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountEmployeeTypeList ID="CtlAccountEmployeeTypeList1" runat="server" />
</asp:Content>

