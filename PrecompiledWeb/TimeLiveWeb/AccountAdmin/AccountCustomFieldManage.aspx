<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AccountCustomFieldManage, App_Web_ivwc32h1" title="TimeLive - Custom Field Manage" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountCustomFieldManage.ascx" TagName="AccountCustomFieldManage"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:AccountCustomFieldManage id="AccountCustomFieldManage" runat="server">
    </uc1:AccountCustomFieldManage>
</asp:Content>

