<%@ page language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="ProjectAdmin_TimeSheetApproval, App_Web_nvpfcf1t" title="TimeLive - Time Sheet Approval" theme="SkinFile" enableviewstatemac="false" enableEventValidation="false" viewStateEncryptionMode="Never" %>

<%@ Register Src="Controls/ctlTimeSheetApprovalSummary.ascx" TagName="ctlTimeSheetApprovalSummary"
    TagPrefix="uc2" %>

<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>

<asp:Content Content ID="C" ContentPlaceHolderID="C" Runat="Server">
    <table width="100%">
        <tr>
            <td colspan="2">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <table class="xFormView" style="width: 452px; height: 1px">
                            <tbody>
                                <tr>
                                    <td class="caption" colspan="2" style="height: 21px">
                                        <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Time Sheet Approval%> "></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td class="FormViewsubheader" colspan="2" style="height: 21px">
                                        <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Search Parameters%> "></asp:Literal></td>
                                </tr>
                                <tr>
                                    <td align="right" class="formviewlabelcell" style="height: 24px">
                                        <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Employee Name:%> " /></td>
                                    <td style="height: 24px" width="300">
                                        &nbsp;<asp:DropDownList ID="ddlAccountEmployeeId" runat="server" DataTextField="EmployeeName" DataValueField="AccountEmployeeId"
                                            Width="250px" DataSourceID="dsAccountEmployeeObject" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0" Selected="True" Text="<%$ Resources:TimeLive.Web, ALLs%> "></asp:ListItem>
                                        </asp:DropDownList>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formviewlabelcell">
                                        <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Include Date Range:%> "></asp:Literal></td>
                                    <td style="height: 21px" width="300">
                                        <asp:CheckBox ID="chkIncludeDateRange" runat="server" Width="153px" OnCheckedChanged="chkIncludeDateRange_CheckedChanged" /></td>
                                </tr>
                                <tr>
                                    <td align="right" class="formviewlabelcell">
                                        <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Start Date:%> "></asp:Literal></td>
                                    <td style="height: 21px" width="300">
                                        &nbsp;<ew:calendarpopup id="txtTimeEntryStartDate" runat="server" SkinId="DatePicker" upperbounddate="9999-12-31">
            </ew:calendarpopup>
                                    </td>
                                </tr>
                                <tr>
                                    <td align="right" class="formviewlabelcell">
                                        <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, End Date:%> "></asp:Literal></td>
                                    <td style="height: 21px" width="300">
                                        &nbsp;<ew:calendarpopup id="txtTimeEntryEndDate" runat="server" SkinId="DatePicker" upperbounddate="9999-12-31">
            </ew:calendarpopup>
                                    </td>
                                </tr>
                                <% If 1<>1 Then%>
                                <tr>
                                    <td align="right" class="formviewlabelcell">
                                        <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:TimeLive.Web, Summarized:%> "></asp:Literal></td>
                                    </td>
                                    <td style="height: 21px" width="300">
                                        <asp:CheckBox ID="chkSummarized" runat="server" OnCheckedChanged="chkSummarized_CheckedChanged" /></td>
                                </tr>
                                <%End If%>
                                <tr>
                                    <td align="right" class="formviewlabelcell">
                                    </td>
                                    <td style="height: 21px" width="300">
                                        &nbsp;<asp:Button ID="btnShow" runat="server" Text="<%$ Resources:TimeLive.Web, Show_text%> "
                                            Width="50px" OnClick="btnShow_Click" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <br />
                        &nbsp;<asp:ObjectDataSource ID="dsAccountEmployeeObject" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetEmployeesForTimeEntryApproval" TypeName="AccountEmployeeBLL">
                            <SelectParameters>
                                <asp:SessionParameter DefaultValue="129" Name="ApproverEmployeeId" SessionField="AccountEmployeeId"
                                    Type="Int32" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:Button ID="btnUpdate1" runat="server" OnClick="btnUpdate1_Click" Text="<%$ Resources:TimeLive.Web, Update Time Entry Approvals%> "
                            Width="220px" />
                        <br />
                        <br />
                        <% If 1<>1 Then%>
                
                <%End If%>
                        
                        
                <uc2:ctlTimeSheetApprovalSummary ID="CtlTimeSheetApprovalSummary1" runat="server" />
                
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
       </table>
   
</asp:Content>

