<%@ Page Language="VB" MasterPageFile="~/Masters/MasterPageBase.master" AutoEventWireup="false" CodeFile="PasswordConfirm.aspx.vb" Inherits="Authenticate_PasswordConfirm" title="TimeLive - Reset Password" %>
<%@ Register Src="Controls/ctlPasswordConfirm.ascx" TagName="ctlPasswordConfirm" TagPrefix="uc1" %>
<%@ Register Src="~/Home/Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C" Runat="Server">
<tr>
	    <td valign=top width="100%"><uc1:ctlPasswordConfirm ID="ctlPasswordConfirm1" runat="server" /></td>
    </tr>  
</asp:Content>

