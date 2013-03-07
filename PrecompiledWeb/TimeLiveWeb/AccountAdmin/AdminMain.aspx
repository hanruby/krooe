<%@ page language="VB" masterpagefile="~/Masters/MasterpageEmployee.master" autoeventwireup="false" inherits="AccountAdmin_AdminMain, App_Web_ivwc32h1" title="TimeLive - Admin Options" enableviewstate="false" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>
<asp:Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <table cellpadding="0" cellspacing="0" class="xFormViewWithoutBorder" width="98%" id="AdminMain" border=0>
        <tbody>
            <tr>
                <td class="caption" colspan="2" style="width: 100%">
                    <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Administration%> " />
                </td>
            </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:TimeLive.Web, Organization Setup%> " />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100%; height: 95px">
                    <table width="150">
                          <tr>
                            <td></td>                        
                         </tr>
                        <tr>
                           <td align="center" style="width: 10%;" valign="top">
                                <asp:HyperLink ID="HyperLink2" runat="server"
                                    NavigateUrl="~/AccountAdmin/AccountLocations.aspx" >
                                <asp:Image ID="Image4" runat="server" ImageUrl="~/Images/Locations.gif" AlternateText="Location" Width="48px" Height="48px"/></asp:HyperLink>
                           </td>
                            <td align="center" style="width: 14%; height: 19px">
                            </td>
                            <td align="center" style="width: 10%;"  valign="top" >
                                <asp:HyperLink ID="HyperLink3" runat="server" 
                                    NavigateUrl="~/AccountAdmin/AccountDepartments.aspx"  Width="100px">
                                <asp:Image ID="Image5" runat="server" ImageUrl="~/Images/Department.gif" AlternateText="Department" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 19px">
                            </td>
                            <td align="center" style="width: 10%;"  valign="top">
                                <asp:HyperLink ID="HyperLink54" runat="server" NavigateUrl="~/AccountAdmin/AccountRoles.aspx"
                                     Width="100px">
                                <asp:Image ID="Image6" runat="server" ImageUrl="~/Images/Roles.gif" AlternateText="Role" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 19px">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            <asp:HyperLink ID="HyperLink53" runat="server"  NavigateUrl="~/AccountAdmin/AccountEmployeeType.aspx"
                                   Width="100px">
                            <asp:Image ID="Image36" runat="server" ImageUrl="~/Images/EmployeeType.gif" AlternateText="Employee Type" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink65" runat="server"  NavigateUrl="~/AccountAdmin/ExternalUsers.aspx"
                                   Width="100px">
                                <asp:Image ID="Image39" runat="server" ImageUrl="~/Images/ExternalUsers.gif" AlternateText="External User" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink27" runat="server"  NavigateUrl="~/AccountAdmin/AccountWorkingDay.aspx"
                                    Width="100px">
                                <asp:Image ID="Image7" runat="server" ImageUrl="~/Images/WorkingDays.gif" AlternateText="Working Days" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink55" runat="server" NavigateUrl="~/AccountAdmin/AccountLocations.aspx"
                                    Width="100px"><asp:Literal ID="Literal10" runat="server" /></asp:HyperLink></td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink56" runat="server" NavigateUrl="~/AccountAdmin/AccountDepartments.aspx"
                                     Width="100px"><asp:Literal ID="Literal11" runat="server" /></asp:HyperLink></td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px"
                                valign="top">
                                <asp:HyperLink ID="HyperLink57" runat="server" NavigateUrl="~/AccountAdmin/AccountRoles.aspx"
                                    Width="100px"></asp:HyperLink></td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink77" runat="server" NavigateUrl="~/AccountAdmin/AccountEmployeeType.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>                                                                        
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink78" runat="server" NavigateUrl="~/AccountAdmin/ExternalUsers.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink38" runat="server" NavigateUrl="~/AccountAdmin/AccountWorkingDay.aspx"
                                    Width="100px"></asp:HyperLink> 
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            </tr>
                    </table>
                </td>
                </tr>
               
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    Application Setup
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 505px; height: 95px">
                    <table width="450">
                         <tr>                       
                         </tr>
                        <tr>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/AccountAdmin/AccountEMailNotificationPreferences.aspx"
                                    Width="100px">
                                <asp:Image ID="Image8" runat="server" ImageUrl="~/Images/EmailNotificationPreference.gif" AlternateText="Email Notification Preference" Width="48px" Height="48px"/></asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink6" runat="server"  NavigateUrl="~/AccountAdmin/AccountPagePermission.aspx"
                                    Width="100px">
                                     <asp:Image ID="Image9" runat="server" ImageUrl="~/Images/RolesPermission.gif" AlternateText="Roles Permission" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink7" runat="server"  NavigateUrl="~/AccountAdmin/AccountCurrencies.aspx"
                                    Width="100px">
                                <asp:Image ID="Image10" runat="server" ImageUrl="~/Images/AccountCurrency.gif" AlternateText="Currency" Width="48px" Height="48px"/></asp:HyperLink>  
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>                                
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink8" runat="server"  NavigateUrl="~/AccountAdmin/AccountApprovals.aspx"
                                    Width="100px">
                                <asp:Image ID="Image11" runat="server" ImageUrl="~/Images/Approvals.gif" AlternateText="Approvals" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink9" runat="server"  NavigateUrl="~/AccountAdmin/AccountTerminology.aspx"
                                   Width="100px">
                                <asp:Image ID="Image12" runat="server" ImageUrl="~/Images/ManageTerminology.gif" AlternateText="Manage Terminology" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink45" runat="server"  NavigateUrl="~/AccountAdmin/AccountPreferences.aspx"
                                   Width="100px">
                                <asp:Image ID="Image17" runat="server" ImageUrl="~/Images/AccountSetting.gif" AlternateText="Preferences" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink71" runat="server"  NavigateUrl="~/AccountAdmin/AccountStatusTypes.aspx"
                                   Width="100px">
                                <asp:Image ID="Image34" runat="server" ImageUrl="~/Images/StatusTypes.gif" AlternateText="Status Type" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/AccountAdmin/AccountEMailNotificationPreferences.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>            
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink14" runat="server" NavigateUrl="~/AccountAdmin/AccountPagePermission.aspx"
                                    Width="100px"></asp:HyperLink> 
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>

                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink15" runat="server" NavigateUrl="~/AccountAdmin/AccountCurrencies.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                               valign="top">
                          </td>

                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                              <asp:HyperLink ID="HyperLink16" runat="server" NavigateUrl="~/AccountAdmin/AccountApprovals.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink17" runat="server" NavigateUrl="~/AccountAdmin/AccountTerminology.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>                                                
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink48" runat="server" NavigateUrl="~/AccountAdmin/AccountPreferences.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>                                                                        
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink72" runat="server" NavigateUrl="~/AccountAdmin/AccountStatusTypes.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>                                                                        
                        </tr>
                        <tr>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink60" runat="server" NavigateUrl="~/AccountAdmin/AccountTaxCode.aspx"
                                    Width="100px">
                                <asp:Image ID="Image35" runat="server" ImageUrl="~/Images/TaxCode.gif" AlternateText="Tax Code" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink61" runat="server" NavigateUrl="~/AccountAdmin/AccountTaxZone.aspx"
                                    Width="100px">
                                <asp:Image ID="Image37" runat="server" ImageUrl="~/Images/TaxZone.gif" AlternateText="Tax Zone" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink11" runat="server"  NavigateUrl="~/AccountAdmin/AccountCustomField.aspx"
                                   Width="100px">
                                <asp:Image ID="Image25" runat="server" ImageUrl="~/Images/AccountCustomField.gif" AlternateText="Custom Field" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink50" runat="server"  NavigateUrl="~/AccountAdmin/AccountFeatureManagement.aspx"
                                   Width="100px">
                                <asp:Image ID="Image21" runat="server" ImageUrl="~/Images/Feature.gif" AlternateText="Feature Management" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink73" runat="server" NavigateUrl="~/AccountAdmin/AccountTaxCode.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink74" runat="server" NavigateUrl="~/AccountAdmin/AccountTaxZone.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink12" runat="server" NavigateUrl="~/AccountAdmin/AccountCustomField.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink52" runat="server" NavigateUrl="~/AccountAdmin/AccountFeatureManagement.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                        </tr>
                </table>
                </td>
                </tr>
<%  If AccountPagePermissionBLL.IsPageHasPermissionOf(136, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(113, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(147, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(149, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(1, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(118, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(122, 1) = True Then%> 
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    Timesheet Setup
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 505px; height: 95px">
                    <table width="450">
                         <tr>                       
                         </tr>
                        <tr>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink24" runat="server" NavigateUrl="~/AccountAdmin/AccountTimesheetPeriodTypes.aspx"
                                    Width="100px">
                                <asp:Image ID="Image3" runat="server" ImageUrl="~/Images/TimesheetPeriodTypes.gif" AlternateText="Timesheet Period Types" Width="48px" Height="48px"/></asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink28" runat="server"  NavigateUrl="~/AccountAdmin/TimeEntryArchive.aspx"
                                    Width="100px">
                                <asp:Image ID="Image13" runat="server" ImageUrl="~/Images/TimesheetArchieve.gif" AlternateText="Timesheet Archieve" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink29" runat="server"  NavigateUrl="~/AccountAdmin/AccountHolidayTypes.aspx"
                                   Width="100px">
                                <asp:Image ID="Image14" runat="server" ImageUrl="~/Images/HolidayCompositions.gif" AlternateText="Holiday Types" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink34" runat="server"  NavigateUrl="~/AccountAdmin/AccountHolidaySelect.aspx"
                                   Width="100px">
                                <asp:Image ID="Image15" runat="server" ImageUrl="~/Images/HolidayManagement.gif" AlternateText="Holidays" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink35" runat="server"  NavigateUrl="~/AccountAdmin/AccountAbsenceTypes.aspx"
                                    Width="100px">
                                <asp:Image ID="Image16" runat="server" ImageUrl="~/Images/AbsentType.gif" AlternateText="Absence Types" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink67" runat="server"  NavigateUrl="~/AccountAdmin/AccountWorkType.aspx"
                                    Width="100px">
                                <asp:Image ID="Image32" runat="server" ImageUrl="~/Images/WorkTypes.gif" AlternateText="Work Types" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink69" runat="server" NavigateUrl="~/AccountAdmin/AccountCostCenter.aspx"
                                    Width="100px">
                                <asp:Image ID="Image33" runat="server" ImageUrl="~/Images/CostCenter.gif" AlternateText="Cost Center" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink36" runat="server" NavigateUrl="~/AccountAdmin/AccountTimesheetPeriodTypes.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>            
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                              <asp:HyperLink ID="HyperLink41" runat="server" NavigateUrl="~/AccountAdmin/TimeEntryArchive.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink42" runat="server" NavigateUrl="~/AccountAdmin/AccountHolidayTypes.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>                                                
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink43" runat="server" NavigateUrl="~/AccountAdmin/AccountHolidaySelect.aspx"
                                Width="100px"></asp:HyperLink>
                          </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink44" runat="server" NavigateUrl="~/AccountAdmin/AccountAbsenceTypes.aspx"
                                    Width="100px"></asp:HyperLink> 
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink68" runat="server" NavigateUrl="~/AccountAdmin/AccountWorkType.aspx"
                                    Width="100px"></asp:HyperLink> 
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink70" runat="server" NavigateUrl="~/AccountAdmin/AccountCostCenter.aspx"
                                    Width="100px"></asp:HyperLink> 
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                        </tr>
                    </table>
                </td>
                </tr>
<%  End If%>
<%  If AccountPagePermissionBLL.IsPageHasPermissionOf(12, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(76, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(33, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(103, 1) = True Then%> 
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    Project / Task Setup
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 505px; height: 95px">
                    <table width="450">
                         <tr>                       
                         </tr>
                        <tr>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="~/AccountAdmin/AccountTaskTypes.aspx"
                                    Width="100px">
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/TaskTypes.gif" AlternateText="Task Types" Width="48px" Height="48px"/></asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink10" runat="server"  NavigateUrl="~/AccountAdmin/AccountPriorities.aspx"
                                    Width="100px">
                                     <asp:Image ID="Image18" runat="server" ImageUrl="~/Images/Priority.gif" AlternateText="Priority" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink49" runat="server"  NavigateUrl="~/ProjectAdmin/AccountProjectTypes.aspx"
                                    Width="100px">
                                <asp:Image ID="Image19" runat="server" ImageUrl="~/Images/ProjectTypes.gif" AlternateText="Project Types" Width="48px" Height="48px"/></asp:HyperLink>  
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>                                
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink51" runat="server"  NavigateUrl="~/ProjectAdmin/AccountProjectTemplates.aspx?IsTemplate=True"
                                    Width="100px">
                                <asp:Image ID="Image20" runat="server" ImageUrl="~/Images/ProjectTemplates.gif" AlternateText="Project Template" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink59" runat="server" NavigateUrl="~/AccountAdmin/AccountTaskTypes.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink62" runat="server" NavigateUrl="~/AccountAdmin/AccountPriorities.aspx"
                                    Width="100px"></asp:HyperLink> 
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink63" runat="server" NavigateUrl="~/ProjectAdmin/AccountProjectTypes.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                               valign="top">
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                              <asp:HyperLink ID="HyperLink64" runat="server" NavigateUrl="~/ProjectAdmin/AccountProjectTemplates.aspx?IsTemplate=True"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>
                        </tr>
                </table>
                </td>
                </tr>
<%  End If %> 
<%  If AccountPagePermissionBLL.IsPageHasPermissionOf(138, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(139, 1) = True Then%> 
                <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    Time Off Setup
                </td>
                </tr>
                <tr>
                <td colspan="2" style="width: 505px; height: 95px">
                      <table width="150">
                        <tr>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink30" runat="server"  NavigateUrl="~/AccountAdmin/AccountTimeOffTypes.aspx"
                                    Width="100px">
                                <asp:Image ID="Image28" runat="server" ImageUrl="~/Images/TimeOffTypes.gif" AlternateText="Time Off Types" Width="48px" Height="48px"/></asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink18" runat="server"  NavigateUrl="~/AccountAdmin/AccountTimeOffPolicies.aspx"
                                    Width="100px">
                                <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/TimeOffPolicy.gif" AlternateText="Time Off Policy" Width="48px" Height="48px"/></asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
                            </tr>
                            <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink37" runat="server" NavigateUrl="~/AccountAdmin/AccountTimeOffTypes.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink20" runat="server" NavigateUrl="~/AccountAdmin/AccountTimeOffPolicies.aspx" 
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
                        </tr>
                    </table>
                    </td>
                    </tr>    
<%  End If %>
<%  If AccountPagePermissionBLL.IsPageHasPermissionOf(6, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(5, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(106, 1) = True Or AccountPagePermissionBLL.IsPageHasPermissionOf(114, 1) = True Then%>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    Expense Setup
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 505px; height: 95px">
                    <table width="450">
                         <tr>                       
                         </tr>
                        <tr>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink25" runat="server" NavigateUrl="~/AccountAdmin/AccountExpenseType.aspx"
                                    Width="100px">
                                <asp:Image ID="Image22" runat="server" ImageUrl="~/Images/ExpenseType.gif" AlternateText="Expense Type" Width="48px" Height="48px"/></asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink26" runat="server"  NavigateUrl="~/AccountAdmin/AccountExpense.aspx"
                                    Width="100px">
                                     <asp:Image ID="Image23" runat="server" ImageUrl="~/Images/Expenses.gif" AlternateText="Expenses" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink40" runat="server"  NavigateUrl="~/AccountAdmin/AccountPaymentMethod.aspx"
                                   Width="100px">
                                <asp:Image ID="Image27" runat="server" ImageUrl="~/Images/PaymentMethod.gif" AlternateText="Payment Method" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink31" runat="server"  NavigateUrl="~/AccountAdmin/ExpenseEntryArchive.aspx"
                                    Width="100px">
                                <asp:Image ID="Image29" runat="server" ImageUrl="~/Images/ExpenseArchieve.gif" AlternateText="Expense Archive" Width="48px" Height="48px"/></asp:HyperLink>
                            </td>
                            <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                            </td>
                        </tr>
                        <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink32" runat="server" NavigateUrl="~/AccountAdmin/AccountExpenseType.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>            
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink33" runat="server" NavigateUrl="~/AccountAdmin/AccountExpense.aspx"
                                    Width="100px"></asp:HyperLink> 
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink47" runat="server" NavigateUrl="~/AccountAdmin/AccountPaymentMethod.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>                                                
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="~/AccountAdmin/ExpenseEntryArchive.aspx"
                                    Width="100px"></asp:HyperLink> 
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                              valign="top">
                          </td>
                        </tr>
                    </table>
                </td>
                </tr>
<%  End If%>
<%  If AccountPagePermissionBLL.IsPageHasPermissionOf(2, 1) = True Then%>
             <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    Billing Setup
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100%; height: 95px">
                    <table width="150">
                        <tr>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink58" runat="server"  NavigateUrl="~/AccountAdmin/AccountBillingTypes.aspx"
                                    Width="100px">
                                    <asp:Image ID="Image24" runat="server" ImageUrl="~/Images/BillingTypes.gif" AlternateText="Billing Types" Width="48px" Height="48px"/></asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
                        </tr>
                        <tr>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink66" runat="server" NavigateUrl="~/AccountAdmin/AccountBillingTypes.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>            
                      </tr>
                    </table>
                </td>
                </tr>
<%  End If %>
             <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Import / Export%> " />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100%; height: 95px">
                    <table width="150">
                        <tr>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink19" runat="server"  NavigateUrl="~/AccountAdmin/AccountImportExport.aspx"
                                    Width="100px">
                                    <asp:Image ID="Image30" runat="server" ImageUrl="~/Images/ImportExport.gif" AlternateText="Import Export" Width="48px" Height="48px"/></asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
                        </tr>
                        <tr>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink21" runat="server" NavigateUrl="~/AccountAdmin/AccountImportExport.aspx"
                                    Width="100px"></asp:HyperLink>
                          </td>
                          <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                          </td>            
                      </tr>
                    </table>
                </td>
                </tr>
            <tr>
                <td class="FormViewSubHeader" colspan="2" style="width: 505px; height: 22px">
                    <asp:Literal ID="Literal34" runat="server" Text="<%$ Resources:TimeLive.Web, Account Setup%> " />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="width: 100%; height: 95px">
                    <table width="150">
                          <tr>
                            <td></td>                        
                         </tr>
                        <tr>
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink22" runat="server" NavigateUrl="~/AccountAdmin/AccountDisable.aspx"
                                    Width="100px">  <asp:Image ID="Image31" runat="server" ImageUrl="~/Images/AccountDisable.gif" AlternateText="Account Disable" Width="48px" Height="48px" />
                                </asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
<%--<%  If UIUtilities.GetApplicationMode <> "Installed" Then%> 
                          <td align="center" style="width: 14%; height: 48px" valign="top">
                                <asp:HyperLink ID="HyperLink60" runat="server" NavigateUrl="~/AccountAdmin/DatabaseBackup.aspx"
                                    Width="100px"><asp:Image ID="Image35" runat="server" ImageUrl="~/Images/database-backup.gif" AlternateText="Database Backup" Width="48px" Height="48px" />
                                </asp:HyperLink>
                          </td>
                          <td align="center" style="width: 14%; height: 48px" valign="top" colspan="1">
                          </td>
<%  End If %> --%>
                        </tr>
                        <tr>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink23" runat="server" NavigateUrl="~/AccountAdmin/AccountDisable.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
<%--<%  If UIUtilities.GetApplicationMode <> "Installed" Then%> 
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 48px" 
                                valign="top">
                                <asp:HyperLink ID="HyperLink61" runat="server" NavigateUrl="~/AccountAdmin/DatabaseBackup.aspx"
                                    Width="100px"></asp:HyperLink>
                            </td>
                            <td align="center" class="AdministrationOptionsText" style="width: 14%; height: 19px"
                                valign="top">
                            </td>
<%  End If %>--%>
                        </tr>
                    </table>
                </td>
                </tr>
               </tbody>
          </table>
</asp:Content>