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
            <div id="dLog">
            </div>
            <div style="text-align: center; display: none;" id="dResult">
                <a href="/Employee/MyTasks.aspx">Go to my tasks</a>
            </div>
            <script type="text/javascript">
                var lastTS = -1;
                loadState();
                function loadState() {
                    var xmlhttp;
                    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
                        xmlhttp = new XMLHttpRequest();
                    }
                    else {// code for IE6, IE5
                        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
                    }
                    xmlhttp.onreadystatechange = function () {
                        if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
                            var old = document.getElementById("dLog").innerHTML;
                             var objJSON = eval("(function(){return " + xmlhttp.responseText + ";})()");
                            //var objJSON = JSON.parse(xmlhttp.responseText);
                            document.getElementById("dLog").innerHTML = old + unescape(objJSON.Text);
                            lastTS = objJSON.TS;
                            if (objJSON.Done) {
                                document.getElementById("dResult").style.display = "block";
                            }
                            else {
                                window.setTimeout("loadState()", 500);
                            }
                        }
                    }
                    xmlhttp.open("POST", "/Employee/SyncTasks.aspx?isCallback=1&TS=" + lastTS, true);
                    xmlhttp.send();
                }
            </script>
        </asp:View>
    </asp:MultiView>
</asp:Content>
