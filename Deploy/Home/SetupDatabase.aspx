<%@ page language="VB" masterpagefile="~/Masters/MasterPageBase.master" autoeventwireup="false" inherits="Home_SetupDatabase, App_Web_ccg5dxg5" title="TimeLive - Setup Database" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlSetupDataBase.ascx" TagName="ctlSetupDataBase" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="C" Runat="Server">
	<tr>
	    <td valign="top" width="100%" colspan="2"><uc1:ctlSetupDataBase ID="ctlSetupDataBase1" runat="server"/></td>
    </tr> 
</asp:Content>


