<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_Controls_frmAccountAbsenceTypes, App_Web_ivwc32h1" title="TimeLive - Absence Types" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountAbsenceTypeList.ascx" TagName="ctlAccountAbsenceTypeList"
    TagPrefix="uc4" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
                    <uc4:ctlAccountAbsenceTypeList ID="CtlAccountAbsenceTypeList1" runat="server" />
</asp:Content>

