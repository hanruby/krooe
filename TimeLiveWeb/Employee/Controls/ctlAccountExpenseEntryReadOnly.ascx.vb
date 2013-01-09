
Partial Class Employee_Controls_ctlAccountExpenseEntryReadOnly
    Inherits System.Web.UI.UserControl
    Dim SumTotalAmount As Double = 0
    Dim SumTaxAmount As Double = 0
    Dim SumNetAmount As Double = 0
    Dim TotalReimbursementAmount As Double = 0
    Dim dtAccountEmployeeId As Integer
    Dim EmployeeName As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        LocaleUtilitiesBLL.SetPageCultureSetting(Me.Page)
        Me.Literal3.Text = ResourceHelper.GetFromResource("Employee Name:")
        Me.Literal2.Text = ResourceHelper.GetFromResource("Description:")
        Me.Literal1.Text = ResourceHelper.GetFromResource("Date:")
        Me.RCurrencyLiteral.Text = ResourceHelper.GetFromResource("Reimbursement Currency:")
        Me.RTotalLiteral.Text = ResourceHelper.GetFromResource("Total Reimbursement :")
        Me.txtExpenseSheetFooter.Text = DBUtilities.GetExpenseSheetPrintFooter()
        SetMasterValue()
        SetGridViewDataSource()
        Me.SetImageUrl()
        Me.SetESignUrl()
        If Me.Request.QueryString("IsPrint") = "True" Then
            If Not IsPostBack Then
                Me.Page.ClientScript.RegisterStartupScript(Me.GetType, "Print", "javascript:window.print();", True)
            End If
        End If
        Me.lblSignedBy.Text = GetEmployeeName()
        Me.lblTimestamp.Text = Now
    End Sub
    Public Function GetEmployeeName() As String
        dtAccountEmployeeId = IIf(Me.Request.QueryString("AccountEmployeeId") Is Nothing, 0, Me.Request.QueryString("AccountEmployeeId"))
        Dim BLL As New AccountEmployeeBLL
        Dim dtEmployee As AccountEmployee.AccountEmployeeDataTable = BLL.GetAccountEmployeesByAccountEmployeeId(dtAccountEmployeeId)
        Dim drEmployee As AccountEmployee.AccountEmployeeRow
        If dtEmployee.Rows.Count > 0 Then
            drEmployee = dtEmployee.Rows(0)
            EmployeeName = drEmployee.FirstName & " " & drEmployee.LastName
            Return EmployeeName
        Else
            Return ""
        End If
    End Function
    Public Sub SetMasterValue()
        Dim BLL As New AccountEmployeeExpenseSheetBLL
        Dim AccountEmployeeExpenseSheetId As New Guid(Me.Request.QueryString("AccountEmployeeExpenseSheetId"))
        Dim dt As AccountExpenseEntry.vueAccountEmployeeExpenseSheetDataTable = BLL.GetvueAccountEmployeeExpenseSheetByAccountEmployeeExpenseSheetId(AccountEmployeeExpenseSheetId)
        Dim dr As AccountExpenseEntry.vueAccountEmployeeExpenseSheetRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Me.lblEmployeeName.Text = dr.EmployeeName
            Me.lblDescription.Text = dr.Description
            Me.lblDate.Text = dr.ExpenseSheetDate
        Else
            Me.lblEmployeeName.Text = ""
            Me.lblDescription.Text = ""
            Me.lblDate.Text = ""
        End If
    End Sub
    Public Sub SetReimburseAmountAndCurrency(ByVal TotalAmount As Double)
        Dim BLL As New AccountExpenseEntryBLL
        Dim AccountEmployeeExpenseSheetId As New Guid(Me.Request.QueryString("AccountEmployeeExpenseSheetId"))
        Dim dt As AccountExpenseEntry.vueAccountReimbursementCurrencyDataTable = New AccountExpenseEntryBLL().GetvueAccountReimbursementCurrencyByAccountId(DBUtilities.GetSessionAccountId)
        Dim dr As AccountExpenseEntry.vueAccountReimbursementCurrencyRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Me.lblReimbursCurrency.Text = dr.CurrencyCode
            Me.lblReimburseAmount.Text = BLL.GetTotalReimbursementAmount(TotalAmount, dr.AccountReimbursementCurrencyId)
        End If
    End Sub
    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
        SumTotalAmount = 0
        SumTaxAmount = 0
        SumNetAmount = 0
        TotalReimbursementAmount = 0
        If LocaleUtilitiesBLL.ShowTaskInExpenseSheet = True Then
            Me.GridView1.Columns(2).Visible = True
        Else
            Me.GridView1.Columns(2).Visible = False
        End If
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            Dim dtExpenseEntry As TimeLiveDataSet.vueAccountExpenseEntryDataTable = New AccountExpenseEntryBLL().GetvueAccountExpenseEntriesByAccountExpenseEntryId(DataBinder.Eval(e.Row.DataItem, "AccountExpenseEntryId"))
            If DataBinder.Eval(e.Row.DataItem, "AccountExpenseEntryId") = 0 Then
                CType(e.Row.Cells(10).FindControl("AttachmentHyperLink"), HyperLink).Visible = False
                Exit Sub
            End If
            Dim drExpenseEntry As TimeLiveDataSet.vueAccountExpenseEntryRow = dtExpenseEntry.Rows(0)

            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "Amount")) Then
                SumTotalAmount += DataBinder.Eval(e.Row.DataItem, "Amount") / drExpenseEntry.ExchangeRate
            End If
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "NetAmount")) Then
                SumNetAmount += DataBinder.Eval(e.Row.DataItem, "NetAmount")
            End If
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "TaxAmount")) Then
                SumTaxAmount += DataBinder.Eval(e.Row.DataItem, "TaxAmount")
            End If
            If Not IsDBNull(DataBinder.Eval(e.Row.DataItem, "Reimburse")) And DataBinder.Eval(e.Row.DataItem, "Reimburse") <> "False" Then
                Dim CurrencyBLL As New AccountCurrencyBLL
                Dim ExchangeRate As Double = CurrencyBLL.GetExchangeRateByAccountCurrencyId(DataBinder.Eval(e.Row.DataItem, "AccountCurrencyId"))
                TotalReimbursementAmount += DataBinder.Eval(e.Row.DataItem, "Amount") / ExchangeRate
            End If
            SetReimburseAmountAndCurrency(TotalReimbursementAmount)
            Dim dt As TimeLiveDataSet.CountAccountExpenseEntryIdDataTable = New AccountAttachmentsBLL().GetCountAccountExpenseEntryId(DataBinder.Eval(e.Row.DataItem, "AccountExpenseEntryId"))
            Dim dr As TimeLiveDataSet.CountAccountExpenseEntryIdRow
            If dt.Rows.Count > 0 Then
                dr = dt.Rows(0)
                CType(e.Row.Cells(10).FindControl("AttachmentHyperlink"), HyperLink).Text = dr.TotalCount
            End If
        ElseIf e.Row.RowType = DataControlRowType.Footer Then
            SetFooterAmount(e)
        End If
    End Sub
    Public Sub SetFooterAmount(ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs)
        Dim dtAccountBaseCurrency As AccountCurrencyExchangeRate.vueAccountBaseCurrencyDataTable = New AccountCurrencyExchangeRateBLL().GetvueAccountBaseCurrencyByAccountId(DBUtilities.GetSessionAccountId)
        Dim drAccountBaseCurrency As AccountCurrencyExchangeRate.vueAccountBaseCurrencyRow
        If dtAccountBaseCurrency.Rows.Count > 0 Then
            drAccountBaseCurrency = dtAccountBaseCurrency.Rows(0)

            Dim dtAccountCurrency As AccountCurrency.vueAccountCurrencyDataTable = New AccountCurrencyBLL().GetvueAccountCurrencyByAccountCurrencyId(drAccountBaseCurrency.AccountBaseCurrencyId)
            Dim drAccountCurrency As AccountCurrency.vueAccountCurrencyRow
            If dtAccountCurrency.Rows.Count > 0 Then
                drAccountCurrency = dtAccountCurrency.Rows(0)

                Dim TotalFooterAmount As Double = drAccountCurrency.ExchangeRate * SumTotalAmount

                e.Row.Cells(11).Text = drAccountBaseCurrency.CurrencyCode & " " & String.Format("{0:N}", TotalFooterAmount)
                e.Row.Cells(11).HorizontalAlign = HorizontalAlign.Right
                e.Row.Cells(8).Text = String.Format("{0:N}", SumNetAmount)
                e.Row.Cells(8).HorizontalAlign = HorizontalAlign.Right
                e.Row.Cells(10).Text = String.Format("{0:N}", SumTaxAmount)
                e.Row.Cells(10).HorizontalAlign = HorizontalAlign.Right
            End If
        End If
    End Sub
    Public Sub SetGridViewDataSource()
        Me.GridView1.DataSourceID = ""
        If Me.Request.QueryString("IsPrint") = "True" Or Me.Request.QueryString("IsFromArchive") = "True" Then
            Me.GridView1.DataSourceID = "dsAccountExpenseEntryForPrintObject"
        Else
            Me.GridView1.DataSourceID = "dsAccountExpenseEntryObject"
        End If
        Me.GridView1.DataBind()
    End Sub
    Public Sub SetImageUrl()
        If LocaleUtilitiesBLL.IsShowCompanyOwnLogo = True And LocaleUtilitiesBLL.IsLogoFileExistInSessionAccount = True Then
            imgCompanyLogo.ImageUrl = "~/Uploads/" & DBUtilities.GetSessionAccountId & "/Logo/CompanyLogo.gif"
        Else
            imgCompanyLogo.ImageUrl = "~/Images/TopHeader.jpg"
        End If
    End Sub
    Public Sub SetESignUrl()
        If LocaleUtilitiesBLL.IsShowElectronicSign = True And LocaleUtilitiesBLL.IsElectronicSignExistInSessionAccount = True Then
            imgElectronicSignature.ImageUrl = "~/Uploads/" & DBUtilities.GetSessionAccountId & "/" & DBUtilities.GetSessionAccountEmployeeId & "/Sign/E-Sign.gif"
        Else
            imgElectronicSignature.Visible = False
            'imgCompanyLogo.ImageUrl = "~/Images/TopHeader.jpg"
        End If
    End Sub
End Class
