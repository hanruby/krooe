
Partial Class AccountAdmin_Controls_ctlAccountProjectList
    Inherits System.Web.UI.UserControl

    Public Event btnAddProjectClick(ByVal sender As Object, ByVal e As System.EventArgs)
    Public Event GridViewRowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
    Public Event GridViewRowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs)

    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.DataBound
     
        'TODO: CheckAll function
        'Each time the data is bound to the grid we need to build up the CheckBoxIDs array
        'Get the header CheckBox
        Dim row As GridViewRow
        For Each row In Me.GridView1.Rows
            If Me.GridView1.DataKeys(row.RowIndex).Item(0) <> 0 Then
                Me.btnDeleteSelectedItem.Visible = True
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
        If DBUtilities.ShowClientDepartmentInProject = True Then
            Me.GridView1.Columns(4).Visible = True
        Else
            Me.GridView1.Columns(4).Visible = False
        End If
    End Sub


    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GridView1.RowCommand
        If e.CommandName = "Select" Then
            RaiseEvent GridViewRowCommand(sender, e)
        End If
    End Sub

    Public Sub DoRefresh()
        Me.GridView1.DataBind()
    End Sub


    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GridView1.RowDataBound
        UIUtilities.ClearCellsForNoRecords(e.Row)
        ''For Gantt
        If Me.Request.QueryString("IsTemplate") = "True" Then
            Me.GridView1.Columns(8).Visible = False
        End If
        ''For Gantt
        If Not Me.Request.QueryString("IsTemplate") = "True" Then
            If AccountPagePermissionBLL.IsPageHasPermissionOf(32, 1) = False Then
                Me.GridView1.Columns(8).Visible = False
            Else
                Me.GridView1.Columns(8).Visible = True
            End If
        End If
        ''Task link
        If AccountPagePermissionBLL.IsPageHasPermissionOf(32, 1) = False Then
            Me.GridView1.Columns(9).Visible = False
        Else
            Me.GridView1.Columns(9).Visible = True
        End If

        ''Project team link
        If AccountPagePermissionBLL.IsPageHasPermissionOf(88, 1) = False Then
            Me.GridView1.Columns(10).Visible = False
        Else
            Me.GridView1.Columns(10).Visible = True
        End If
        ''MIlestone link
        If AccountPagePermissionBLL.IsPageHasPermissionOf(30, 1) = False Then
            Me.GridView1.Columns(11).Visible = False
        Else
            Me.GridView1.Columns(11).Visible = True
        End If


    End Sub

    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs)
        RaiseEvent GridViewRowDeleted(sender, e)
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.Request.QueryString("IsTemplate") = "True" Then
            AccountPagePermissionBLL.SetPagePermissionForGridView(103, Me.GridView1, 6, 7)
            Me.GridView1.Caption = Resources.TimeLive.Web.Project_Template_List
        Else
            AccountPagePermissionBLL.SetPagePermissionForGridView(31, Me.GridView1, 6, 7)
        End If
    End Sub

    Protected Sub btnAddProject_Click1(ByVal sender As Object, ByVal e As System.EventArgs)
        Me.GridView1.Visible = False
        Me.btnAddProject.Visible = False
        Me.btnDeleteSelectedItem.Visible = False
        RaiseEvent btnAddProjectClick(sender, e)
    End Sub

    Protected Sub btnDeleteSelectedItem_Click(sender As Object, e As System.EventArgs) Handles btnDeleteSelectedItem.Click
        Dim row As GridViewRow
        Dim Original_AccountProjectId As Integer
        For Each row In Me.GridView1.Rows
            If Me.GridView1.DataKeys(row.RowIndex)(0) <> 0 Then
                If CType(row.FindControl("chkSelect"), CheckBox).Checked = True Then
                    Original_AccountProjectId = Me.GridView1.DataKeys(row.RowIndex)(0)
                    Dim BLL As New AccountProjectBLL
                    Original_AccountProjectId = New AccountProjectBLL().DeleteAccountProject(Original_AccountProjectId)
                End If
            End If
        Next
        Me.GridView1.DataBind()
    End Sub
End Class
