<%@ Page Language="VB" MasterPageFile="~/Masters/Masterpageemployee.master" AutoEventWireup="false" CodeFile="TimeExpenseBillingMain.aspx.vb" Inherits="ProjectAdmin_TimeExpenseBillingMain" title="TimeLive - Time Expense Billing" %>

<asp:Content ID="Content2" ContentPlaceHolderID="C" Runat="Server">
  
    <table cellpadding="0" cellspacing="0" class="xFormViewWithoutBorder" width="98%" id="AdminMain" border=0>
        <tbody>
            <tr>
                <td class="caption" colspan="2" style="width: 100%">
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Account Time Expense Billing %> " />
                </td>
              </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 100%;">
                    <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Time Expense Billing %> " />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100%;">
                    <table border=0 style="width: 40%" >
                         <tr>
                            <td></td>                        
                         </tr>
                    
                        <tr>
                            <td align="center" style="width: 14%; height: 48px;"  valign="top" >
                                <asp:HyperLink ID="HyperLinkProjectMilestone" runat="server" 
                                    NavigateUrl="~/ProjectAdmin/AccountTimeExpenseBilling.aspx" Width="100px"><asp:Image ID="Image3" runat="server" ImageUrl="~/Images/AbsenceDetail.gif" AlternateText="Invoice Management" /></asp:HyperLink>
                            </td>       
                            <td align="center" style="width: 14%; height: 19px">
                            </td>
                            <td align="center" style="width: 14%; height: 48px;"  valign="top">
                                <asp:HyperLink ID="HyperLinkRoles" runat=server NavigateUrl="~/ProjectAdmin/TimeBillingWorksheet.aspx"
                                    Width="100px"><asp:Image ID="Image1" runat="server" ImageUrl="~/Images/TimesheetArchieve.gif" AlternateText="Time Billing Worksheet" /> 
                                    </asp:HyperLink></td>
                            <td align="center" style="width: 14%; height: 19px">
                            </td>
                            <td align="center" style="width: 14%; height: 48px;" valign="top">
                                <asp:HyperLink ID="HyperLinkWorkingDays" runat="server" 
                                    NavigateUrl="~/ProjectAdmin/ExpenseBillingWorksheet.aspx" Width="100px"><asp:Image ID="Image2" runat="server" ImageUrl="~/Images/ExpenseArchieve.gif" AlternateText="Expense Billing Worksheet" /> </asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px;">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%;" valign="top">
                                <asp:HyperLink ID="TextHyperlinkDepartment" runat="server" NavigateUrl="~/ProjectAdmin/AccountTimeExpenseBilling.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td> 
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px" 
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%;" 
                                valign="top">
                                <asp:HyperLink ID="TextHyperlinkRoles" runat="server" NavigateUrl="~/ProjectAdmin/TimeBillingWorksheet.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td> 
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%;" 
                                valign="top">
                                <asp:HyperLink ID="TextHyperlinkWorkingDays" runat="server" NavigateUrl="~/ProjectAdmin/ExpenseBillingWorksheet.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td> 
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                            </td> 
                        </tr>
                </table>
                </td> 
                </tr> 
                </tbody>
                </table>    
</asp:Content>

