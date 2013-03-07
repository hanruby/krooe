<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_LocationListReport, App_Web_m2vvsnbz" title="TimeLive - All Locations Report" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlLocationListReport.ascx" TagName="ctlLocationListReport"
    TagPrefix="uc1" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlLocationListReport ID="CtlLocationListReport1" runat="server" />
</asp:Content>

