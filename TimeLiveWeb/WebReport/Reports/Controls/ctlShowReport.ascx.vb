
Partial Class WebReport_Reports_Controls_ctlShowReport
    Inherits System.Web.UI.UserControl

    Protected Sub CtlLiveReportFilter1_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles CtlLiveReportFilter1.Load
    End Sub
    Protected Sub CtlLiveReportFilter1_ShowClicked(ByVal WhereClause As String, ByVal Consolidated As Boolean, ByVal BaseCurrencyId As Integer) Handles CtlLiveReportFilter1.ShowClicked
        ApplyFilter(WhereClause, Consolidated, BaseCurrencyId)
    End Sub
    Public Sub ApplyFilter(ByVal WhereClause As String, ByVal Consolidated As Boolean, ByVal BaseCurrencyId As Integer)
        Me.ViewState.Item("WhereClause") = WhereClause
        Dim ReportId As New Guid(Me.Request.QueryString("AccountReportId"))
        Dim ReportDataTable As DataTable = LiveReportData.GetDataTable(ReportId, Me.ViewState.Item("WhereClause"))
        Me.ReportControl1.SetDataSource(ReportDataTable, Consolidated)
        Me.ReportControl1.RenderReport()
        Me.AddParameterColumns(BaseCurrencyId)
        Me.ReportControl1.ShowReportFromFilter()
    End Sub
    Protected Sub CtlLiveReportFilter1_PageLoad(ByVal WhereClause As String, ByVal Consolidated As Boolean, ByVal BaseCurrencyId As Integer) Handles CtlLiveReportFilter1.PageLoad
        If Me.ViewState.Item("WhereClause") Is Nothing Then
            Me.ViewState.Item("WhereClause") = WhereClause
        End If
        Me.ApplyFilter(Me.ViewState.Item("WhereClause"), Consolidated, BaseCurrencyId)
        If Not Me.IsPostBack Then
        End If
    End Sub
    Public Sub AddParameterColumns(ByVal BaseCurrencyId As Integer)
        Dim BLL As New AccountCurrencyBLL
        Dim dt As AccountCurrency.vueAccountCurrencyDataTable = BLL.GetvueAccountCurrencyByAccountCurrencyId(BaseCurrencyId)
        Dim dr As AccountCurrency.vueAccountCurrencyRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Me.ReportControl1.AddParameterColumn("ParameterCurrencyCode", dr.CurrencyCode, GetType(System.String))
            Me.ReportControl1.AddParameterColumn("ParameterCurrencyExchangeRate", dr.ExchangeRate, GetType(System.Double))
        End If
    End Sub
End Class
