    <%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AccountCostCenterEmployee, App_Web_pv0uxbk0" title="TimeLive - Cost Center Employee" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlAccountCostCenterEmployee.ascx" TagName="ctlAccountCostCenterEmployee"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountCostCenterEmployee ID="ctlAccountCostCenterEmployee" runat="server" />
</asp:Content>
