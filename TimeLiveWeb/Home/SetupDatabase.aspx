<%@ Page Language="VB" MasterPageFile="~/Masters/MasterPageBase.master" AutoEventWireup="false" CodeFile="SetupDatabase.aspx.vb" Inherits="Home_SetupDatabase" title="TimeLive - Setup Database" %>

<%@ Register Src="Controls/ctlSetupDataBase.ascx" TagName="ctlSetupDataBase" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C" Runat="Server">
	<tr>
	    <td valign="top" width="100%" colspan="2"><uc1:ctlSetupDataBase ID="ctlSetupDataBase1" runat="server"/></td>
    </tr> 
</asp:Content>


