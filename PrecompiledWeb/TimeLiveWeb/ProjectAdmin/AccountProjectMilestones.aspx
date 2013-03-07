<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountProjectMilestones, App_Web_nvpfcf1t" title="TimeLive - Project Milestones" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountProjectMilestoneList.ascx" TagName="ctlAccountProjectMilestoneList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountProjectMilestoneList ID="CtlAccountProjectMilestoneList1" runat="server" />
</asp:Content>

