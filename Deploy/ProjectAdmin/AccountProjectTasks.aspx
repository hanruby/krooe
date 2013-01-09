<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountProjectTasks, App_Web_1c4dlxqz" title="TimeLive - Tasks" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountProjectTaskForm.ascx" TagName="ctlAccountProjectTaskForm"
    TagPrefix="uc2" %>

<%@ Register Src="Controls/ctlAccountProjectTaskList.ascx" TagName="ctlAccountProjectTaskList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountProjectTaskList id="CtlAccountProjectTaskList1" runat="server" EnableViewState="true">
    </uc1:ctlAccountProjectTaskList>
    <uc2:ctlAccountProjectTaskForm ID="CtlAccountProjectTaskForm1" runat="server" EnableViewState="true" />
</asp:Content>

