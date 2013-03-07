<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountTimeOffPoliciesDetail, App_Web_ivwc32h1" title="TimeLive - Policies Detail" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTimeOffPoliciesDetail.ascx" TagName="ctlAccountTimeOffPoliciesDetail"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTimeOffPoliciesDetail ID="CtlAccountTimeOffPoliciesDetail1" runat="server" />
</asp:Content>

