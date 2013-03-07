<%@ page language="VB" masterpagefile="~/Masters/MasterPageemployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountHolidaySelect, App_Web_ivwc32h1" title="TimeLive - Holiday Types" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountHolidaySelect.ascx" TagName="ctlAccountHolidaySelect"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountHolidaySelect ID="ctlAccountHolidaySelect1" runat="server" />
</asp:Content>
