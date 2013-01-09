<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_frmMyTasks, App_Web_pv0uxbk0" title="TimeLive - My Tasks" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlMyReportedTasks.ascx" TagName="ctlMyReportedTasks"
    TagPrefix="uc3" %>

<%@ Register Src="../ProjectAdmin/Controls/ctlAccountProjectTaskForm.ascx" TagName="ctlAccountProjectTaskForm"
    TagPrefix="uc2" %>

<%@ Register Src="Controls/ctlMyTasks.ascx" TagName="ctlMyTasks" TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlMyTasks ID="CtlMyTasks1" runat="server" />
    <br />
    <uc2:ctlAccountProjectTaskForm ID="CtlAccountProjectTaskForm1" runat="server" />

</asp:Content>

