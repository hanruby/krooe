<%@ page language="VB" masterpagefile="~/Masters/MasterPageBase.master" autoeventwireup="false" inherits="Home_Contact, App_Web_ccg5dxg5" title="Krooe - Contact Us" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlContactInfo.ascx" TagName="ctlContactInfo" TagPrefix="uc5" %>
<%@ Register Src="Controls/ctlSiteOptions.ascx" TagName="ctlSiteOptions" TagPrefix="uc1" %>
<%@ Register Src="Controls/ctlProductPricing.ascx" TagName="ctlProductPricing" TagPrefix="uc2" %>
<%@ Register Src="Controls/ctlProductsDetail.ascx" TagName="ctlProductsDetail" TagPrefix="uc3" %>
<%@ Register Src="Controls/ctlOfferIcon.ascx" TagName="ctlOfferIcon" TagPrefix="uc4" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolderLeftMenu" Runat="Server">
<uc4:ctlOfferIcon ID="CtlOfferIcon1" runat="server" />
</asp:Content>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">

    <table border="0" cellpadding="0" cellspacing="5" width="100%">
        <tr>
            <td style="width: 70%" valign="top">
                <table width="100%">
                    <tr>
                        <td style="width: 100%">
                            <strong>What is Krooe?</strong>&nbsp;<br />
                            <br />
                            <span class="HomePageFeatureText">Time. Tasks and Milestone System.&nbsp;</span></td>
                    </tr>
                    <tr>
                        <td style="width: 5px; height: 5px" valign="top">
                        </td>
                        <td style="width: 100%; height: 5px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top" width="100%" class="HomePageFeatureText" style="height: 146px">
                            &nbsp;<uc5:ctlContactInfo ID="CtlContactInfo1" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" valign="top" width="100%" style="height: 21px">
                        </td>
                    </tr>
                </table>
            </td>
            <td style="width: 30%">
                <uc3:ctlProductsDetail ID="CtlProductsDetail1" runat="server" />
            </td>
        </tr>
    </table>

</asp:Content>

