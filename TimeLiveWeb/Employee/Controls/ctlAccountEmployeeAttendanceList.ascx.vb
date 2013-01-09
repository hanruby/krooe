
Partial Class Employee_Controls_ctlAccountEmployeeAttendanceList
    Inherits System.Web.UI.UserControl

    Public AfterUpdate As EventArgs

    Public Event Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs)
    Public Event Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs)

    Protected Sub dsAccountEmployeeAttendanceFormObject_Deleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountEmployeeAttendanceFormObject.Deleted
        RaiseEvent Updated(sender, e)
    End Sub
    Protected Sub dsAccountEmployeeAttendanceFormObject_Inserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountEmployeeAttendanceFormObject.Inserted
        DBUtilities.AfterInsert(Me.GV)
        RaiseEvent Inserted(sender, e)
    End Sub

    Protected Sub dsAccountEmployeeAttendanceFormObject_Inserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountEmployeeAttendanceFormObject.Inserting
        DBUtilities.SetRowForInserting(e)
        e.InputParameters("AttendanceDate") = LocaleUtilitiesBLL.ConvertDateToBaseLocaleAsString(Me.dsAccountEmployeeAttendanceObject.SelectParameters("AttendanceDate").DefaultValue)
    End Sub

    Protected Sub dsAccountEmployeeAttendanceFormObject_Updated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceStatusEventArgs) Handles dsAccountEmployeeAttendanceFormObject.Updated
        DBUtilities.AfterUpdate(Me.GV)
        RaiseEvent Updated(sender, e)
    End Sub

    Protected Sub GV_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles GV.DataBound

    End Sub

    Protected Sub GridView1_RowCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewCommandEventArgs) Handles GV.RowCommand
        If e.CommandName = "Select" Then
            Me.FormView1.ChangeMode(FormViewMode.Edit)
            RaiseEvent Updated(Nothing, Nothing)

        ElseIf e.CommandName = "Delete" Then

            RaiseEvent Updated(Nothing, Nothing)

        End If
    End Sub

    Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
        AccountPagePermissionBLL.SetPagePermission(80, Me.GV, Me.FormView1, "Button1", 4, 5)
        If AccountPagePermissionBLL.IsPageHasPermissionOf(80, 1) = False And AccountPagePermissionBLL.IsPageHasPermissionOf(80, 2) = False And AccountPagePermissionBLL.IsPageHasPermissionOf(80, 3) = False And AccountPagePermissionBLL.IsPageHasPermissionOf(80, 4) = False Then
            Me.FormView1.Visible = False
            Me.GV.Visible = False
        End If
        If AccountPagePermissionBLL.IsPageHasPermissionOf(80, 1) = False Then
            Me.GV.Visible = False
        End If
        If DBUtilities.IsNotSupportedCultureFormats = True Then
            DBUtilities.SetMaskEditExtenderCultureToUS(Me.FormView1.FindControl("MaskedEditExtenderAttendanceTime"))
        End If
        CType(Me.FormView1.FindControl("MaskedEditExtenderAttendanceTime"), AjaxControlToolkit.MaskedEditExtender).AcceptAMPM = LocaleUtilitiesBLL.IsAcceptAMPMForTimeentry
        If Not Me.FormView1.DataItem Is Nothing And Me.FormView1.CurrentMode = FormViewMode.Edit Then
            If Not IsDBNull(Me.FormView1.DataItem("AccountAbsenceTypeId")) Then
                'Me.dsAccountAbsenceTypeObject.SelectParameters("AccountAbsenceTypeId").DefaultValue = Me.FormView1.DataItem("AccountAbsenceTypeId")
                CType(Me.FormView1.FindControl("ddlAccountAbsenceTypeId"), DropDownList).SelectedValue = Me.FormView1.DataItem("AccountAbsenceTypeId")
                CType(Me.FormView1.FindControl("ddlAccountAbsenceTypeId"), DropDownList).DataBind()
            Else
                ShowDataForAbsenceTypeDropDown()
            End If
            If Not IsDBNull(Me.FormView1.DataItem("AttendanceTime")) Then
                If DBUtilities.IsNotSupportedCultureFormats = True Then
                    CType(Me.FormView1.FindControl("AttendanceTime"), TextBox).Text = DBUtilities.GetTimeFromDateTimeInUSCulture(Me.FormView1.DataItem("AttendanceTime"))
                Else
                    CType(Me.FormView1.FindControl("AttendanceTime"), TextBox).Text = LocaleUtilitiesBLL.ConvertStringToTimeEntryStartEndTimeFormat(DBUtilities.GetTimeFromDateTime(Me.FormView1.DataItem("AttendanceTime")))
                End If
            End If
        End If
    End Sub

    Protected Sub FormView1_ItemCommand(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewCommandEventArgs) Handles FormView1.ItemCommand
        If e.CommandName = "Cancel" Then
            Me.FormView1.ChangeMode(FormViewMode.Insert)
            Me.FormView1.DataBind()
            RaiseEvent Updated(Nothing, Nothing)
        End If
    End Sub

    Protected Sub dsAccountEmployeeAttendanceFormObject_Updating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceMethodEventArgs) Handles dsAccountEmployeeAttendanceFormObject.Updating
        DBUtilities.SetRowForUpdating(e)

    End Sub

    Protected Sub GridView1_RowDataBound(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewRowEventArgs) Handles GV.RowDataBound
        UIUtilities.ClearCellsForNoRecords(e.Row)
    End Sub

    Protected Sub FormView1_ItemDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewDeletedEventArgs) Handles FormView1.ItemDeleted
        RaiseEvent Updated(Nothing, Nothing)
    End Sub

    Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted

    End Sub

    Protected Sub FormView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting
        e.Cancel = SetValidation(CType(Me.FormView1.FindControl("AttendanceTime"), TextBox).Text, CType(Me.FormView1.FindControl("DropDownList2"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue)
    End Sub

    Protected Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating
        If SetValidation(CType(Me.FormView1.FindControl("AttendanceTime"), TextBox).Text, CType(Me.FormView1.FindControl("ddlAccountAbsenceTypeId"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("DropDownList1"), DropDownList).SelectedValue) = True Then
            e.Cancel = True
        Else
            e.NewValues("AccountAbsenceTypeId") = CType(Me.FormView1.FindControl("ddlAccountAbsenceTypeId"), DropDownList).SelectedValue
            e.NewValues("AttendanceTime") = CType(Me.FormView1.FindControl("AttendanceTime"), TextBox).Text
        End If
    End Sub
    Public Function SetValidation(ByVal AttendanceTime As String, ByVal AccountEmployeeAbsenceId As Integer, ByVal InOut As String) As Boolean
        Dim resultDate As Date
        If AttendanceTime <> "" And InOut = "" And AccountEmployeeAbsenceId = 0 Then
            SetValidation = True
            ShowJavaScriptMessage("In/Out Required")
        ElseIf AttendanceTime = "" And AccountEmployeeAbsenceId = 0 Then
            SetValidation = True
            ShowJavaScriptMessage("Time Required")
        ElseIf Date.TryParse(AttendanceTime, resultDate) = False And AttendanceTime <> "" Then
            SetValidation = True
            ShowJavaScriptMessage("Invalid Time")
        End If
    End Function
    Protected Sub GridView1_RowDeleted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.GridViewDeletedEventArgs) Handles GV.RowDeleted
        Me.GV.DataBind()
        Me.UP.Update()
    End Sub

    Public Sub ShowDataForAbsenceTypeDropDown()
        CType(Me.FormView1.FindControl("ddlAccountAbsenceTypeId"), DropDownList).Items.Clear()
        Dim item As New System.Web.UI.WebControls.ListItem
        item.Text = "Present"
        item.Value = "0"
        item.Selected = True
        CType(Me.FormView1.FindControl("ddlAccountAbsenceTypeId"), DropDownList).Items.Add(item)
        CType(Me.FormView1.FindControl("ddlAccountAbsenceTypeId"), DropDownList).DataBind()
    End Sub
    Public Sub ShowJavaScriptMessage(ByVal strMessage As String)
        Dim strScript As String = "alert('" & strMessage & "'); "
        If (Not Me.Page.ClientScript.IsStartupScriptRegistered("clientScript")) Then
            ScriptManager.RegisterClientScriptBlock(Me.Page, Me.GetType, "clientScript", strScript, True)
        End If
    End Sub
    Public Sub SetGridIconVisible()
        If Me.GV.Rows.Count > 0 Then
            For Each rows As GridViewRow In GV.Rows
                If Me.GV.DataKeys(rows.RowIndex)("AccountEmployeeAttendanceId") = 0 Then
                    rows.Cells(4).FindControl("LinkButton2").Visible = False
                    rows.Cells(5).FindControl("LinkButton1").Visible = False
                End If
            Next
        End If
    End Sub

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Me.IsPostBack Then
            SetGridIconVisible()
        End If
    End Sub
End Class
