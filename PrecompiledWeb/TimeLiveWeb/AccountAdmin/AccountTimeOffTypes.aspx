<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountTimeOffTypes, App_Web_ivwc32h1" title="TimeLive - Time Off Types" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTimeOffTypeList.ascx" TagName="ctlAccountTimeOffTypeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTimeOffTypeList ID="CtlAccountTimeOffTypeList1" runat="server" />
</asp:Content>

