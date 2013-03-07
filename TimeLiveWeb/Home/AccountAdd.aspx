    <%@ Page Language="VB" MasterPageFile="~/Masters/MasterPageBase.master"  AutoEventWireup="false" CodeFile="AccountAdd.aspx.vb" Inherits="Home_AccountAdd" title="Krooe - New Account"  %>

<%@ Register Src="Controls/ctlProductsDetail.ascx" TagName="ctlProductsDetail" TagPrefix="uc5" %>
<%@ Register Src="Controls/ctlFullFeatureListIcon.ascx" TagName="ctlFullFeatureListIcon"
    TagPrefix="uc6" %>
<%@ Register Src="Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc7" %>


<%@ Register Src="Controls/ctlFeaturesIcon.ascx" TagName="ctlFeaturesIcon" TagPrefix="uc4" %>

<%@ Register Src="Controls/ctlFeatures.ascx" TagName="ctlFeatures" TagPrefix="uc3" %>

<%@ Register Src="Controls/ctlOffersl.ascx" TagName="ctlOffersl" TagPrefix="uc2" %>


<%@ Register Src="Controls/ctlaccountform.ascx" TagName="ctlaccountform" TagPrefix="uc1" %>


<asp:Content ID="C2" ContentPlaceHolderID="C" Runat="Server">
   
        
	<tr>
	    <td valign=top width="100%"><uc1:ctlaccountform ID="Ctlaccountform1" runat="server" /></td>
    </tr>    
    
</asp:Content>

