<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_MyTimeOff, App_Web_pv0uxbk0" title="TimeLive - My Time Off" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlMyTimeOff.ascx" TagName="ctlMyTimeOff" TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlMyTimeOff ID="CtlMyTimeOff1" runat="server" />
</asp:Content>

