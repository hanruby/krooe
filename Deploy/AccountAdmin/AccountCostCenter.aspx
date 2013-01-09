<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountCostCenter, App_Web_yaqbagu1" title="TimeLive - Cost Center" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlAccountCostCenterList.ascx" TagName="ctlAccountCostCenterList"
    TagPrefix="uc1" %>
    
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
 <uc1:ctlAccountCostCenterList ID="CtlAccountCostCenterList1" runat="server" />
</asp:Content>

