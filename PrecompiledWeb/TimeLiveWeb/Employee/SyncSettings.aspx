<%@ page title="" language="VB" masterpagefile="~/Masters/MasterPageEmployee.master" autoeventwireup="false" inherits="Employee_SyncSettings, App_Web_v0exk3tf" enableviewstatemac="false" enableEventValidation="false" theme="SkinFile" viewStateEncryptionMode="Never" %>

<asp:Content ID="Content1" ContentPlaceHolderID="C" runat="Server">
    <asp:MultiView runat="server" ID="mvSettings" ActiveViewIndex="0">
        <asp:View runat="server" ID="vwForm">
            <h2>
                Default calendar</h2>
            <p>
                If you have selected default google calendar for sync and want chage it, you can
                <asp:LinkButton runat="server" ID="lbResetDefaukltCalendar" Text="reset default calendar"></asp:LinkButton>
            </p>
            <h2>
                Default project</h2>
            <p>
                Select default project and milestone for saving tasks from google calendar
            </p>
            <div>
                Project:&nbsp;
                <asp:DropDownList runat="server" ID="ddlProject">
                </asp:DropDownList>
            </div>
            <div>
                Milestone:&nbsp;
                <asp:DropDownList runat="server" ID="ddlMilestone">
                </asp:DropDownList>
            </div>
            <div>
                <asp:Button runat="server" ID="btSave" Text="Save" />
            </div>
            <div>
                <asp:Label runat="server" ID="lbMessage" ForeColor="#003300"  />
            </div>
        </asp:View>
        <asp:View runat="server" ID="vwPasswordResetDone">
            <h2>
                Success!</h2>
            <p>
                Your default google calendar has been reset. If you have more one calendar in your
                google account then during next sync you will can select calendar
            </p>
        </asp:View>
    </asp:MultiView>
</asp:Content>
