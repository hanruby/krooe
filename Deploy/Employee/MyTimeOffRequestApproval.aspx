<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_MyTimeOffRequestApproval, App_Web_pv0uxbk0" title="Time Off Approval" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlTimeOffRequestApproval.ascx" TagName="ctlTimeOffRequestApproval"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlTimeOffRequestApproval ID="CtlTimeOffRequestApproval1" runat="server" />
</asp:Content>

