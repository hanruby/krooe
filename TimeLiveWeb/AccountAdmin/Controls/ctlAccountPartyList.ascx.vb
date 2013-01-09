
Partial Class AccountAdmin_Controls_ctlAccountPartyList
    Inherits System.Web.UI.UserControl
    Dim MasterEntityTypeId As New Guid("e448aed9-eab5-4cf7-a171-2a86be2bba9e")
    Dim CustomFieldCaption As String
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Select" Then
            Me.FormView1.ChangeMode(FormViewMode.Edit)
            Dim AccountClientId = Me.GridView1.DataKeys(0)
            Me.FormView1.DataBind()
            ''Me.GridView1.DataBind()
        End If
    End Sub
    Protected Sub dsAccountPartyObject_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountPartyObject.Inserting
        DBUtilities.SetRowForInserting(e)
    End Sub
    Protected Sub dsAccountPartyObject_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountPartyObject.Updating
        DBUtilities.SetRowForUpdating(e)
    End Sub
    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        AccountPagePermissionBLL.SetPagePermission(8, Me.GridView1, Me.FormView1, "Add", 5, 6)
        If Me.FormView1.CurrentMode = FormViewMode.Insert Then
            CType(Me.FormView1.FindControl("ddlCountryId"), DropDownList).SelectedValue = DBUtilities.GetAccountCountryId
            Me.FormView1.Visible = False
        End If
        If Me.FormView1.CurrentMode = FormViewMode.Edit Then
            AccountCustomFieldBLL.SetCustomValuesForFormView_DataBound(FormView1)
            Me.FormView1.Visible = True
            Me.GridView1.Visible = False
            Me.btnAdd.Visible = False
            Me.btnDeleteSelectedItem.Visible = False
        End If
    End Sub
    Protected Sub FormView1_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles FormView1.ItemCommand
        If e.CommandName = "Cancel" Then
            Me.FormView1.ChangeMode(FormViewMode.Insert)
            Me.FormView1.DataBind()
            Me.GridView1.Visible = True
        End If
    End Sub
    Protected Sub dsAccountPartyForm_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountPartyForm.Inserted
        DBUtilities.AfterInsert(Me.GridView1)
    End Sub
    Protected Sub dsAccountPartyForm_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountPartyForm.Updated
        DBUtilities.AfterUpdate(Me.GridView1)
    End Sub
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        UIUtilities.ClearCellsForNoRecords(e.Row)

    End Sub
    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GridView1.RowDeleted
        UIUtilities.OnDeleteException(e)
        UIUtilities.AfterGridViewRowDelete(Me.FormView1)
    End Sub
    Protected Sub dsAccountPartyForm_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountPartyForm.Updating

    End Sub
    Protected Sub Add_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        'Me.FormView1.Visible = False
        'Me.GridView1.Visible = True
        'Me.btnAdd.Visible = True
        'Me.btnDeleteSelectedItem.Visible = True
    End Sub
    Protected Sub btnAdd_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnAdd.Click
        Me.FormView1.DataBind()
        Me.GridView1.Visible = False
        Me.btnAdd.Visible = False
        Me.FormView1.Visible = True
        Me.btnDeleteSelectedItem.Visible = False
    End Sub
    Protected Sub Cancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.FormView1.Visible = False
        Me.GridView1.Visible = True
        Me.btnAdd.Visible = True
        Me.btnDeleteSelectedItem.Visible = True
        Response.Redirect("~/AccountAdmin/AccountParties.aspx", False)
    End Sub
    Protected Sub Update_Click(ByVal sender As Object, ByVal e As System.EventArgs)

    End Sub
    Protected Sub Page_Init(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Init
        ''AccountPagePermissionBLL.SetPagePermission(8, Me.GridView1, Me.FormView1, "Add", 5, 6)
    End Sub
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        AccountPagePermissionBLL.SetPagePermission(8, Me.GridView1, Me.FormView1, "Add", 5, 6)
    End Sub
    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.FormView1.Visible = False
        Me.GridView1.Visible = True
        Me.btnAdd.Visible = True
        Me.btnDeleteSelectedItem.Visible = True
        Response.Redirect("~/AccountAdmin/AccountParties.aspx", False)
    End Sub
    Protected Sub FormView1_Init(ByVal sender As Object, ByVal e As System.EventArgs)
        'AccountPagePermissionBLL.SetPagePermission(8, Me.GridView1, Me.FormView1, "Add", 5, 6)
    End Sub
    Protected Sub FormView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting
        Me.dsAccountPartyForm.InsertParameters("CountryId").DefaultValue = CType(Me.FormView1.FindControl("ddlCountryId"), DropDownList).SelectedValue
        For n As Integer = 1 To 15
            AccountCustomFieldBLL.SetCustomValuesForFormView_Inserting(FormView1, e, MasterEntityTypeId, "CustomField" & n)
            If e.Cancel = True Then
                Dim CurrentPage As Page = System.Web.HttpContext.Current.CurrentHandler
                CustomFieldCaption = AccountCustomFieldBLL.GetCustomFieldCaption("CustomField" & n, MasterEntityTypeId)
                UIUtilities.ShowMessage(CustomFieldCaption & " Field is required.", CurrentPage)
            End If
        Next
    End Sub

    Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
        'Me.FormView1.Visible = False
        Me.GridView1.Visible = True
        Me.btnAdd.Visible = True
        Me.btnDeleteSelectedItem.Visible = True
    End Sub

    Protected Sub GridView1_DataBound(sender As Object, e As System.EventArgs) Handles GridView1.DataBound
        'TODO: CheckAll function
        'Each time the data is bound to the grid we need to build up the CheckBoxIDs array
        Dim row As GridViewRow
        For Each row In Me.GridView1.Rows
            If Me.GridView1.DataKeys(row.RowIndex).Item(0) <> 0 Then
                btnDeleteSelectedItem.Visible = True
                Dim cbHeader As CheckBox = CType(GridView1.HeaderRow.FindControl("chkCheckAll"), CheckBox)

                'Run the ChangeCheckBoxState client-side function whenever the
                'header checkbox is checked/unchecked
                cbHeader.Attributes("onclick") = "ChangeAllCheckBoxStates(this.checked);"

                For Each gvr As GridViewRow In GridView1.Rows
                    'Get a programmatic reference to the CheckBox control
                    Dim cb As CheckBox = CType(gvr.FindControl("chkselect"), CheckBox)

                    'Add the CheckBox's ID to the client-side CheckBoxIDs array
                    ScriptManager.RegisterArrayDeclaration(Me, "CheckBoxIDs", String.Concat("'", cb.ClientID, "'"))
                Next
            End If
        Next
        'Get the header CheckBox
    End Sub

    Protected Sub btnDeleteSelectedItem_Click(sender As Object, e As System.EventArgs) Handles btnDeleteSelectedItem.Click
        Dim row As GridViewRow
        Dim Original_AccountClientId As Integer
        For Each row In Me.GridView1.Rows
            If Me.GridView1.DataKeys(row.RowIndex)(0) <> 0 Then
                If CType(row.FindControl("chkSelect"), CheckBox).Checked = True Then
                    Original_AccountClientId = Me.GridView1.DataKeys(row.RowIndex)(0)
                    Dim BLL As New AccountPartyBLL
                    Original_AccountClientId = New AccountPartyBLL().DeleteAccountParty(Original_AccountClientId)
                End If
            End If
        Next
        Me.GridView1.DataBind()
    End Sub

    Protected Sub GridView1_RowDeleting(sender As Object, e As System.Web.UI.WebControls.GridViewDeleteEventArgs) Handles GridView1.RowDeleting

    End Sub

    Protected Sub FormView1_ItemCreated(sender As Object, e As System.EventArgs) Handles FormView1.ItemCreated
        AccountCustomFieldBLL.CreateCustomFieldOnFormView_ItemCreated(FormView1, New Guid("e448aed9-eab5-4cf7-a171-2a86be2bba9e"), , , "26px")
    End Sub

    Protected Sub FormView1_ItemInserted(sender As Object, e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
        Me.FormView1.Visible = False
        Me.GridView1.Visible = True
        Me.btnAdd.Visible = True
        Me.btnDeleteSelectedItem.Visible = True
    End Sub
    Protected Sub FormView1_ItemUpdating(sender As Object, e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        For n As Integer = 1 To 15
            AccountCustomFieldBLL.SetCustomValuesForFormView_Updating(FormView1, e, MasterEntityTypeId, "CustomField" & n)
            If e.Cancel = True Then
                Dim CurrentPage As Page = System.Web.HttpContext.Current.CurrentHandler
                CustomFieldCaption = AccountCustomFieldBLL.GetCustomFieldCaption("CustomField" & n, MasterEntityTypeId)
                UIUtilities.ShowMessage(CustomFieldCaption & " Field is required.", CurrentPage)
            End If
        Next
    End Sub
End Class
