<%@ control language="VB" autoeventwireup="false" inherits="WebReport_Design_Controls_ctlReportDesign, App_Web_qm2xr5m3" enableviewstate="true" %>
<%@ Register Assembly="eWorld.UI, Version=2.0.6.2393, Culture=neutral, PublicKeyToken=24d65337282035f2"
    Namespace="eWorld.UI" TagPrefix="ew" %>
<%@ Register Assembly="eWorld.UI" Namespace="eWorld.UI" TagPrefix="ew" %>
<asp:Wizard ID="ReportWizard" runat="server" ActiveStepIndex="0" Width="98%" Height="100%">
    <WizardSteps>
        <asp:WizardStep  runat="server" StepType="Start">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="dsReportDefinationObject"
                DefaultMode="Insert" Width="100%" DataKeyNames="AccountId,IsConsolidated,ReportName,ReportDescription" SkinID="formviewSkinEmployee">
                <EditItemTemplate>
                    <table width="100%" class="xview">
                        <tr>
                            <td class="caption" colspan="2" >
                                <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Report Definition Information%> " /></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 21px" class="FormViewSubHeader">
                                <asp:Literal ID="Literal2" runat="server" Text="<%$ Resources:TimeLive.Web, Report Definition%> " /></td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%" class="FormViewLabelCell">
                                <asp:Literal ID="Literal3" runat="server" Text="<%$ Resources:TimeLive.Web, Report Name:%> " /></td>
                            <td style="width: 75%">
                                <asp:TextBox ID="ReportNameTextBox" runat="server"
                                    Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ReportNameTextBox"
                                    Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%" class="FormViewLabelCell">
                                <asp:Literal ID="Literal4" runat="server" Text="<%$ Resources:TimeLive.Web, Report Description:%> " />
                            </td>
                            <td style="width: 75%">
                                <asp:TextBox ID="ReportDescriptionTextBox" runat="server"
                                    Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ReportDescriptionTextBox"
                                    Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%" class="FormViewLabelCell">
                                <asp:Literal ID="Literal5" runat="server" Text="<%$ Resources:TimeLive.Web, Report Category:%> " />
                            </td>
                            <td style="width: 75%">
                                <asp:DropDownList ID="ddlReportCategory" runat="server" Width="300px" DataSourceID="dsAccountReportCategoryObject" DataTextField="AccountReportCategory" DataValueField="AccountReportCategoryId" SelectedValue='<%# Bind("AccountReportCategoryId") %>'>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="ddlReportCategory"
                                    Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:ObjectDataSource ID="dsAccountReportCategoryObject" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetAccountReportCategoryByAccountId" TypeName="TimeLive.WebReport.ReportDesignBLL">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="151" Name="AccountId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%; height: 24px;" class="FormViewLabelCell">
                                <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, Upload Report Icon:%> " /></td>
                            <td style="width: 75%; height: 24px;">
                                <asp:FileUpload ID="ReportIconPathTextBox" runat="server" Width="500px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" class="FormViewLabelCell" style="width: 25%; height: 24px">
                                <asp:Literal ID="Literal22" runat="server" Text="<%$ Resources:TimeLive.Web, Show Company Logo: %>" /></td>
                            <td style="width: 75%; height: 24px">
                                <asp:CheckBox ID="chkShowCompanyLogo" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="right" class="FormViewLabelCell" style="width: 25%; height: 24px">
                                <asp:Literal ID="Literal26" runat="server" Text="<%$ Resources:TimeLive.Web, Report Title:%> " /></td>
                            <td style="width: 75%; height: 24px">
                                <asp:TextBox ID="ReportTitleTextBox" runat="server" MaxLength="100" Width="300px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="FormViewLabelCell" style="width: 25%; height: 24px" valign="top">
                                <asp:Literal ID="Literal27" runat="server" Text="<%$ Resources:TimeLive.Web, Report Header:%> " /></td>
                            <td style="width: 75%; height: 24px">
                                <asp:TextBox ID="ReportHeaderTextBox" runat="server" MaxLength="2000" Width="600px" Height="150px" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="FormViewLabelCell" style="width: 25%; height: 24px" valign="top">
                                <asp:Literal ID="Literal28" runat="server" Text="<%$ Resources:TimeLive.Web, Report Footer:%> " /></td>
                            <td style="width: 75%; height: 24px">
                                <asp:TextBox ID="ReportFooterTextBox" runat="server" MaxLength="2000" Width="600px" Height="150px" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                    </table>
                </EditItemTemplate>
                <InsertItemTemplate>
                    <table width="100%" class="xview">
                        <tr>
                             <td class="caption" colspan="2" >
                                 <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Report Definition Information%> " /></td>
                        </tr>
                        <tr>
                            <td colspan="2" style="height: 21px" class="FormViewSubHeader">
                                 <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Report Definition%> " /></td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%" class="FormViewLabelCell">
                                 <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:TimeLive.Web, Report Name:%> " /></td>
                            <td style="width: 75%">
                                <asp:TextBox ID="ReportNameTextBox" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ReportNameTextBox"
                                    Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%" class="FormViewLabelCell">
                                <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:TimeLive.Web, Report Description:%>"/>
                            </td>
                            <td style="width: 75%">
                                <asp:TextBox ID="ReportDescriptionTextBox" runat="server" Width="300px"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ReportDescriptionTextBox"
                                    Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator></td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%" class="FormViewLabelCell">
                                <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:TimeLive.Web, Report Category:%> " />
                            </td>
                            <td style="width: 75%">
                                <asp:DropDownList ID="ddlReportCategory" runat="server" Width="300px" DataSourceID="dsAccountReportCategoryObject" DataTextField="AccountReportCategory" DataValueField="AccountReportCategoryId">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ddlReportCategory"
                                    Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator>
                                <asp:ObjectDataSource ID="dsAccountReportCategoryObject" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetAccountReportCategoryByAccountId" TypeName="TimeLive.WebReport.ReportDesignBLL">
                                    <SelectParameters>
                                        <asp:Parameter DefaultValue="151" Name="AccountId" Type="Int32" />
                                    </SelectParameters>
                                </asp:ObjectDataSource>
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%; height: 24px;" class="FormViewLabelCell">
                                <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:TimeLive.Web, Upload Report Icon:%> " /></td>
                            <td style="width: 75%; height: 24px;">
                                <asp:FileUpload ID="ReportIconPathTextBox" runat="server" Width="500px" />
                            </td>
                        </tr>
                        <tr>
                            <td align="right" style="width: 25%; height: 24px" class="FormViewLabelCell">
                            </td>
                            <td style="width: 75%; height: 24px">
                                <asp:RadioButton ID="rdDetailed" runat="server" GroupName="ReportType" Text="<%$ Resources:TimeLive.Web, Detailed%>" />&nbsp;<asp:RadioButton
                                    ID="rdConsolidated" runat="server" GroupName="ReportType" Text="<%$ Resources:TimeLive.Web, Consolidated%>" /></td>
                        </tr>
                        <tr>
                            <td align="right" class="FormViewLabelCell" style="width: 25%; height: 24px">
                                <asp:Literal ID="Literal21" runat="server" Text="<%$ Resources:TimeLive.Web, Show Company Logo: %>" /></td>
                            <td style="width: 75%; height: 24px">
                                <asp:CheckBox ID="chkShowCompanyLogo" runat="server" /></td>
                        </tr>
                        <tr>
                            <td align="right" class="FormViewLabelCell" style="width: 25%; height: 24px">
                                <asp:Literal ID="Literal23" runat="server" Text="<%$ Resources:TimeLive.Web, Report Title: %>" /></td>
                            <td style="width: 75%; height: 24px">
                                <asp:TextBox ID="ReportTitleTextBox" runat="server" MaxLength="100" Width="300px"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="FormViewLabelCell" style="width: 25%; height: 24px" valign="top">
                                <asp:Literal ID="Literal24" runat="server" Text="<%$ Resources:TimeLive.Web, Report Header: %>" /></td>
                            <td style="width: 75%; height: 24px">
                                <asp:TextBox ID="ReportHeaderTextBox" runat="server" MaxLength="2000" Width="600px" Height="150px" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                        <tr>
                            <td align="right" class="FormViewLabelCell" style="width: 25%; height: 24px" valign="top">
                                <asp:Literal ID="Literal25" runat="server" Text="<%$ Resources:TimeLive.Web, Report Footer: %>" /></td>
                            <td style="width: 75%; height: 24px">
                                <asp:TextBox ID="ReportFooterTextBox" runat="server" MaxLength="2000" Width="600px" Height="150px" TextMode="MultiLine"></asp:TextBox></td>
                        </tr>
                    </table>
                </InsertItemTemplate>
            </asp:FormView>
            <asp:ObjectDataSource ID="dsReportDefinationObject" runat="server" OldValuesParameterFormatString="original_{0}"
                SelectMethod="GetAccountReportByAccountReportId" TypeName="TimeLive.WebReport.ReportDesignBLL">
                <SelectParameters>
                    <asp:QueryStringParameter Name="AccountReportId" QueryStringField="AccountReportId" />
                </SelectParameters>
            </asp:ObjectDataSource>
        </asp:WizardStep>
        <asp:WizardStep  runat="server" StepType="Step" >
        <table class="xFormView" width="100%">
    <tr>
        <td colspan="2" class="caption">
            <asp:Literal ID="Literal1" runat="server" Text="<%$ Resources:TimeLive.Web, Report Information %>" /></td>
    </tr>
    <tr>
        <td class="FormViewSubHeader" style="width: 20%" >
            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:TimeLive.Web, Report Name: %>" />
        </td>
        <td style="width: 80%" class="FormViewSubHeader" >
            <asp:TextBox ID="ReportNameTextBox" runat="server" Width="100%" ReadOnly="True"></asp:TextBox></td>
    </tr>
</table>
<br />
            <table width="100%" class="xFormView">
                <tr>
                    <td colspan="2" class="FormViewSubHeader">
                        <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:TimeLive.Web, Report DataSource %>" /></td>
                </tr>
                <tr>
                    <td align="right" style="width: 25%;" class="FormViewSubHeader">
                         <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:TimeLive.Web, Select Datasource: %>" />
                    </td>
                    <td style="width: 75%;">
                        <asp:DropDownList ID="ddlSystemReportDataSourceId" runat="server" Width="300px" DataSourceID="dsSystemReportDatasourceObject" DataTextField="ReportDataSourceName" DataValueField="SystemReportDataSourceId" AutoPostBack="True">
                        </asp:DropDownList>
                        <asp:ObjectDataSource ID="dsSystemReportDatasourceObject" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetSystemReportDataSource" TypeName="TimeLive.WebReport.ReportDesignBLL" DataObjectTypeName="System.Guid" DeleteMethod="DeleteAccountReport">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="height: 20px">
                        <x:GridView ID="GridView1" runat="server" Caption="<%$ Resources:TimeLive.Web, Report Column %>" SkinID="xgridviewSkinEmployee" AutoGenerateColumns="False" DataSourceID="dsAccountReportColumnObject" DataKeyNames="AccountReportColumnId,SystemReportDataSourceFieldId,SystemReportDataSourceFieldColumnOrder,AccountReportId,Caption,SystemReportCalculationTypeId,SystemReportDataSourceFieldCaption,DefaultAvailable,IsAllowSummaryCalculation,SystemReportDataSourceField,IsFormulaField,ColumnFormula" Width="100%" PageSize="500">
                            <Columns>
                                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Select %>">
                                    <ItemTemplate>
<asp:CheckBox id="chkSelect" runat="server" __designer:wfdid="w13"></asp:CheckBox> 
</ItemTemplate>
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Report Column %>" SortExpression="SystemReportDataSourceField">
                                    <EditItemTemplate>
<asp:TextBox id="TextBox1" runat="server" Text='<%# Bind("SystemReportDataSourceField") %>' __designer:wfdid="w15"></asp:TextBox> 
</EditItemTemplate>
                                    <ItemTemplate>
<asp:Label id="lblReportColumn" Width="100%" runat="server" Text='<%# Eval("SystemReportDataSourceField") %>' __designer:wfdid="w14"></asp:Label> 
</ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Caption %>" SortExpression="SystemReportDataSourceFieldCaption">
                                    <EditItemTemplate>
&nbsp; 
</EditItemTemplate>
                                    <ItemTemplate>
<asp:TextBox id="CaptionTextBox" Width="98%" runat="server" MaxLength="50" __designer:wfdid="w48"></asp:TextBox><asp:RequiredFieldValidator id="RequiredFieldValidator6" runat="server" __designer:wfdid="w49" ControlToValidate="CaptionTextBox" Display="Dynamic" ErrorMessage="*"></asp:RequiredFieldValidator> 
</ItemTemplate>
                                    <ItemStyle HorizontalAlign="Left" Width="25%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Group %>">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="chkGroup" runat="server" />
                                    
</ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Center" />
                                    <ItemStyle HorizontalAlign="Center" Width="5%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Show Summary %>">
                                    <ItemTemplate>
<asp:DropDownList id="ddlGroupSummary" Width="100%" runat="server" DataSourceID="dsSystemReportCalculationTypeObjectForGroupSummary" DataValueField="SystemReportCalculationTypeId" DataTextField="CalculationType" __designer:wfdid="w9" AppendDataBoundItems="True">
                                            <asp:ListItem Value="0" Selected="True">&lt;None&gt;</asp:ListItem>
                                        </asp:DropDownList> 
</ItemTemplate>
                                    <HeaderStyle HorizontalAlign="Left" />
                                    <ItemStyle Width="10%" />
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Formula %>">
                                    <itemtemplate>
<asp:TextBox id="FormulaTextBox" Width="80%" runat="server" __designer:wfdid="w11"></asp:TextBox>
<%  If System.Configuration.ConfigurationManager.AppSettings("SHOW_HELP_ICON") <> "No" Then%>
<asp:HyperLink id="imgFormula" Width="10%" runat="server" __designer:wfdid="w5" ImageUrl="~/Images/Help.gif" Target="_blank" NavigateUrl="http://www.livetecs.com/timelivehelp/Default.htm#Understanding_Formula_Columns.htm">[imgFormula]</asp:HyperLink>
<%End If%>
</itemtemplate>
                                    <headerstyle horizontalalign="Left" />
                                    <itemstyle width="20%" />
                                </asp:TemplateField>
                            </Columns>
                        </x:GridView>
                        <asp:ObjectDataSource ID="dsAccountReportColumnObject" runat="server" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetSystemReportDataSourceFieldBySystemReportDataSourceIdAndAccountReportId" TypeName="TimeLive.WebReport.ReportDesignBLL">
                            <SelectParameters>
                                <asp:Parameter Name="SystemReportDataSourceId" />
                                <asp:Parameter DefaultValue="" Name="AccountReportId" />
                            </SelectParameters>
                        </asp:ObjectDataSource>
                        <asp:ObjectDataSource ID="dsSystemReportCalculationTypeObjectForGroupSummary" runat="server"
                            DataObjectTypeName="System.Guid" DeleteMethod="DeleteAccountReport" OldValuesParameterFormatString="original_{0}"
                            SelectMethod="GetSystemReportCalculationTypes" TypeName="TimeLive.WebReport.ReportDesignBLL">
                        </asp:ObjectDataSource>
                    </td>
                </tr>
            </table>
        </asp:WizardStep>
        <asp:WizardStep runat="server" StepType="Finish">
       <table class="xFormView" style="width: 99%">
    <tr>
        <td colspan="2" class="caption">
            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:TimeLive.Web, Report Information %>" /></td>
    </tr>
    <tr>
        <td class="FormViewSubHeader" style="width: 100px" >
            <asp:Literal ID="Literal16" runat="server" Text="<%$ Resources:TimeLive.Web, Report Name: %>" />
        </td>
        <td style="width: 600px" class="FormViewSubHeader" >
            <asp:TextBox ID="reportNameTextBox1" runat="server" Width="100%" ReadOnly="True"></asp:TextBox></td>
    </tr>
</table>
<br />
        <table class="xFormView" border="0" width="99%" >
            <tr>
                <td class="caption" colspan="2">
                    <asp:Literal ID="Literal17" runat="server" Text="<%$ Resources:TimeLive.Web, Column Order %>" /></td>
                <td colspan="1" style="width: 271px">
                </td>
                <td class="caption" colspan="2">
                     <asp:Literal ID="Literal18" runat="server" Text="<%$ Resources:TimeLive.Web, Group Order %>" /></td>
            </tr>
    <tr>
        <td class="FormViewSubHeader" colspan="2">
            <asp:Literal ID="Literal19" runat="server" Text="<%$ Resources:TimeLive.Web, Selection %>" /></td>
        <td colspan="1" style="width: 271px">
        </td>
        <td class="FormViewSubHeader" colspan="2">
             <asp:Literal ID="Literal20" runat="server" Text="<%$ Resources:TimeLive.Web, Selection %>" /></td>
    </tr>
    <tr>
       

        <td class="FormViewSubheader" style="width: 275px">
            <asp:ListBox ID="SelectedListBox" runat="server" Height="280px" Rows="8" Width="280px"></asp:ListBox></td>
        <td valign="top" class="FormViewSubHeader" style="width: 107px">
            <ew:ListTransfer ID="ListTransfer1" runat ="server" Text = "<%$ Resources:TimeLive.Web, Move Up %>" TransferType="Up" TransferFromID="SelectedListBox" ImageUrl="~/Images/UpArrow.gif" />
            <br />
            <br />
            <ew:ListTransfer ID="ListTransfer2" runat ="server" Text = "<%$ Resources:TimeLive.Web, Move Down %>" TransferType="Down" TransferFromID="SelectedListBox" ImageUrl="~/Images/DownArrow.gif" />
           
        </td>
        <td style="width: 271px" valign="top">
        </td>
        <td class="FormViewSubheader" valign="top" style="width: 275px">
            <asp:ListBox ID="ReportGroupListBox" runat="server" Height="280px" Rows="8" Width="280px">
            </asp:ListBox>
        </td>
        <td class="FormViewSubHeader" valign="top" style="width: 107px">
            <ew:ListTransfer ID="ListTransfer3" runat ="server" Text = "<%$ Resources:TimeLive.Web, Move Up %>" TransferType="Up" TransferFromID="ReportGroupListBox" ImageUrl="~/Images/UpArrow.gif" />
            <br />
            <br />
            <ew:ListTransfer ID="ListTransfer4" runat ="server" Text = "<%$ Resources:TimeLive.Web, Move Down %>" TransferType="Down" TransferFromID="ReportGroupListBox" ImageUrl="~/Images/DownArrow.gif" />
        </td>
    </tr>
</table>
        
        </asp:WizardStep>
    </WizardSteps>
    <StepNavigationTemplate>
        <asp:Button ID="StepPreviousButton" runat="server" CausesValidation="False" CommandName="MovePrevious"
            Text="Previous" />
        <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Next" />
    </StepNavigationTemplate>
</asp:Wizard>
