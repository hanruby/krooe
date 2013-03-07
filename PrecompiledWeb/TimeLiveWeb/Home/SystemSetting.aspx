<%@ page language="VB" masterpagefile="~/Masters/MasterPageBase.master" autoeventwireup="false" inherits="Home_SystemSetting, App_Web_i5wehfxu" title="Krooe - System Settings" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlSystemSetting.ascx" TagName="ctlSystemSetting" TagPrefix="uc1" %>
<%@ Register Src="Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc4" %>

<asp:Content ID="C1" ContentPlaceHolderID="C" Runat="Server">
   
        
	<tr>
	    <td valign=top width="15%"></td>
	    <td valign=top width="85%"><uc1:ctlSystemSetting ID="CtlSystemSetting1" runat="server"/></td>
    </tr>    
    
</asp:Content>
