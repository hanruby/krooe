<%@ page language="VB" masterpagefile="~/Masters/MasterPageBase.master" autoeventwireup="false" inherits="Authenticate_PasswordChange, App_Web_visrau4c" title="Timelive - Change Password" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<%@ Register Src="Controls/ctlPasswordChange.ascx" TagName="ctlPasswordChange" TagPrefix="uc1" %>
<%@ Register Src="~/Home/Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc7" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C" Runat="Server">
<tr>
	    <td valign=top width="100%"><uc1:ctlPasswordChange ID="ctlPasswordChange1" runat="server" /></td>
    </tr>  
</asp:Content>

