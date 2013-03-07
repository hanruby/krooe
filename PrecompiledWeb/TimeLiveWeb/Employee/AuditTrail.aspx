<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AuditTrail, App_Web_v0exk3tf" title="Audit Trail" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAuditTrail.ascx" TagName="ctlAuditTrail" TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAuditTrail ID="CtlAuditTrail1" runat="server" />
</asp:Content>

