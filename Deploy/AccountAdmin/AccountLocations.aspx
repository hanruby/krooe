<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_frmAccountLocations, App_Web_yaqbagu1" title="TimeLive - Locations" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlAccountLocationList.ascx" TagName="ctlAccountLocationList"
    TagPrefix="uc3" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc3:ctlAccountLocationList ID="CtlAccountLocationList1" runat="server" />
    <br />
                    &nbsp;<br />
</asp:Content>