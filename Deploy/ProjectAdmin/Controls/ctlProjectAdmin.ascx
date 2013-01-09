<%@ control language="VB" autoeventwireup="false" inherits="ProjectAdmin_Controls_ctlProjectAdmin, App_Web_wln1wvyv" %>
<%@ Register Src="ctlAccountProjectForm.ascx" TagName="ctlAccountProjectForm" TagPrefix="uc1" %>
<table class="xFormView" style="width: 352px; height: 1px" cellpadding=0 cellspacing=0 class="FormViewTable">
    <tbody>
        <tr>
            <td class="caption" colspan="2">
                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Project Administration%> " /></td>
        </tr>
        <tr>
            <td class="FormViewsubheader" colspan="2" style="height: 21px">
                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Select Option%> " /></td>
        </tr>
        <tr>
            <td  colspan="2" style="height: 14px">


<table>
    <tr>
        <td style="width: 76px; height: 19px;" align="center">
            &nbsp;<asp:HyperLink ID="HyperLinkProjectMilestone" runat="server" ImageUrl="~/Images/ProjectMilestone.gif"
                ToolTip="<%$ Resources:TimeLive.Web, Project Milestone%> ">HyperLink</asp:HyperLink></td>
    </tr>
    <tr>
        <td style="width: 76px; height: 41px;" align="center" class="AdministrationOptionsText" valign="top">
            <asp:HyperLink ID="TextHyperlinkProjectMilestone" runat="server" ToolTip="<%$ Resources:TimeLive.Web, Project Milestone%> "><asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Project Milestones%> " /></asp:HyperLink></td>
    </tr>
</table>
            </td>
        </tr>
    </tbody>
</table>
<br />

<uc1:ctlAccountProjectForm ID="CtlAccountProjectForm1" runat="server" />
