<%@ Page Language="VB" MasterPageFile="~/Masters/MasterPageBase.master" AutoEventWireup="false" CodeFile="SystemSetting.aspx.vb" Inherits="Home_SystemSetting" title="Krooe - System Settings" %>

<%@ Register Src="Controls/ctlSystemSetting.ascx" TagName="ctlSystemSetting" TagPrefix="uc1" %>
<%@ Register Src="Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc4" %>

<asp:Content ID="C1" ContentPlaceHolderID="C" Runat="Server">
   
        
	<tr>
	    <td valign=top width="15%"></td>
	    <td valign=top width="85%"><uc1:ctlSystemSetting ID="CtlSystemSetting1" runat="server"/></td>
    </tr>    
    
</asp:Content>
