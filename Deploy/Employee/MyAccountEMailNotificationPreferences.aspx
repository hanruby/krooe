<%@ page language="VB" masterpagefile="~/Masters/MasterPageemployee.master" autoeventwireup="false" inherits="My_AccountEMailNotificationPreferences, App_Web_pv0uxbk0" title="TimeLive - Email Notification Preferences" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlMyAccountEMailNotificationPreferenceList.ascx" TagName="ctlMyAccountEMailNotificationPreferenceList"
    TagPrefix="uc2" %>

<%@ Register Src="Controls/ctlAccountEMailNotificationPreferenceList.ascx" TagName="ctlAccountEMailNotificationPreferenceList"
    TagPrefix="uc1" %>
    
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    
    <uc2:ctlMyAccountEMailNotificationPreferenceList ID="CtlMyAccountEMailNotificationPreferenceList1"
        runat="server" />
</asp:Content>

