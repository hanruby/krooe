<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlTimesheetImportExport, App_Web_uitpp31g" %>
</br>
    <table class="xFormView" width="99%">
     <tr>
                    <td class="caption" colspan="2">
                        Offline Timesheet Information</td>
                </tr>
                <tr>
                    <td class="FormViewSubHeader" colspan="2">
                        Offline Timesheet</td>
                </tr>
        <tr>
            <td class="FormViewLabelCell">
                Upload File: </td>
            <td>
                <asp:FileUpload ID="txtFileUpload" runat="server" Width="98%" />
            </td>
        </tr>
        <tr>
            <td class="FormViewLabelCell">
                &nbsp;</td>
            <td>
                <asp:Button ID="cmdProceed" runat="server" 
                    Text="<%$ Resources:TimeLive.Web, Proceed_text%> " />
            </td>
        </tr>
    </table>
<asp:Label ID="lblException" Text="" runat="server" CssClass="ErrorMessage" Font-Bold="True"
    Font-Names="Tahoma" Font-Size="Medium"></asp:Label><asp:Label
        ID="lblRowsInserted" runat="server" Font-Bold="True" Font-Names="Tahoma" Font-Size="Medium"
        ForeColor="Blue"></asp:Label>&nbsp;&nbsp;

<asp:GridView ID="GridView1" runat="server"  AutoGenerateColumns=False 
    cssclass="xGridView" Caption="Column Mapping" Width="96%" Visible="False">
    <Columns>
        <asp:BoundField HeaderText="TimeLive Column" />
        <asp:BoundField DataField="DBColumnName" HeaderText="TimeLive Column" />
        <asp:TemplateField HeaderText="FileColumnName">
            <EditItemTemplate>
                &nbsp;
            </EditItemTemplate>
            <ItemTemplate>
                &nbsp;<asp:DropDownList ID="ddlFileColumnName" runat="server" Width="98%" AppendDataBoundItems="True">
                    <asp:ListItem>Select</asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="Required" HeaderText="Required" />
    </Columns>
</asp:GridView> 
