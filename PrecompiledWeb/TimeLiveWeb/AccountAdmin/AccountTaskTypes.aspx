<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountTaskTypes, App_Web_ivwc32h1" title="TimeLive - Task Types" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTaskTypeList.ascx" TagName="ctlAccountTaskTypeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTaskTypeList ID="CtlAccountTaskTypeList1" runat="server" />
</asp:Content>

