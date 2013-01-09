<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountBillingTypes, App_Web_yaqbagu1" title="TimeLive - Billing Types" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountBillingTypeList.ascx" TagName="ctlAccountBillingTypeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
                    <uc1:ctlAccountBillingTypeList ID="CtlAccountBillingTypeList1" runat="server" />
   
</asp:Content>

