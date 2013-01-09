<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_frmAccountProjectTaskAttachments, App_Web_1c4dlxqz" title="Untitled Page" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountProjectTaskAttachmentList.ascx" TagName="ctlAccountProjectTaskAttachmentList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountProjectTaskAttachmentList ID="CtlAccountProjectTaskAttachmentList1"
        runat="server" />
</asp:Content>

