<%@ Page Title="" Language="VB" MasterPageFile="~/Masters/MasterPageEmployee.master"
    AutoEventWireup="false" CodeFile="SyncTasks.aspx.vb" Inherits="Employee_SyncTasks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C" runat="Server">
    <asp:Label runat="server" ID="lbExit" />
    <asp:MultiView runat="server" ID="mwSync" ActiveViewIndex="0">
        <asp:View runat="server" ID="vwCalendars">
            <h2>
                Select Calendar for sync</h2>
            <div style="margin-left: 100px; margin-right: 100px;">
                <asp:Repeater runat="server" ID="rpCalendars">
                    <ItemTemplate>
                        <div style="float: left; margin-right: 50px; margin-bottom: 50px; text-align: center;">
                            <img src="/Images/Google-Calendar-small.jpg" />
                            <div>
                                <asp:LinkButton runat="server" CommandName="cSelCalendar" CommandArgument='<%# Eval("Id.AbsoluteUri") %>'
                                    Text='<%# Eval("Title.Text") %>' />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div style="clear: both;">
            </div>
            <asp:CheckBox runat="server" ID="cbRemeberCalendar" Text="Always use this calendar" />
        </asp:View>
        <asp:View runat="server" ID="vwProgress">
            <div style="text-align: center">
                <h1>
                    Sync in progress...</h1>
            </div>
        </asp:View>
    </asp:MultiView>
</asp:Content>
