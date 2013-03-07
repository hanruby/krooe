<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountApprovals, App_Web_ivwc32h1" title="TimeLive - Approvals" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountApprovalList.ascx" TagName="ctlAccountApprovalList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountApprovalList id="CtlAccountApprovalList1" runat="server">
    </uc1:ctlAccountApprovalList>
</asp:Content>

