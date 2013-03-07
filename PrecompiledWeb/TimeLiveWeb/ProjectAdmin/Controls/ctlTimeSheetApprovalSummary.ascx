<%@ control language="VB" autoeventwireup="false" inherits="ProjectAdmin_Controls_ctlTimeSheetApprovalSummary, App_Web_lth4bcqk" %>
        <script type="text/javascript">
        function ChangeCheckBoxState1(id, checkState1)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState1;
        }
        
        function ChangeAllCheckBoxStates1(checkState1)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs1 != null)
            {
                for (var i = 0; i < CheckBoxIDs1.length; i++)
                   ChangeCheckBoxState1(CheckBoxIDs1[i], checkState1);
            }
        }

    </script>
    
    <script type="text/javascript">
        function ChangeCheckBoxState2(id, checkState2)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState2;
        }
        
        function ChangeAllCheckBoxStates2(checkState2)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs2 != null)
            {
                for (var i = 0; i < CheckBoxIDs2.length; i++)
                   ChangeCheckBoxState2(CheckBoxIDs2[i], checkState2);
            }
        }

    </script>
    
    <script type="text/javascript">
        function ChangeCheckBoxState3(id, checkState3)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState3;
        }
        
        function ChangeAllCheckBoxStates3(checkState3)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs3 != null)
            {
                for (var i = 0; i < CheckBoxIDs3.length; i++)
                   ChangeCheckBoxState3(CheckBoxIDs3[i], checkState3);
            }
        }

    </script>
    <script type="text/javascript">
        function ChangeCheckBoxState4(id, checkState4)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState4;
        }
        
        function ChangeAllCheckBoxStates4(checkState4)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs4 != null)
            {
                for (var i = 0; i < CheckBoxIDs4.length; i++)
                   ChangeCheckBoxState4(CheckBoxIDs4[i], checkState4);
            }
        }

    </script>
        <script type="text/javascript">
        function ChangeCheckBoxState5(id, checkState5)
        {
            var cb = document.getElementById(id);
            if (cb != null)
               cb.checked = checkState5;
        }
        
        function ChangeAllCheckBoxStates5(checkState5)
        {
            // Toggles through all of the checkboxes defined in the CheckBoxIDs array
            // and updates their value to the checkState input parameter
            if (CheckBoxIDs5 != null)
            {
                for (var i = 0; i < CheckBoxIDs5.length; i++)
                   ChangeCheckBoxState5(CheckBoxIDs5[i], checkState5);
            }
        }

    </script>  

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
<x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("My Team Time Entry Approvals:") %>'
    DataSourceID="dsApprovalEntriesForTeamLeadObject"
    ShowFooter="True" SkinID="xgridviewSkinEmployee" 
            DataKeyNames="TimeEntryAccountEmployeeId,TimeEntryStartDate,TimeEntryEndDate,TimeEntryDate,AccountEmployeeTimeEntryPeriodId,EmployeeName,TotalMinutes,EmailAddress,TimeEntryViewType,AccountProjectId,Percentage" 
            OnDataBound="GridView1_DataBound">
    <Columns>
        <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
            <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" __designer:wfdid="w253" Text='<%# Bind("EmployeeName") %>'></asp:TextBox> 
</edititemtemplate>
            <headertemplate>
<asp:LinkButton id="LinkButton3" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
            <itemstyle horizontalalign="Left" width="150px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes,resizable=yes'); return false;" runat="server" __designer:wfdid="w252" Text='<%# Bind("EmployeeName") %>' NavigateUrl="~/Employee/AccountEmployeeTimeEntryWeekViewReadOnly.aspx"></asp:HyperLink> 
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Timesheet Period %>">
            <edititemtemplate>
&nbsp; 
</edititemtemplate>
            <itemtemplate>
<asp:Label id="Label1" runat="server" __designer:wfdid="w248" Text='<%# Format("{0:d}",Eval("TimeEntryStartDate")) %>'></asp:Label>&nbsp;- <asp:Label id="Label2" runat="server" __designer:wfdid="w249" Text='<%# Format("{0:d}",Eval("TimeEntryEndDate")) %>'></asp:Label> 
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billable Hours %>">
            <footertemplate>
<asp:Label id="lblSumBillableTime" runat="server" __designer:wfdid="w251"></asp:Label> 
</footertemplate>
            <itemstyle horizontalalign="Center" width="55px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:Label id="lblBillableTime" runat="server" __designer:wfdid="w250"></asp:Label> 
</itemtemplate>
            <footerstyle horizontalalign="Center" width="55px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Non-billable Hours %>">
            <footertemplate>
<asp:Label id="lblSumNonBillableTime" runat="server" __designer:wfdid="w2"></asp:Label> 
</footertemplate>
            <itemstyle horizontalalign="Center" width="55px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:Label id="lblNonBillableTime" runat="server" __designer:wfdid="w1"></asp:Label> 
</itemtemplate>
            <footerstyle horizontalalign="Center" width="55px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Total Hours %>">
            <footertemplate>
<asp:Label id="lblSumTotalTime" runat="server" __designer:wfdid="w8"></asp:Label> 
</footertemplate>
            <itemstyle horizontalalign="Center" width="55px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:Label id="lblTotalTime" runat="server" __designer:wfdid="w6"></asp:Label> 
</itemtemplate>
            <footerstyle horizontalalign="Center" width="55px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Percentage" Visible="False">
            <footertemplate>
<asp:Label id="lblSumPercentage" runat="server" __designer:wfdid="w8"></asp:Label> 
</footertemplate>
            <itemstyle horizontalalign="Center" width="55px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:Label id="lblPercentage" runat="server" __designer:wfdid="w6"></asp:Label> 
</itemtemplate>
            <footerstyle horizontalalign="Center" width="55px" />
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
            <itemstyle horizontalalign="Center" width="65px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:RadioButton id="chkTeamLead" runat="server" __designer:wfdid="w7" GroupName="TeamLead"></asp:RadioButton> 
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
            <itemstyle horizontalalign="Center" width="65px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:RadioButton id="chkTeamLeadRejected" runat="server" __designer:wfdid="w8" GroupName="TeamLead"></asp:RadioButton> 
</itemtemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
            <itemstyle width="150px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:TextBox id="TeamLeadCommentsTextBox" runat="server" __designer:wfdid="w3" Width="100%" TextMode="MultiLine"></asp:TextBox> 
</itemtemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="TotalMinutes" HeaderText="TotalMinutes" SortExpression="TotalMinutes"
            Visible="False" />
        <asp:BoundField DataField="BillableTotalMinutes" HeaderText="BillableTotalMinutes"
            SortExpression="BillableTotalMinutes" Visible="False" />
        <asp:BoundField DataField="NonBillableTotalMinutes" HeaderText="NonBillableTotalMinutes"
            SortExpression="NonBillableTotalMinutes" Visible="False" />
    </Columns>
</x:GridView>
        <asp:LinkButton ID="CheckAllTeamLead" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates1(true);" Visible="False">
            <asp:Literal ID="Literal8" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>&nbsp;<asp:LinkButton
                ID="UnCheckAllTeamLead" runat="server" CssClass="FeatureHeadingIcon" OnClientClick="ChangeAllCheckBoxStates1(false);"
                Visible="False">
                <asp:Literal ID="Literal9" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton><asp:ObjectDataSource ID="dsApprovalEntriesForTeamLeadObject" runat="server" OldValuesParameterFormatString="original_{0}"
    SelectMethod="GetApprovalEntriesForTeamLeadSummarize" TypeName="AccountEmployeeTimeEntryBLL">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="39" Name="TimeEntryAccountEmployeeId"
            PropertyName="SelectedValue" Type="Int32" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryEndDate" Type="DateTime" />
        <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
            PropertyName="Checked" Type="Boolean" />
    </SelectParameters>
    <FilterParameters>
        <asp:Parameter DefaultValue="39" Direction="Output" Name="AccountEmployeeId" Type="Int32" />
    </FilterParameters>
</asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="Updatepanel2" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("My Projects Time Entry Approvals:") %>'
            
            DataKeyNames="TimeEntryAccountEmployeeId,TimeEntryStartDate,TimeEntryEndDate,TimeEntryDate,AccountEmployeeTimeEntryPeriodId,EmployeeName,TotalMinutes,EmailAddress,TimeEntryViewType,AccountProjectId,Percentage" DataSourceID="ApprovalEntriesForProjectManagerObject"
            OnRowDataBound="GridView2_RowDataBound" ShowFooter="True" 
            SkinID="xgridviewSkinEmployee" OnDataBound="GridView2_DataBound">
            <Columns>
                <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" __designer:wfdid="w256" Text='<%# Bind("EmployeeName") %>'></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton4" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemstyle horizontalalign="Left" width="150px" />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes'); return false;" runat="server" __designer:wfdid="w255" Text='<%# Bind("EmployeeName") %>' NavigateUrl="~/Employee/AccountEmployeeTimeEntryWeekViewReadOnly.aspx"></asp:HyperLink> 
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Timesheet Period %>">
                    <edititemtemplate>
&nbsp;
</edititemtemplate>
                    <itemtemplate>
<asp:Label id="Label1" runat="server" __designer:wfdid="w10" Text='<%# Format("{0:d}",Eval("TimeEntryStartDate")) %>'></asp:Label>&nbsp;- <asp:Label id="Label2" runat="server" __designer:wfdid="w11" Text='<%# Format("{0:d}",Eval("TimeEntryEndDate")) %>'></asp:Label>
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billable Hours %>">
                    <footertemplate>
<asp:Label id="lblSumBillableTime" runat="server" __designer:wfdid="w27"></asp:Label>
</footertemplate>
                    <itemstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:Label id="lblBillableTime" runat="server" __designer:wfdid="w27"></asp:Label>
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Non-billable Hours %>">
                    <footertemplate>
<asp:Label id="lblSumNonBillableTime" runat="server" __designer:wfdid="w29"></asp:Label>
</footertemplate>
                    <itemstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:Label id="lblNonBillableTime" runat="server" __designer:wfdid="w29"></asp:Label>
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Total Hours %>">
                    <edititemtemplate>
&nbsp; 
</edititemtemplate>
                    <footertemplate>
<asp:Label id="lblSumTotalTime" runat="server" __designer:wfdid="w11"></asp:Label> 
</footertemplate>
                    <itemstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:Label id="lblTotalTime" runat="server" __designer:wfdid="w9"></asp:Label> 
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Percentage" Visible="False">
            <footertemplate>
<asp:Label id="lblSumPercentage" runat="server" __designer:wfdid="w8"></asp:Label> 
</footertemplate>
            <itemstyle horizontalalign="Center" width="55px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:Label id="lblPercentage" runat="server" __designer:wfdid="w6"></asp:Label> 
</itemtemplate>
            <footerstyle horizontalalign="Center" width="55px" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
                    <itemstyle horizontalalign="Center" width="65px" />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:RadioButton id="chkProjectManager" runat="server" GroupName="ProjectManager" __designer:wfdid="w20"></asp:RadioButton> 
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
                    <itemstyle horizontalalign="Center" width="65px" />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:RadioButton id="chkProjectManagerRejected" runat="server" GroupName="ProjectManager" __designer:wfdid="w21"></asp:RadioButton> 
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
                    <itemstyle width="150px" />
                    <headerstyle horizontalalign="Center" />
                    <itemtemplate>
<asp:TextBox id="ProjectManagerCommentsTextBox" runat="server" Width="100%" TextMode="MultiLine" __designer:wfdid="w22"></asp:TextBox> 
</itemtemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="AccountEmployeeTimeEntryId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    SortExpression="AccountEmployeeTimeEntryId" Visible="False" />
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllProjectManager" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates2(true);" Visible="False">
            <asp:Literal ID="Literal10" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>
        <asp:LinkButton ID="UnCheckAllProjectMananger" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates2(false);" Visible="False">
            <asp:Literal ID="Literal11" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton>
<asp:ObjectDataSource ID="ApprovalEntriesForProjectManagerObject" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetApprovalEntriesForProjectManagerSummarize"
    TypeName="AccountEmployeeTimeEntryBLL">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="39" Name="TimeEntryAccountEmployeeId"
            PropertyName="SelectedValue" Type="Int32" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryEndDate" Type="DateTime" />
        <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
            PropertyName="Checked" Type="Boolean" />
    </SelectParameters>
</asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="Updatepanel4" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Specific Employee Time Entry Approvals %>"
            
            DataKeyNames="TimeEntryAccountEmployeeId,TimeEntryStartDate,TimeEntryEndDate,TimeEntryDate,AccountEmployeeTimeEntryPeriodId,EmployeeName,TotalMinutes,EmailAddress,TimeEntryViewType,AccountProjectId,Percentage" DataSourceID="ApprovalEntriesForSpecificEmployeeObject"
            OnRowDataBound="GridView3_RowDataBound" ShowFooter="True" 
            SkinID="xgridviewSkinEmployee" OnDataBound="GridView3_DataBound">
            <Columns>
                <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" __designer:wfdid="w259" Text='<%# Bind("EmployeeName") %>'></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton5" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes'); return false;" runat="server" __designer:wfdid="w258" Text='<%# Bind("EmployeeName") %>' NavigateUrl="~/Employee/AccountEmployeeTimeEntryWeekViewReadOnly.aspx"></asp:HyperLink> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Left" width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Timesheet Period %>">
                    <itemtemplate>
<asp:Label id="Label1" runat="server" __designer:wfdid="w14" Text='<%# Format("{0:d}",Eval("TimeEntryStartDate")) %>'></asp:Label>&nbsp;- <asp:Label id="Label2" runat="server" __designer:wfdid="w15" Text='<%# Format("{0:d}",Eval("TimeEntryEndDate")) %>'></asp:Label>
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billable Hours %>">
                    <footertemplate>
<asp:Label id="lblSumBillableTime" runat="server" __designer:wfdid="w44"></asp:Label>
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblBillableTime" runat="server" __designer:wfdid="w44"></asp:Label>
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Non-billable Hours %>">
                    <footertemplate>
<asp:Label id="lblSumNonBillableTime" runat="server" __designer:wfdid="w44"></asp:Label>
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblNonBillableTime" runat="server" __designer:wfdid="w44"></asp:Label>
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Total Hours %>">
                    <footertemplate>
<asp:Label id="lblSumTotalTime" runat="server" __designer:wfdid="w14"></asp:Label> 
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblTotalTime" runat="server" __designer:wfdid="w12"></asp:Label> 
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Percentage" Visible="False">
            <footertemplate>
<asp:Label id="lblSumPercentage" runat="server" __designer:wfdid="w8"></asp:Label> 
</footertemplate>
            <itemstyle horizontalalign="Center" width="55px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:Label id="lblPercentage" runat="server" __designer:wfdid="w6"></asp:Label> 
</itemtemplate>
            <footerstyle horizontalalign="Center" width="55px" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
                    <itemtemplate>
<asp:RadioButton id="chkSpecificEmployee" runat="server" GroupName="SpecificEmployee" __designer:wfdid="w53"></asp:RadioButton> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="65px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
                    <itemtemplate>
<asp:RadioButton id="chkSpecificEmployeeRejected" runat="server" GroupName="SpecificEmployee" __designer:wfdid="w54"></asp:RadioButton> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="65px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
                    <itemtemplate>
<asp:TextBox id="SpecificEmployeeCommentsTextBox" runat="server" __designer:wfdid="w1" TextMode="MultiLine" Width="100%"></asp:TextBox> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:TemplateField>
                <asp:BoundField DataField="AccountEmployeeTimeEntryId" HeaderText="AccountEmployeeTimeEntryId"
                    SortExpression="AccountEmployeeTimeEntryId" Visible="False" />
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllSpecificEmployee" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates3(true);" Visible="False">
            <asp:Literal ID="Literal12" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>
        <asp:LinkButton ID="UnCheckAllSpecificEmployee" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates3(false);" Visible="False">
            <asp:Literal ID="Literal13" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton>
<asp:ObjectDataSource ID="ApprovalEntriesForSpecificEmployeeObject" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetApprovalEntriesForSpecificEmployeeSummarize"
    TypeName="AccountEmployeeTimeEntryBLL">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="39" Name="TimeEntryAccountEmployeeid"
            PropertyName="SelectedValue" Type="Int32" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryEndDate" Type="DateTime" />
        <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
            PropertyName="Checked" Type="Boolean" />
    </SelectParameters>
</asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
&nbsp;<asp:UpdatePanel ID="UpdatePanel5" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("Specific External User Time Entry Approvals") %>'
            
            DataKeyNames="TimeEntryAccountEmployeeId,TimeEntryStartDate,TimeEntryEndDate,TimeEntryDate,AccountEmployeeTimeEntryPeriodId,EmployeeName,TotalMinutes,EmailAddress,TimeEntryViewType,AccountProjectId,Percentage" 
            DataSourceID="dsApprovalEntriesForSpecificExternalUserObject" 
            OnRowDataBound="GridView4_RowDataBound" ShowFooter="True"
            SkinID="xgridviewSkinEmployee" OnDataBound="GridView4_DataBound">
            <Columns>
                <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" __designer:wfdid="w262" Text='<%# Bind("EmployeeName") %>'></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton6" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes'); return false;" runat="server" __designer:wfdid="w261" Text='<%# Bind("EmployeeName") %>' NavigateUrl="~/Employee/AccountEmployeeTimeEntryWeekViewReadOnly.aspx"></asp:HyperLink> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Left" width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Timesheet Period %>">
                    <itemtemplate>
<asp:Label id="Label1" runat="server" __designer:wfdid="w18" Text='<%# Format("{0:d}",Eval("TimeEntryStartDate")) %>'></asp:Label>&nbsp;- <asp:Label id="Label2" runat="server" __designer:wfdid="w19" Text='<%# Format("{0:d}",Eval("TimeEntryEndDate")) %>'></asp:Label>
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billable Hours %>">
                    <footertemplate>
<asp:Label id="lblSumBillableTime" runat="server" __designer:wfdid="w10"></asp:Label>
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblBillableTime" runat="server" __designer:wfdid="w10"></asp:Label>
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Non-billable Hours %>">
                    <footertemplate>
<asp:Label id="lblSumNonBillableTime" runat="server" __designer:wfdid="w10"></asp:Label>
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblNonBillableTime" runat="server" __designer:wfdid="w10"></asp:Label>
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Total Hours %>">
                    <footertemplate>
<asp:Label id="lblSumTotalTime" runat="server" __designer:wfdid="w17"></asp:Label> 
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblTotalTime" runat="server" __designer:wfdid="w15"></asp:Label> 
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Percentage" Visible="False">
            <footertemplate>
<asp:Label id="lblSumPercentage" runat="server" __designer:wfdid="w8"></asp:Label> 
</footertemplate>
            <itemstyle horizontalalign="Center" width="55px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:Label id="lblPercentage" runat="server" __designer:wfdid="w6"></asp:Label> 
</itemtemplate>
            <footerstyle horizontalalign="Center" width="55px" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
                    <itemtemplate>
<asp:RadioButton id="chkSpecificExternalUser" runat="server" __designer:wfdid="w19" GroupName="SpecificExternalUser"></asp:RadioButton> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="65px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
                    <itemtemplate>
<asp:RadioButton id="chkSpecificExternalUserRejected" runat="server" __designer:wfdid="w20" GroupName="SpecificExternalUser"></asp:RadioButton> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="65px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
                    <itemtemplate>
<asp:TextBox id="SpecificExternalUserCommentsTextBox" runat="server" __designer:wfdid="w21" TextMode="MultiLine" Width="100%"></asp:TextBox> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:TemplateField>
                <asp:BoundField DataField="AccountEmployeeTimeEntryId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    SortExpression="AccountEmployeeTimeEntryId" Visible="False" />
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllSpecificExternalUser" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates4(true);" Visible="False">
            <asp:Literal ID="Literal14" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>
        <asp:LinkButton ID="UnCheckAllSpecificExternalUser" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates4(false);" Visible="False">
            <asp:Literal ID="Literal15" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton>
<asp:ObjectDataSource ID="dsApprovalEntriesForSpecificExternalUserObject" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetApprovalEntriesForSpecificExternalUserSummarize"
    TypeName="AccountEmployeeTimeEntryBLL">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="39" Name="TimeEntryAccountEmployeeid"
            PropertyName="SelectedValue" Type="Int32" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryEndDate" Type="DateTime" />
        <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
            PropertyName="Checked" Type="Boolean" />
    </SelectParameters>
</asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel6" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" Caption='<%# ResourceHelper.GetFromResource("Employee Manager Time Entry Approvals") %>'
            
            DataKeyNames="TimeEntryAccountEmployeeId,TimeEntryStartDate,TimeEntryEndDate,TimeEntryDate,AccountEmployeeTimeEntryPeriodId,EmployeeName,TotalMinutes,EmailAddress,TimeEntryViewType,AccountProjectId,Percentage" DataSourceID="dsApprovalEntriesForEmployeeManagerObject"
            OnRowDataBound="GridView5_RowDataBound" ShowFooter="True" 
            SkinID="xgridviewSkinEmployee" OnDataBound="GridView5_DataBound">
            <Columns>
                <asp:TemplateField SortExpression="EmployeeName" HeaderText="<%$ Resources:TimeLive.Web, Employee Name %>">
                    <edititemtemplate>
<asp:TextBox id="TextBox2" runat="server" __designer:wfdid="w265" Text='<%# Bind("EmployeeName") %>'></asp:TextBox> 
</edititemtemplate>
                    <headertemplate>
<asp:LinkButton id="LinkButton7" runat="server" Text='<%# ResourceHelper.GetFromResource("Employee Name") %>' CommandArgument="EmployeeName" CommandName="Sort" CausesValidation="False"></asp:LinkButton>
</headertemplate>
                    <itemtemplate>
<asp:HyperLink id="lnkEmployeeName" onclick="window.open (this.href, 'popupwindow', 'width=1000,height=675,left=0,top=0,scrollbars=yes'); return false;" runat="server" __designer:wfdid="w264" Text='<%# Bind("EmployeeName") %>' NavigateUrl="~/Employee/AccountEmployeeTimeEntryWeekViewReadOnly.aspx"></asp:HyperLink> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Left" width="150px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Timesheet Period %>">
                    <itemtemplate>
<asp:Label id="Label1" runat="server" __designer:wfdid="w22" Text='<%# Format("{0:d}",Eval("TimeEntryStartDate")) %>'></asp:Label>&nbsp;- <asp:Label id="Label2" runat="server" __designer:wfdid="w23" Text='<%# Format("{0:d}",Eval("TimeEntryEndDate")) %>'></asp:Label>
</itemtemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Billable Hours %>">
                    <footertemplate>
<asp:Label id="lblSumBillableTime" runat="server" __designer:wfdid="w30"></asp:Label>
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblBillableTime" runat="server" __designer:wfdid="w30"></asp:Label>
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Non-billable Hours %>">
                    <footertemplate>
<asp:Label id="lblSumNonBillableTime" runat="server" __designer:wfdid="w30"></asp:Label>
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblNonBillableTime" runat="server" __designer:wfdid="w30"></asp:Label>
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Total Hours %>">
                    <footertemplate>
<asp:Label id="lblSumTotalTime" runat="server" __designer:wfdid="w20"></asp:Label> 
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblTotalTime" runat="server" __designer:wfdid="w18"></asp:Label> 
</itemtemplate>
                    <footerstyle horizontalalign="Center" width="55px" />
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="55px" />
                </asp:TemplateField>
        <asp:TemplateField HeaderText="Total Percentage" Visible="False">
            <footertemplate>
    <asp:Label id="lblSumPercentage" runat="server" __designer:wfdid="w8"></asp:Label> 
</footertemplate>
            <itemstyle horizontalalign="Center" width="55px" />
            <headerstyle horizontalalign="Center" />
            <itemtemplate>
<asp:Label id="lblPercentage" runat="server" __designer:wfdid="w6"></asp:Label> 
</itemtemplate>
            <footerstyle horizontalalign="Center" width="55px" />
        </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approved %>">
                    <itemtemplate>
<asp:RadioButton id="chkEmployeeManager" runat="server" GroupName="EmployeeManager" __designer:wfdid="w5"></asp:RadioButton> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="65px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Rejected %>">
                    <itemtemplate>
<asp:RadioButton id="chkEmployeeManagerRejected" runat="server" GroupName="EmployeeManager" __designer:wfdid="w9"></asp:RadioButton> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="65px" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="<%$ Resources:TimeLive.Web, Approver's Comments %>">
                    <itemtemplate>
<asp:TextBox id="EmployeeManagerCommentsTextBox" runat="server" Width="100%" TextMode="MultiLine" __designer:wfdid="w10"></asp:TextBox> 
</itemtemplate>
                    <headerstyle horizontalalign="Center" />
                    <itemstyle horizontalalign="Center" width="150px" />
                </asp:TemplateField>
                <asp:BoundField DataField="AccountEmployeeTimeEntryId" HeaderText="<%$ Resources:TimeLive.Web, Id %>"
                    SortExpression="AccountEmployeeTimeEntryId" Visible="False" />
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllEmployeeManager" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates5(true);" Visible="False">
            <asp:Literal ID="Literal6" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved%> "></asp:Literal></asp:LinkButton>
        <asp:LinkButton ID="UnCheckAllEmployeeManager" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates5(false);" Visible="False">
            <asp:Literal ID="Literal7" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved%> "></asp:Literal></asp:LinkButton><asp:ObjectDataSource ID="dsApprovalEntriesForEmployeeManagerObject" runat="server"
    OldValuesParameterFormatString="original_{0}" SelectMethod="GetApprovalEntriesForEmployeeManagerSummarize"
    TypeName="AccountEmployeeTimeEntryBLL">
    <FilterParameters>
        <asp:Parameter DefaultValue="39" Direction="Output" Name="AccountEmployeeId" Type="Int32" />
    </FilterParameters>
    <SelectParameters>
        <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
            Type="Int32" />
        <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="39" Name="TimeEntryAccountEmployeeId"
            PropertyName="SelectedValue" Type="Int32" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryStartDate" Type="DateTime" />
        <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryEndDate" Type="DateTime" />
        <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
            PropertyName="Checked" Type="Boolean" />
    </SelectParameters>
</asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel3" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" Caption="Specific Employee Time Off Approvals"
            DataKeyNames="AccountEmployeeTimeEntryId,AccountApprovalTypeId,AccountApprovalPathId,IsReject,IsApproved,AccountEmployeeId,ApprovalPathSequence,MaxApprovalPathSequence,AccountTimeOffTypeId,TotalMinutes,TimeEntryAccountEmployeeId,AccountEmployeeTimeEntryPeriodId"
            DataSourceID="dsApprovalEntriesForSpecificEmployeeForTimeOffObject" OnDataBound="GridView6_DataBound"
            OnRowDataBound="GridView6_RowDataBound" ShowFooter="True" SkinID="xgridviewSkinEmployee">
            <Columns>
                <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" SortExpression="EmployeeName" />
                <asp:BoundField DataField="TimeEntryDate" DataFormatString="{0:d}" HeaderText="Date"
                    HtmlEncode="False" />
                <asp:BoundField DataField="AccountTimeOffType" HeaderText="Time Off Type" />
                <asp:TemplateField HeaderText="Total Hours">
                    <footertemplate>
<asp:Label id="lblSumTotalTime" runat="server" __designer:wfdid="w10"></asp:Label>
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblTotalTime" runat="server" __designer:wfdid="w3"></asp:Label> 
</itemtemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:TemplateField HeaderText="Approved">
                    <itemtemplate>
<asp:RadioButton id="chkSpecificEmployeeTimeOff" runat="server" __designer:wfdid="w8" GroupName="SpecificEmployeeTimeOff"></asp:RadioButton> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rejected">
                    <itemtemplate>
<asp:RadioButton id="chkSpecificEmployeeTimeOffRejected" runat="server" __designer:wfdid="w9" GroupName="SpecificEmployeeTimeOff"></asp:RadioButton> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <itemtemplate>
<asp:TextBox id="SpecificEmployeeTimeOffCommentsTextBox" runat="server" __designer:wfdid="w5" TextMode="MultiLine" Width="100%"></asp:TextBox>
</itemtemplate>
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <asp:ObjectDataSource ID="dsApprovalEntriesForSpecificEmployeeForTimeOffObject" runat="server"
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetApprovalEntriesSpecificEmployeeForTimeOff"
            TypeName="AccountEmployeeTimeEntryBLL">
            <FilterParameters>
                <asp:Parameter DefaultValue="39" Direction="Output" Name="AccountEmployeeId" Type="Int32" />
            </FilterParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="39" Name="TimeEntryAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryStartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryEndDate" Type="DateTime" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
<br />
<asp:UpdatePanel ID="UpdatePanel7" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" Caption="Employee Manager Time Off Approvals"
            DataKeyNames="AccountEmployeeTimeEntryId,AccountApprovalTypeId,AccountApprovalPathId,IsReject,IsApproved,AccountEmployeeId,ApprovalPathSequence,MaxApprovalPathSequence,EmployeeManagerId,AccountTimeOffTypeId,TotalMinutes,TimeEntryAccountEmployeeId,AccountEmployeeTimeEntryPeriodId"
            DataSourceID="dsApprovalEntriesForEmployeeManagerForTimeOffObject" OnDataBound="GridView7_DataBound"
            OnRowDataBound="GridView7_RowDataBound" ShowFooter="True" SkinID="xgridviewSkinEmployee">
            <Columns>
                <asp:BoundField DataField="EmployeeName" HeaderText="Employee Name" SortExpression="EmployeeName" />
                <asp:BoundField DataField="TimeEntryDate" DataFormatString="{0:d}" HeaderText="Date"
                    HtmlEncode="False" />
                <asp:BoundField DataField="AccountTimeOffType" HeaderText="Time Off Type" />
                <asp:TemplateField HeaderText="Total Hours">
                    <footertemplate>
<asp:Label id="lblSumTotalTime" runat="server" __designer:wfdid="w14"></asp:Label>
</footertemplate>
                    <itemtemplate>
<asp:Label id="lblTotalTime" runat="server" __designer:wfdid="w12"></asp:Label> 
</itemtemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="Description" HeaderText="Description" />
                <asp:TemplateField HeaderText="Approved">
                    <itemtemplate>
<asp:RadioButton id="chkEmployeeManagerTimeOff" runat="server" __designer:wfdid="w6" GroupName="EmployeeManagerTimeOff"></asp:RadioButton> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Rejected">
                    <itemtemplate>
<asp:RadioButton id="chkEmployeeManagerTimeOffRejected" runat="server" __designer:wfdid="w7" GroupName="EmployeeManagerTimeOff"></asp:RadioButton> 
</itemtemplate>
                    <itemstyle horizontalalign="Center" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Comments">
                    <itemtemplate>
<asp:TextBox id="EmployeeManagerTimeOffCommentsTextBox" runat="server" TextMode="MultiLine" Width="100%" __designer:wfdid="w8"></asp:TextBox> 
</itemtemplate>
                </asp:TemplateField>
            </Columns>
        </x:GridView>
        <asp:LinkButton ID="CheckAllSpecificEmployeeForTimeOff" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates6(true);" Visible="False">
            <asp:Literal ID="Literal85" runat="server" Text="<%$ Resources:TimeLive.Web, Check-All Approved %>"></asp:Literal>
        </asp:LinkButton>
        <asp:LinkButton ID="UnCheckAllSpecificEmployeeForTimeOff" runat="server" CssClass="FeatureHeadingIcon"
            OnClientClick="ChangeAllCheckBoxStates6(false);" Visible="False">
            <asp:Literal ID="Literal37" runat="server" Text="<%$ Resources:TimeLive.Web, Uncheck-All Approved %>"></asp:Literal>
        </asp:LinkButton><asp:ObjectDataSource ID="dsApprovalEntriesForEmployeeManagerForTimeOffObject"
            runat="server" OldValuesParameterFormatString="original_{0}" SelectMethod="GetApprovalEntriesEmployeeManagerForTimeOff"
            TypeName="AccountEmployeeTimeEntryBLL">
            <FilterParameters>
                <asp:Parameter DefaultValue="39" Direction="Output" Name="AccountEmployeeId" Type="Int32" />
            </FilterParameters>
            <SelectParameters>
                <asp:SessionParameter DefaultValue="39" Name="AccountEmployeeId" SessionField="AccountEmployeeId"
                    Type="Int32" />
                <asp:ControlParameter ControlID="ddlAccountEmployeeId" DefaultValue="39" Name="TimeEntryAccountEmployeeId"
                    PropertyName="SelectedValue" Type="Int32" />
                <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryStartDate" Type="DateTime" />
                <asp:Parameter DefaultValue="11/02/2006" Name="TimeEntryEndDate" Type="DateTime" />
                <asp:ControlParameter ControlID="chkIncludeDateRange" DefaultValue="0" Name="IncludeDateRange"
                    PropertyName="Checked" Type="Boolean" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
