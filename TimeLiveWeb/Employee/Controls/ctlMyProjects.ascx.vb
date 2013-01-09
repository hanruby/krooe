Partial Class AccountAdmin_Controls_ctlMyProjects
    Inherits System.Web.UI.UserControl

    Public Event GridViewRowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs)
    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles G.RowCommand
        If e.CommandName = "Select" Then
            RaiseEvent GridViewRowCommand(sender, e)
        End If
    End Sub
    Public Sub DoRefresh()
        Me.G.DataBind()
    End Sub
    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles G.RowDataBound
        UIUtilities.ClearCellsForNoRecords(e.Row)
        If e.Row.RowType = DataControlRowType.DataRow Then
            If AccountPagePermissionBLL.IsPageHasPermissionOfShowAllDataByPermission(37, 3) = True Then
                CType(e.Row.Cells(7).FindControl("H1"), HyperLink).Visible = True
            ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyProjectsDataByPermission(37, 3) = True And DataBinder.Eval(e.Row.DataItem, "ProjectManagerEmployeeId") = DBUtilities.GetSessionAccountEmployeeId Then
                If DataBinder.Eval(e.Row.DataItem, "ProjectManagerEmployeeId") = DBUtilities.GetSessionAccountEmployeeId Then
                    CType(e.Row.Cells(7).FindControl("H1"), HyperLink).Visible = True
                End If
            ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyTeamsDataByPermission(37, 3) = True And DataBinder.Eval(e.Row.DataItem, "LeaderEmployeeId") = DBUtilities.GetSessionAccountEmployeeId Then
                If DataBinder.Eval(e.Row.DataItem, "LeaderEmployeeId") = DBUtilities.GetSessionAccountEmployeeId Then
                    CType(e.Row.Cells(7).FindControl("H1"), HyperLink).Visible = True
                End If
            ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyDataByPermission(37, 3) = True Then
                CType(e.Row.Cells(7).FindControl("H1"), HyperLink).Visible = True
                'ElseIf AccountPagePermissionBLL.IsPageHasPermissionOf(37, 3) = True Then
                'CType(e.Row.Cells(6).FindControl("HyperLink1"), HyperLink).Visible = True
            End If
            If AccountPagePermissionBLL.IsPageHasPermissionOf(32, 1) = False Then
                Me.G.Columns(5).Visible = False
            End If
            If AccountPagePermissionBLL.IsPageHasPermissionOf(32, 1) = False Then
                Me.G.Columns(6).Visible = False
            End If
        End If
    End Sub
    Protected Sub GridView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs)
        AccountPagePermissionBLL.SetPagePermissionForGridView(27, Me.G, Nothing, Nothing)
        'Dim row As GridViewRow
        'For Each row In Me.GridView1.Rows
        '    If AccountPagePermissionBLL.IsPageHasPermissionOfShowAllDataByPermission(37, 3) = True Then
        '        CType(row.Cells(6).FindControl("HyperLink1"), HyperLink).Visible = True
        '    ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyProjectsDataByPermission(37, 3) = True Then
        '        If Me.GridView1.DataKeys(row.RowIndex).Item(1) = DBUtilities.GetSessionAccountEmployeeId Then
        '            CType(row.Cells(6).FindControl("HyperLink1"), HyperLink).Visible = True
        '        End If
        '    ElseIf AccountPagePermissionBLL.IsPageHasPermissionOfShowMyTeamsDataByPermission(37, 3) = True Then
        '        If Me.GridView1.DataKeys(row.RowIndex).Item(2) = DBUtilities.GetSessionAccountEmployeeId Then
        '            CType(row.Cells(6).FindControl("HyperLink1"), HyperLink).Visible = True
        '        End If
        '    End If
        'Next
        'Me.GridView1.DataBind()
    End Sub
End Class
