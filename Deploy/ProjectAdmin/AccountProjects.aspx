<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountProjects, App_Web_1c4dlxqz" title="TimeLive - Projects" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountProjectForm.ascx" TagName="ctlAccountProjectForm"
    TagPrefix="uc2" %>

<%@ Register Src="Controls/ctlAccountProjectList.ascx" TagName="ctlAccountProjectList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountProjectList ID="CtlAccountProjectList1" runat="server" />
    <uc2:ctlAccountProjectForm id="CtlAccountProjectForm1" runat="server">
    </uc2:ctlAccountProjectForm>
</asp:Content>

