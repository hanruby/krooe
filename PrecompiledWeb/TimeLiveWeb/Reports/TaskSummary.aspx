<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_TaskSummary, App_Web_m2vvsnbz" title="TimeLive - Task Summary Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlTaskSummary.ascx" TagName="ctlTaskSummary" TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlTaskSummary ID="CtlTaskSummary1" runat="server" />
</asp:Content>

        