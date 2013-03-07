<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountWorkType, App_Web_ivwc32h1" title="TimeLive - Work Type" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountWorkTypeList.ascx" TagName="ctlAccountWorkTypeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountWorkTypeList ID="CtlAccountWorkTypeList1" runat="server" />
</asp:Content>

