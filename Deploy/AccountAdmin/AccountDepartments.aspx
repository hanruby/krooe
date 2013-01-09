<%@ page language="VB" autoeventwireup="false" inherits="WebForms_frmAccountDepartments, App_Web_yaqbagu1" masterpagefile="~/Masters/MasterPageEmployee.master" theme="SkinFile" title="TimeLive - Departments" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlAccountDepartmentList.ascx" TagName="ctlAccountDepartmentList"
    TagPrefix="uc1" %>


<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
                        <uc1:ctlAccountDepartmentList ID="CtlAccountDepartmentList1" runat="server" />


</asp:Content>
