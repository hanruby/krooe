
Partial Class WebReport_RuntimeReport_Controls_ReportControl
    Inherits System.Web.UI.UserControl
    Dim objReport As New LiveReport
    Dim ReportDataTable As DataTable
    Dim ReportDataSet As DataSet
    Dim IsConsolidated As Boolean
    Dim AccountReportId As Guid

    Public Sub SetDataSource(ByVal objDataTable As DataTable, ByVal Consolidated As Boolean)
        ReportDataTable = objDataTable
        ReportDataSet = New DataSet
        ReportDataSet.Tables.Add(ReportDataTable)
        IsConsolidated = Consolidated
    End Sub

    Protected Sub Page_DataBinding(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.DataBinding
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
    End Sub
    Public Sub ShowReport()
        Me.objReport.ShowReport()
        Me.ReportViewer1.DataBind()
    End Sub
    Public Sub AddParameterColumn(ByVal ParameterName As String, ByVal ParameterValue As String, ByVal ParameterType As System.Type)
        objReport.AddParameterColumn(ParameterName, ParameterValue, ParameterType)
    End Sub
    Public Sub RenderReport()
        objReport = New LiveReport
        AccountReportId = New Guid(Me.Request.QueryString("AccountReportId"))
        Me.ReportViewer1.Report = objReport.ReportObejct
        objReport.SetDataSource(ReportDataSet, ReportDataTable.TableName)
    End Sub
    Public Sub ShowReportFromFilter()
        Dim ReportAdapter As New dsReportDesignTableAdapters.AccountReportTableAdapter

        Dim dtReport As dsReportDesign.AccountReportDataTable = ReportAdapter.GetDataByAccountReportId(AccountReportId)
        Dim drReport As dsReportDesign.AccountReportRow = dtReport.Rows(0)

        If drReport.ShowCompanyLogo = True Then
            If Not IsDBNull(LocaleUtilitiesBLL.IsShowCompanyOwnLogo) Then
                If LocaleUtilitiesBLL.IsShowCompanyOwnLogo = True And LocaleUtilitiesBLL.IsLogoFileExistInSessionAccount = True Then
                    objReport.AddCompanyLogoInHeader("CompanyLogo", "~/Uploads/" & DBUtilities.GetSessionAccountId & "/Logo/CompanyLogo.gif")
                End If
            End If
        End If
        If Not IsDBNull(drReport.Item("ReportTitle")) Then
            If drReport.ReportTitle <> "" Then
                objReport.AddReportTitleInHeader("Title", drReport.ReportTitle)
            End If
        End If
        If Not IsDBNull(drReport.Item("ReportHeader")) Then
            If drReport.ReportHeader <> "" Then
                objReport.AddReportHeaderInHeader("Header", drReport.ReportHeader)
            End If
        End If
        ''Adding Group In Report

        Dim ReportGroupAdapter As New dsReportControlTableAdapters.vueAccountReportGroupTableAdapter
        Dim dtReportGroup As dsReportControl.vueAccountReportGroupDataTable = ReportGroupAdapter.GetReportGroupsByReportId(AccountReportId)
        Dim drReportGroup As dsReportControl.vueAccountReportGroupRow

        If dtReportGroup.Rows.Count > 0 Then
            drReportGroup = dtReportGroup.Rows(0)

            For Each drReportGroup In dtReportGroup.Rows
                objReport.AddGroupInReport(drReportGroup.SystemReportDataSourceField, drReportGroup.ReportGroupFieldOrder, drReportGroup.ReportGroup, drReportGroup.ReportGroupFieldLabel, IsConsolidated, drReportGroup.SystemReportDataSourceFieldWidth, IIf(IsDBNull(drReportGroup.Item("CurrencyField")), "", drReportGroup.Item("CurrencyField")), drReportGroup.SystemReportFieldType)
            Next
        End If

        ''Adding Detail In Report

        Dim ReportControlAdapter As New dsReportControlTableAdapters.vueAccountReportColumnTableAdapter
        Dim dtReportControl As dsReportControl.vueAccountReportColumnDataTable = ReportControlAdapter.GetReportColumnsByReportId(AccountReportId)
        Dim drReportControl As dsReportControl.vueAccountReportColumnRow

        If dtReportControl.Rows.Count > 0 Then
            drReportControl = dtReportControl.Rows(0)
            For Each drReportControl In dtReportControl.Rows
                Dim Formula As String = IIf(IsDBNull(drReportControl.Item("ColumnFormula")), IIf(IsDBNull(drReportControl.Item("Formula")), "", drReportControl.Item("Formula")), drReportControl.Item("ColumnFormula"))
                If Formula <> "" Then
                    objReport.AddFormulaDataColumn(drReportControl.SystemReportDataSourceField, Formula, GetType(System.Object))
                End If
                If IsConsolidated <> True Then

                    objReport.AddDetailColumn(drReportControl.SystemReportDataSourceField, drReportControl.Caption, drReportControl.SystemReportDataSourceField, drReportControl.SystemReportFieldType, drReportControl.SystemReportDataSourceFieldWidth, IIf(IsDBNull(drReportControl.Item("CurrencyField")), "", drReportControl.Item("CurrencyField")), Formula)
                End If
            Next
        End If


        ''Adding Summary In Report

        Dim ReportSummaryAdapter As New dsReportControlTableAdapters.vueAccountReportSummaryTableAdapter
        Dim dtReportSummary As dsReportControl.vueAccountReportSummaryDataTable = ReportSummaryAdapter.GetDataForSummary(AccountReportId)
        Dim drReportSummary As dsReportControl.vueAccountReportSummaryRow
        If dtReportSummary.Rows.Count > 0 Then
            drReportSummary = dtReportSummary.Rows(0)
            For Each drReportSummary In dtReportSummary.Rows
                If drReportSummary.IsShowGroupTotal = True Then
                    If ReportDataTable.Columns(drReportSummary.SystemReportDataSourceField) Is Nothing OrElse Not Left(ReportDataTable.Columns(drReportSummary.SystemReportDataSourceField).Expression, 1).Contains("'") Then
                        objReport.AddGroupSummaryInReport(drReportSummary.SystemReportDataSourceField, drReportSummary.ReportGroup, drReportSummary.IsShowGroupTotal, drReportSummary.IsShowGrandTotal, "Object", drReportSummary.SystemReportFieldType, drReportSummary.Caption, drReportSummary.CalculationType, IsConsolidated, drReportSummary.SystemReportDataSourceFieldWidth, IIf(IsDBNull(drReportSummary.Item("Formula")), "", drReportSummary.Item("Formula")), drReportSummary.ShowCurrencyCodeInSummary, IIf(IsDBNull(drReportSummary.Item("CurrencyField")), "", drReportSummary.Item("CurrencyField")))
                    End If
                End If
                If drReportSummary.IsShowGrandTotal = True Then
                    If ReportDataTable.Columns(drReportSummary.SystemReportDataSourceField) Is Nothing OrElse Not Left(ReportDataTable.Columns(drReportSummary.SystemReportDataSourceField).Expression, 1).Contains("'") Then
                        objReport.AddGrandSummaryInReport(drReportSummary.SystemReportDataSourceField, "Object", drReportSummary.SystemReportFieldType, drReportSummary.SummaryCaption, drReportSummary.CalculationType, drReportSummary.SystemReportDataSourceFieldWidth, dtReportSummary.Count, IsConsolidated, drReportSummary.ShowCurrencyCodeInSummary, IIf(IsDBNull(drReportSummary.Item("CurrencyField")), "", drReportSummary.Item("CurrencyField")))
                    End If
                End If
            Next
        End If

        ''Setting Report Group In Report

        If dtReportGroup.Rows.Count > 0 Then
            drReportGroup = dtReportGroup.Rows(0)
            For Each drReportGroup In dtReportGroup.Rows
                objReport.SetReportGroup(drReportGroup.SystemReportDataSourceField, drReportGroup.ReportGroup, drReportGroup.ReportGroupFieldOrder, IsConsolidated, drReportGroup.SystemReportDataSourceFieldWidth)
            Next
        End If

        If Not IsDBNull(drReport.Item("ReportFooter")) Then
            If drReport.ReportFooter <> "" Then
                objReport.AddReportFooterInFooter("Footer", drReport.ReportFooter)
            End If
        End If

        'objReport.SetReportTitleAndHeaderWidth()
        ''Calling ShowReport Function

        Me.ShowReport()
    End Sub
End Class
