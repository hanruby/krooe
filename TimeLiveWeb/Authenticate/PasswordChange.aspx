<%@ Page Language="VB" MasterPageFile="~/Masters/MasterPageBase.master" AutoEventWireup="false" CodeFile="PasswordChange.aspx.vb" Inherits="Authenticate_PasswordChange" title="Timelive - Change Password" %>
<%@ Register Src="Controls/ctlPasswordChange.ascx" TagName="ctlPasswordChange" TagPrefix="uc1" %>
<%@ Register Src="~/Home/Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C" Runat="Server">
<tr>
	    <td valign=top width="100%"><uc1:ctlPasswordChange ID="ctlPasswordChange1" runat="server" /></td>
    </tr>  
</asp:Content>

