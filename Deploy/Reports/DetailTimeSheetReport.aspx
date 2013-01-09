<%@ page language="VB" masterpagefile="~/Masters/MasterPageWithoutLeftNavigation.master" autoeventwireup="false" inherits="Reports_DetailTimeSheetReport, App_Web_ewyvs0tt" title="TimeLive - Detail TimeSheet Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlDetailTimeSheetReport.ascx" TagName="ctlDetailTimeSheetReport"
    TagPrefix="uc1" %>
<asp:Content ID="C1" ContentPlaceHolderID="CB" Runat="Server">
    <uc1:ctlDetailTimeSheetReport id="CtlDetailTimeSheetReport1" runat="server">
    </uc1:ctlDetailTimeSheetReport>
</asp:Content>

