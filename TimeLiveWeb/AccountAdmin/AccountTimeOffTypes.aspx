<%@ Page Language="VB" MasterPageFile="~/Masters/MasterPageEmployee.master" AutoEventWireup="false" CodeFile="AccountTimeOffTypes.aspx.vb" Inherits="AccountAdmin_AccountTimeOffTypes" title="TimeLive - Time Off Types" %>

<%@ Register Src="Controls/ctlAccountTimeOffTypeList.ascx" TagName="ctlAccountTimeOffTypeList"
    TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlAccountTimeOffTypeList ID="CtlAccountTimeOffTypeList1" runat="server" />
</asp:Content>

