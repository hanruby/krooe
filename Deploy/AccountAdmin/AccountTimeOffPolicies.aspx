<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountTimeOffPolicies, App_Web_yaqbagu1" title="TimeLive - Time Off Policies" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountTimeOffPoliciesList.ascx" TagName="ctlAccountTimeOffPoliciesList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTimeOffPoliciesList ID="CtlAccountTimeOffPoliciesList1" runat="server" />
  </asp:Content>

