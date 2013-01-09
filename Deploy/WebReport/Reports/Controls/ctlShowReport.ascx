<%@ control language="VB" autoeventwireup="false" inherits="WebReport_Reports_Controls_ctlShowReport, App_Web_3d3bkzq3" %>
<%@ Register Src="../../RuntimeReport/Controls/ReportControl.ascx" TagName="ReportControl"
    TagPrefix="uc2" %>
<%@ Register Src="../../Filters/Controls/ctlLiveReportFilter.ascx" TagName="ctlLiveReportFilter"
    TagPrefix="uc1" %>

<table border="0" cellpadding="0" cellspacing="5" style="width: 98%">
    <tr>
        <td style="width: 100px" valign=top>

<uc1:ctlLiveReportFilter id="CtlLiveReportFilter1" runat="server"></uc1:ctlLiveReportFilter>
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
<uc2:ReportControl ID="ReportControl1" runat="server" />
        </td>
    </tr>
</table>
