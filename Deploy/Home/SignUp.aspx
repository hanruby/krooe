<%@ page language="VB" masterpagefile="~/Masters/MasterPageBase.master" autoeventwireup="false" inherits="Home_SignUp, App_Web_ccg5dxg5" title="Krooe - New Account" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlProductsDetail.ascx" TagName="ctlProductsDetail" TagPrefix="uc5" %>
<%@ Register Src="Controls/ctlFullFeatureListIcon.ascx" TagName="ctlFullFeatureListIcon"
    TagPrefix="uc6" %>
<%@ Register Src="Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc7" %>
<%@ Register Src="Controls/ctlFeaturesIcon.ascx" TagName="ctlFeaturesIcon" TagPrefix="uc4" %>
<%@ Register Src="Controls/ctlFeatures.ascx" TagName="ctlFeatures" TagPrefix="uc3" %>
<%@ Register Src="Controls/ctlOffersl.ascx" TagName="ctlOffersl" TagPrefix="uc2" %>
<%@ Register Src="Controls/ctlSignUp.ascx" TagName="ctlSignUp" TagPrefix="uc1" %>
<asp:Content ID="C2" ContentPlaceHolderID="C" Runat="Server">
	<tr>
    <p>Sign up as either a user under an account or create an account project yourself by selecting create account next to account name.</p>
    <p>Administrator has full access to create and distribute tasks and milestones, while a user only has access to enter time to tasks assigned.</p>
	    <td valign=top width="100%"><uc1:ctlSignUp ID="CtlSignUp1" runat="server" /></td>
    </tr>    
</asp:Content>

