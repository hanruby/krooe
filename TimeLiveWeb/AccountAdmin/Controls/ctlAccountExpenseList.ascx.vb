
Partial Class AccountAdmin_Controls_ctlAccountExpenseList
    Inherits System.Web.UI.UserControl
    Dim IsBillable As System.Nullable(Of Boolean)
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Select" Then
            Me.FormView1.ChangeMode(FormViewMode.Edit)
        End If
    End Sub

    Protected Sub dsAccountExpenseFormObject_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountExpenseFormObject.Inserted
        DBUtilities.AfterInsert(Me.GridView1)
    End Sub

    Protected Sub dsAccountExpenseFormObject_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountExpenseFormObject.Inserting
        DBUtilities.SetRowForInserting(e)
    End Sub

    Protected Sub dsAccountExpenseFormObject_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountExpenseFormObject.Updated
        DBUtilities.AfterUpdate(Me.GridView1)
    End Sub

    Protected Sub dsAccountExpenseFormObject_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountExpenseFormObject.Updating
        DBUtilities.SetRowForUpdating(e)
    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        UIUtilities.ClearCellsForNoRecords(e.Row)

        Dim IsBillable As Boolean = IIf(IsDBNull(DataBinder.Eval(e.Row.DataItem, "IsBillable")), False, DataBinder.Eval(e.Row.DataItem, "IsBillable"))
        If IsBillable <> True And Not e.Row.FindControl("Label1") Is Nothing Then
            e.Row.Cells(2).Text = " "
        ElseIf IsBillable <> False And Not e.Row.FindControl("Label1") Is Nothing Then
            e.Row.Cells(2).Text = "Yes"
        End If

        'If IsDBNull(Me.FormView1.FindControl("chkBillable")) Or CType(Me.FormView1.FindControl("chkBillable"), CheckBox).Checked = False And Not e.Row.FindControl("Label1") Is Nothing Then
        '    e.Row.Cells(2).Text = " "
        'ElseIf CType(Me.FormView1.FindControl("chkBillable"), CheckBox).Checked = True And Not e.Row.FindControl("Label1") Is Nothing Then
        '    e.Row.Cells(2).Text = "Yes"
        'End If

    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)

        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            If Not IsDBNull(Me.FormView1.DataItem("IsBillable")) Then
                CType(Me.FormView1.FindControl("chkBillable"), CheckBox).Checked = Me.FormView1.DataItem("IsBillable")

            End If
        ElseIf Me.FormView1.CurrentMode = FormViewMode.Insert Then
            CType(Me.FormView1.FindControl("ExpenseRateTextBox"), TextBox).Text = 0
        End If
        Dim dt As TimeLiveDataSet.vueAccountExpenseDataTable = New AccountExpenseBLL().GetvueAccountExpensesByAccountId(DBUtilities.GetSessionAccountId)
        Dim dr As TimeLiveDataSet.vueAccountExpenseRow
        If dt.Rows.Count > 0 Then
            dr = dt.Rows(0)
            Dim row As GridViewRow
            For Each row In Me.GridView1.Rows
                If dr.AccountExpenseId > 0 Then
                    Dim IsBillable As Boolean = IIf(IsDBNull(CType(row.FindControl("chkBillable"), CheckBox).Checked), "False", CType(row.FindControl("chkBillable"), CheckBox).Checked)
                    If IsBillable <> True And Not row.FindControl("Label1") Is Nothing Then
                        row.Cells(2).Text = " "
                    ElseIf IsBillable <> False And Not row.FindControl("Label1") Is Nothing Then
                        row.Cells(2).Text = "Yes"
                    End If
                End If
            Next
        End If
        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            If Not IsDBNull(Me.FormView1.DataItem("AccountExpenseTypeId")) Then
                ''CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountExpenseTypeId")
                Me.dsAccountExpenseTypeObject.SelectParameters("AccountExpenseTypeId").DefaultValue = Me.FormView1.DataItem("AccountExpenseTypeId")
                CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountExpenseTypeId")
            End If
        End If
    End Sub

    Protected Sub FormView1_ModeChanging(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewModeEventArgs)

    End Sub

    Protected Sub FormView1_ModeChanged(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        UIUtilities.OnInsertException(e, "Specified expense already exist")
    End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        Me.GridView1.DataBind()
        Me.FormView1.DataBind()
    End Sub

    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            e.NewValues("IsBillable") = CType(Me.FormView1.FindControl("chkBillable"), CheckBox).Checked
            e.NewValues("AccountExpenseTypeId") = CType(Me.FormView1.FindControl("Dropdownlist1"), DropDownList).SelectedValue
        End If

    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        UIUtilities.OnDeleteException(e)
        UIUtilities.AfterGridViewRowDelete(Me.FormView1)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Me.IsPostBack Then
            AccountPagePermissionBLL.SetPagePermission(5, Me.GridView1, Me.FormView1, "btnAdd", 4, 5)
        End If

    End Sub
End Class
