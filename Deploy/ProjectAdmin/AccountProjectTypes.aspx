<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountProjectTypes, App_Web_1c4dlxqz" title="TimeLive - Project Types" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountProjectTypeList.ascx" TagName="ctlAccountProjectTypeList"
    TagPrefix="uc1" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountProjectTypeList ID="CtlAccountProjectTypeList1" runat="server" />
                    
</asp:Content>

