<%@ Page Language="VB" MasterPageFile="~/Masters/MasterPageBase.master" AutoEventWireup="false" CodeFile="PasswordReset.aspx.vb" Inherits="Authenticate_PasswordReset" title="TimeLive - Reset Password" %>
<%@ Register Src="Controls/ctlPasswordReset.ascx" TagName="ctlPasswordReset" TagPrefix="uc1" %>
<%@ Register Src="~/Home/Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc7" %>
<asp:Content ID="C2" ContentPlaceHolderID="C" Runat="Server">
	<tr>
	    <td valign=top width="100%"><uc1:ctlPasswordReset ID="ctlPasswordReset1" runat="server" /></td>
    </tr>  
</asp:Content>

