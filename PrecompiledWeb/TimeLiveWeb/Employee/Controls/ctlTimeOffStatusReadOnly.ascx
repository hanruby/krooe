<%@ control language="VB" autoeventwireup="false" inherits="Employee_Controls_ctlTimeOffStatusReadOnly, App_Web_uitpp31g" %>
<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <x:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Caption="<%$ Resources:TimeLive.Web, Time Off Status%> "
            DataKeyNames="AccountEmployeeTimeOffId" DataSourceID="dsTimeOffStatusGridViewObject"
            SkinID="xgridviewSkinEmployee" Width="500px">
            <Columns>
                <asp:BoundField DataField="AccountTimeOffType" HeaderText="<%$ Resources:TimeLive.Web, Time Off Type%> " SortExpression="AccountTimeOffType">
                    <itemstyle width="79%" />
                </asp:BoundField>
                <asp:BoundField DataField="Earned" HeaderText="<%$ Resources:TimeLive.Web, Earned%> ">
                    <itemstyle width="7%" />
                </asp:BoundField>
                <asp:BoundField DataField="Consume" HeaderText="<%$ Resources:TimeLive.Web, Consumed%> ">
                    <itemstyle width="7%" />
                </asp:BoundField>
                <asp:BoundField DataField="Available" HeaderText="<%$ Resources:TimeLive.Web, Available%> ">
                    <itemstyle width="7%" />
                </asp:BoundField>
            </Columns>
        </x:GridView>
        <asp:ObjectDataSource ID="dsTimeOffStatusGridViewObject" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetvueAccountEmployeeTimeOffByAccountEmployeeId" TypeName="AccountEmployeeTimeOffBLL">
            <SelectParameters>
                <asp:SessionParameter Name="AccountEmployeeId" SessionField="AccountEmployeeId" Type="Int32" />
            </SelectParameters>
        </asp:ObjectDataSource>
    </ContentTemplate>
</asp:UpdatePanel>
