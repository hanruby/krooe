<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_ExternalUsers, App_Web_yaqbagu1" title="TimeLive - External Users" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlExternalUserList.ascx" TagName="ctlExternalUserList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlExternalUserList id="CtlExternalUserList1" runat="server">
    </uc1:ctlExternalUserList>
</asp:Content>

