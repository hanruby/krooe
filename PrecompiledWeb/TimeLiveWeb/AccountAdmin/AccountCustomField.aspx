<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountCustomField, App_Web_ivwc32h1" title="TimeLive - Custom Field" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlAccountCustomFields.ascx" TagName="ctlAccountCustomFields"
    TagPrefix="uc1" %>
    <asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
                        <uc1:ctlAccountCustomFields ID="ctlAccountCustomFields1" runat="server" />
</asp:Content>