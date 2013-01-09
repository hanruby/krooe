<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="WebReport_MyReports, App_Web_zg10hi0a" title="TimeLive - My Reports" enableviewstate="true" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<%@ Register Src="Reports/Controls/ctlMyReports.ascx" TagName="ctlMyReports" TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlMyReports ID="CtlMyReports1" runat="server" />



</asp:Content>


