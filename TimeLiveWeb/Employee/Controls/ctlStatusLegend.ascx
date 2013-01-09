<%@ Control Language="VB" AutoEventWireup="false" CodeFile="ctlStatusLegend.ascx.vb" Inherits="Employee_Controls_ctlStatusLegend" %>
<table class="xFormView" width="475">
    <tr>
        <td class="FormViewSubHeader" colspan="11">
            <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Status Legend%> "></asp:Literal></td>
    </tr>
    <tr>
        <td style="font-weight: bold; width: 100px">
            &nbsp;<asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Not Submitted:%> "></asp:Literal></td>
        <td valign="middle">
            <asp:Image ID="Image1" runat="server" ImageAlign="AbsMiddle" AlternateText="" ImageUrl="~/Images/NotSubmittedStatus.gif"
                Width="10px" /></td>
        <td>
            <asp:Image ID="Image3" runat="server" ImageAlign="AbsMiddle" AlternateText="" ImageUrl="~/Images/clearpixel.gif"
                Width="5px" /></td>
        <td style="font-weight: bold; width: 70px">
            <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Submitted:%> "></asp:Literal></td>
        <td valign="middle">
            <asp:Image ID="Image2" runat="server" ImageAlign="AbsMiddle" AlternateText="" ImageUrl="~/Images/SubmittedStatus.gif"
                Width="10px" /></td>
        <td>
            <asp:Image ID="Image4" runat="server" ImageAlign="AbsMiddle" AlternateText="" ImageUrl="~/Images/clearpixel.gif"
                Width="5px" /></td>
        <td style="font-weight: bold; width: 75px">
            <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Approved:%> "></asp:Literal></td>
        <td valign="middle">
            <asp:Image ID="Image5" runat="server" ImageAlign="AbsMiddle" AlternateText="" ImageUrl="~/Images/ApprovedStatus.gif"
                Width="10px" /></td>
        <td>
            <asp:Image ID="Image7" runat="server" ImageAlign="AbsMiddle" AlternateText="" ImageUrl="~/Images/clearpixel.gif"
                Width="5px" /></td>
        <td style="font-weight: bold; width: 60px">
            <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Rejected:%> "></asp:Literal></td>
        <td valign="middle">
            <asp:Image ID="Image6" runat="server" ImageAlign="AbsMiddle" AlternateText="" ImageUrl="~/Images/RejectedStatus.gif"
                Width="10px" /></td>
    </tr>
</table>
