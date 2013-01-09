<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_AccountProjectTaskComments, App_Web_pv0uxbk0" title="TimeLive - Task Open" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountEmployeeTimeEntryDayView.ascx" TagName="ctlAccountEmployeeTimeEntryDayView"
    TagPrefix="uc1" %>
<%@ Register Src="Controls/ctlAccountProjectTaskCommentsList.ascx" TagName="ctlAccountProjectTaskCommentsList"
    TagPrefix="uc2" %>

<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc2:ctlAccountProjectTaskCommentsList id="CtlAccountProjectTaskCommentsList1" runat="server">
    </uc2:ctlAccountProjectTaskCommentsList>
</asp:Content>

