<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Reports_Default, App_Web_m2vvsnbz" title="All Reports" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="ControlsViewer/ctlEmployeeTimeEntry.ascx" TagName="ctlEmployeeTimeEntry"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlEmployeeTimeEntry ID="CtlEmployeeTimeEntry1" runat="server" />
</asp:Content>

