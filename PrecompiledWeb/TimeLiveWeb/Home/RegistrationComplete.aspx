<%@ page language="VB" masterpagefile="~/Masters/MasterPageBase.master" autoeventwireup="false" inherits="Home_Default2, App_Web_i5wehfxu" title="Krooe - Account Created Successfully" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc2" %>

<%@ Register Src="Controls/ctlOtherOffersl.ascx" TagName="ctlOtherOffersl" TagPrefix="uc1" %>

<asp:Content ID="C2" ContentPlaceHolderID="C" Runat="Server">
<tr>
	    <td valign=top width="100%">
	    
	    <table border=0 class="xFormView">

    <tr>
        <td><h3> Your Krooe Account is Ready</h3>
        <a href="Login.aspx">Login</a>
        <td>
        <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, RegistrationComplete%> " />
        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, RegistrationComplete%> " />
        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, RegistrationComplete%> " />
        </td>
        </td>
    </tr>

        </table>
	    
        </td>
</tr> 


</asp:Content>