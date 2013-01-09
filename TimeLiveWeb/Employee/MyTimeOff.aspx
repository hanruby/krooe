<%@ Page Language="VB" MasterPageFile="~/Masters/MasterPageEmployee.master" AutoEventWireup="false" CodeFile="MyTimeOff.aspx.vb" Inherits="Employee_MyTimeOff" title="TimeLive - My Time Off" %>

<%@ Register Src="Controls/ctlMyTimeOff.ascx" TagName="ctlMyTimeOff" TagPrefix="uc1" %>
<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <uc1:ctlMyTimeOff ID="CtlMyTimeOff1" runat="server" />
</asp:Content>

