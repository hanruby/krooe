Imports System.DirectoryServices
Namespace TimeLive
    Partial Class ctlAccountForm
        Inherits System.Web.UI.UserControl
#Region " Web Form Designer Generated Code "

        'This call is required by the Web Form Designer.
        <System.Diagnostics.DebuggerStepThrough()> Private Sub InitializeComponent()

        End Sub

        Private Sub Page_Init(ByVal sender As System.Object, ByVal e As System.EventArgs) Handles MyBase.Init
            'CODEGEN: This method call is required by the Web Form Designer
            'Do not modify it using the code editor.
            InitializeComponent()
        End Sub

#End Region
        Dim lblExceptionText As Label
        Dim cvTimesheetPrintFooterargs As Boolean
        Dim cvExpenseSheetPrintFooterargs As Boolean
        Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
            Me.Page.Title = ResourceHelper.GetFromResource(Me.Page.Title)
            If Not Me.IsPostBack Then
                If Me.FormView1.CurrentMode = FormViewMode.Insert Then
                    If System.Configuration.ConfigurationManager.AppSettings("SHOW_LOGIN_WITH_ACCOUNT_PAGE") = "Yes" Then
                        Response.Redirect("~/Default.aspx", False)
                    End If
                    ShowUsername()
                    CType(Me.FormView1.FindControl("ddlTimeZoneId"), DropDownList).SelectedValue = DBUtilities.GetTimeZoneId
                    CType(Me.FormView1.FindControl("ddlCountryId"), DropDownList).SelectedValue = DBUtilities.GetAccountCountryId
                Else
                    ShowUsername()
                    If Me.FormView1.CurrentMode = FormViewMode.Edit Then
                        lblExceptionText = Me.FormView1.FindControl("ExceptionDetails")
                    End If
                End If
            Else
                If Me.FormView1.CurrentMode = FormViewMode.Edit Then
                    CType(Me.FormView1.FindControl("lblLicenseError"), Label).Visible = False
                    CType(Me.FormView1.FindControl("lblMachineKeyError"), Label).Visible = False
                End If
            End If
        End Sub
        Protected Sub FormView1_DataBound(ByVal sender As Object, ByVal e As System.EventArgs) Handles FormView1.DataBound
            If Me.FormView1.CurrentMode = FormViewMode.Edit Then
                Me.FormView1.Visible = AccountPagePermissionBLL.IsPageHasPermissionOf(91, 3)
                If System.Configuration.ConfigurationManager.AppSettings("ApplicationMode") = "Hosted" Then

                    CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).DataSource = LicensingBLL.GetHostedPackagesOfCurrentUsers
                    CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).DataTextField = "PackageName"
                    CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).DataValueField = "PackageCode"
                    CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue = LicensingBLL.GetCurrentHostedPackage
                    CType(Me.FormView1.FindControl("btnRenew"), Button).Visible = LicensingBLL.IsHostedPaidCustomer()
                    CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).DataBind()

                    If New AccountBLL().GetAccountByAccountId(DBUtilities.GetSessionAccountId).AccountExpiryActivation <> "" Then
                        Dim ExpiryDate As String = GetExpiryDateAsString(New AccountBLL().GetAccountByAccountId(DBUtilities.GetSessionAccountId).AccountExpiryActivation)
                        CType(Me.FormView1.FindControl("lblExpiryDate"), Label).Text = LicensingBLL.GetAccountExpiryDateFromDateString(ExpiryDate)
                    Else
                        CType(Me.FormView1.FindControl("lblExpiryDate"), Label).Text = Now.Date
                    End If
                ElseIf System.Configuration.ConfigurationManager.AppSettings("ApplicationMode") = "Installed" Then
                    CType(Me.FormView1.FindControl("btnRenew"), Button).Visible = False
                    If New AccountBLL().GetAccountByAccountId(DBUtilities.GetSessionAccountId).AccountExpiryActivation <> "" Then
                        Dim ExpiryDate As String = GetExpiryDateAsString(New AccountBLL().GetAccountByAccountId(DBUtilities.GetSessionAccountId).AccountExpiryActivation)
                        CType(Me.FormView1.FindControl("lblExpiryDateLicense"), Label).Text = LicensingBLL.GetAccountExpiryDateFromDateString(ExpiryDate)
                    Else
                        CType(Me.FormView1.FindControl("lblExpiryDateLicense"), Label).Text = Now.Date
                    End If
                End If
                CType(Me.FormView1.FindControl("MaskedEditExtenderTPScheduledEmailSendTime"), AjaxControlToolkit.MaskedEditExtender).AcceptAMPM = LocaleUtilitiesBLL.IsAcceptAMPMForTimeentry
                If DBUtilities.IsNotSupportedCultureFormats = True Then
                    DBUtilities.SetMaskEditExtenderCultureToUS(Me.FormView1.FindControl("MaskedEditExtenderTPScheduledEmailSendTime"))
                    CType(Me.FormView1.FindControl("TPScheduledEmailSendTime"), TextBox).Text = DBUtilities.GetTimeFromDateTimeInUSCulture(LocaleUtilitiesBLL.ShowScheduledEmailSendTime)
                End If


                CType(Me.FormView1.FindControl("CultureInfoName"), DropDownList).SelectedValue = LocaleUtilitiesBLL.GetCurrentCulture
                CType(Me.FormView1.FindControl("CurrencySymbol"), DropDownList).SelectedValue = LocaleUtilitiesBLL.GetCurrencySymbol
                CType(Me.FormView1.FindControl("ddlTimeEntryFormat"), DropDownList).SelectedValue = LocaleUtilitiesBLL.GetCurrentTimeEntryFormat
                CType(Me.FormView1.FindControl("SessionTimeOutTextBox"), TextBox).Text = LocaleUtilitiesBLL.GetCurrentSessionTimeout
                CType(Me.FormView1.FindControl("chkShowCompletedTasksInTimeSheet"), CheckBox).Checked = LocaleUtilitiesBLL.IsShowCompletedTasksInTimeSheet
                CType(Me.FormView1.FindControl("chkShowCompletedProjectsInTimeSheet"), CheckBox).Checked = LocaleUtilitiesBLL.IsShowCompletedProjectsInTimeSheet
                CType(Me.FormView1.FindControl("chkShowWorkTypeInTimeSheet"), CheckBox).Checked = DBUtilities.IsShowWorkTypeInTimeSheet
                CType(Me.FormView1.FindControl("chkShowCostCenterInTimeSheet"), CheckBox).Checked = DBUtilities.IsShowCostCenterInTimeSheet
                CType(Me.FormView1.FindControl("chkIsShowCompanyOwnLogo"), CheckBox).Checked = LocaleUtilitiesBLL.IsShowCompanyOwnLogo
                If DBUtilities.IsNotSupportedCultureFormats <> True Then
                    If LocaleUtilitiesBLL.IsAcceptAMPMForTimeentry = False Then
                        CType(Me.FormView1.FindControl("TPScheduledEmailSendTime"), TextBox).Text = DBUtilities.GetTimeFromDateTime(LocaleUtilitiesBLL.ShowScheduledEmailSendTime, LocaleUtilitiesBLL.GetCurrentTimeEntryFormatForTotalTime)
                    Else
                        CType(Me.FormView1.FindControl("TPScheduledEmailSendTime"), TextBox).Text = DBUtilities.GetTimeFromDateTime(LocaleUtilitiesBLL.ShowScheduledEmailSendTime)
                    End If
                End If
                CType(Me.FormView1.FindControl("FromEmailAddressDisplayNameTextBox"), TextBox).Text = DBUtilities.GetFromEmailAddressDisplayName
                CType(Me.FormView1.FindControl("txtTimesheetPrintFooter"), TextBox).Text = DBUtilities.GetTimesheetPrintFooter
                CType(Me.FormView1.FindControl("txtExpenseSheetPrintFooter"), TextBox).Text = DBUtilities.GetExpenseSheetPrintFooter
                CType(Me.FormView1.FindControl("FromEmailAddressTextBox"), TextBox).Text = DBUtilities.GetFromEmailAddress
                CType(Me.FormView1.FindControl("chkLockSubmittedRecord"), CheckBox).Checked = LocaleUtilitiesBLL.IsShowLockSubmittedRecords
                CType(Me.FormView1.FindControl("chkLockApprovedRecord"), CheckBox).Checked = LocaleUtilitiesBLL.IsShowLockApprovedRecords
                CType(Me.FormView1.FindControl("txtNumberOfBlankRowsInTimeEntry"), TextBox).Text = DBUtilities.GetNumberOfBlankRowsInTimeEntry
                'CType(Me.FormView1.FindControl("ddlWeekStartDay"), DropDownList).SelectedValue = DBUtilities.GetWeekStartDayInWeekTimeEntry
                'CType(Me.FormView1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue = LocaleUtilitiesBLL.GetSavedCurrentUICulture
                CType(Me.FormView1.FindControl("ddlDefaultTimeEntryMode"), DropDownList).SelectedValue = DBUtilities.GetDefaultTimeEntryMode
                CType(Me.FormView1.FindControl("ddlTimesheetSort"), DropDownList).SelectedValue = DBUtilities.GetSortTimesheet
                CType(Me.FormView1.FindControl("ddlCostCenterInTimesheetBy"), DropDownList).SelectedValue = DBUtilities.GetCostCenterInTimesheetBy
                CType(Me.FormView1.FindControl("ddlPageSize"), DropDownList).SelectedValue = DBUtilities.GetPageSize
                CType(Me.FormView1.FindControl("chkShowClientInTimeSheet"), CheckBox).Checked = DBUtilities.GetShowClientInTimesheet
                CType(Me.FormView1.FindControl("chkShowDescriptionInWeekView"), CheckBox).Checked = DBUtilities.GetShowDescriptionInWeekView
                CType(Me.FormView1.FindControl("InvoiceNoPrefixTextBox"), TextBox).Text = DBUtilities.GetInvoiceNoPrefix
                'CType(Me.FormView1.FindControl("ProjectCodePrefixTextBox"), TextBox).Text = DBUtilities.GetProjectCodePrefix
                CType(Me.FormView1.FindControl("MachineNameTextBox"), TextBox).Text = LicensingBLL.GetMachineID
                CType(Me.FormView1.FindControl("chkShowProjectForTimeOff"), CheckBox).Checked = LocaleUtilitiesBLL.IsShowProjectForTimeOff
                CType(Me.FormView1.FindControl("chkShowTimeOffInTimesheet"), CheckBox).Checked = LocaleUtilitiesBLL.IsShowTimeOffInTimesheet
                CType(Me.FormView1.FindControl("chkShowElectronicSign"), CheckBox).Checked = LocaleUtilitiesBLL.IsShowElectronicSign
                CType(Me.FormView1.FindControl("chkShowAllInTimesheetReadOnly"), CheckBox).Checked = LocaleUtilitiesBLL.ShowAllInTimesheetReadOnly
                CType(Me.FormView1.FindControl("chkShowCompletedProjectInProjectGrid"), CheckBox).Checked = LocaleUtilitiesBLL.ShowCompletedProjectInProjectGrid
                CType(Me.FormView1.FindControl("chkShowPercentageInTimeSheet"), CheckBox).Checked = LocaleUtilitiesBLL.ShowPercentageInTimesheet
                CType(Me.FormView1.FindControl("chkShowCopyTimesheetButton"), CheckBox).Checked = DBUtilities.ShowCopyTimesheetButton
                CType(Me.FormView1.FindControl("chkShowCopyActivitiesButtonInTimesheet"), CheckBox).Checked = DBUtilities.ShowCopyActivitiesButtonInTimesheet
                CType(Me.FormView1.FindControl("chkShowTaskInExpenseSheet"), CheckBox).Checked = LocaleUtilitiesBLL.ShowTaskInExpenseSheet
                CType(Me.FormView1.FindControl("chkShowBillingRateInInvoiceReport"), CheckBox).Checked = LocaleUtilitiesBLL.ShowBillingRateInInvoiceReport
                CType(Me.FormView1.FindControl("chkShowProjectNameInInvoiceReport"), CheckBox).Checked = LocaleUtilitiesBLL.ShowProjectNameInInvoiceReport
                CType(Me.FormView1.FindControl("chkShowEntryDateInInvoiceReport"), CheckBox).Checked = DBUtilities.ShowEntryDateInInvoiceReport
                CType(Me.FormView1.FindControl("chkShowEmployeeNameInInvoiceReport"), CheckBox).Checked = LocaleUtilitiesBLL.ShowEmployeeNameInInvoiceReport
                CType(Me.FormView1.FindControl("chkEnablePasswordComplexity"), CheckBox).Checked = DBUtilities.EnablePasswordComplexity
                CType(Me.FormView1.FindControl("chkShowClientDepartmentInProject"), CheckBox).Checked = DBUtilities.ShowClientDepartmentInProject
                CType(Me.FormView1.FindControl("chkAutoGenerateProjectCode"), CheckBox).Checked = LocaleUtilitiesBLL.AutoGenerateProjectCode
                CType(Me.FormView1.FindControl("txtInvoiceFooter"), TextBox).Text = DBUtilities.GetInvoiceFooter
                CType(Me.FormView1.FindControl("txtTimesheetOverduePeriods"), TextBox).Text = DBUtilities.GetSessionTimesheetOverduePeriods
                CType(Me.FormView1.FindControl("ddlTimeEntryHoursFormatId"), DropDownList).SelectedValue = DBUtilities.GetSessionTimeEntryHoursFormat.ToString
                CType(Me.FormView1.FindControl("ddlInvoiceBillingTypeId"), DropDownList).SelectedValue = DBUtilities.GetSessionInvoiceBillingType.ToString
                CType(Me.FormView1.FindControl("chkShowProjectNameInTask"), CheckBox).Checked = LocaleUtilitiesBLL.ShowProjectNameInTask
                CType(Me.FormView1.FindControl("chkShowClientNameInTask"), CheckBox).Checked = LocaleUtilitiesBLL.ShowClientNameInTask
                CType(Me.FormView1.FindControl("chkCalculateTaskPercentageAutomatically"), CheckBox).Checked = LocaleUtilitiesBLL.EnableCalculateTaskPercentageAutomatically

                If Not IsDBNull(Me.FormView1.DataItem("ActivationMachineKey")) Then
                    CType(Me.FormView1.FindControl("MachineKeyTextBox"), TextBox).Text = Me.FormView1.DataItem("ActivationMachineKey")
                End If

                If Not IsDBNull(Me.FormView1.DataItem("ActivationType")) Then
                    If Me.FormView1.DataItem("ActivationType") = "Online Activation" Then
                        CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton).Checked = True
                    ElseIf Me.FormView1.DataItem("ActivationType") = "Manual Activation" Then
                        CType(Me.FormView1.FindControl("rdManualActivation"), RadioButton).Checked = True
                    End If
                Else
                    CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton).Checked = True
                End If
                If CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton).Checked = True Then
                    CType(Me.FormView1.FindControl("MachineKeyTextBox"), TextBox).ReadOnly = True
                End If

                If Not IsDBNull(Me.FormView1.DataItem("ActivationLicenseKey")) Then
                    If CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton).Checked = True Then
                        CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox).Text = Me.FormView1.DataItem("ActivationLicenseKey")
                    ElseIf CType(Me.FormView1.FindControl("rdManualActivation"), RadioButton).Checked = True Then
                        CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox).Text = ""
                        CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox).ReadOnly = True
                    End If
                End If
                If CType(Me.FormView1.FindControl("rdManualActivation"), RadioButton).Checked = True And LicensingBLL.IsValidLicenseActivation() = False Then
                    CType(Me.FormView1.FindControl("lblActivationFailed"), Label).Visible = True
                End If
                If CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton).Checked = True Then
                    CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox).ReadOnly = False
                ElseIf CType(Me.FormView1.FindControl("rdManualActivation"), RadioButton).Checked = True Then
                    CType(Me.FormView1.FindControl("MachineKeyTextBox"), TextBox).ReadOnly = False
                Else
                    CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox).ReadOnly = True
                    CType(Me.FormView1.FindControl("MachineKeyTextBox"), TextBox).ReadOnly = True
                End If
                CType(Me.FormView1.FindControl("lblNumberofUsers"), Label).Text = New AccountEmployeeBLL().GetEmployeeByAccountIdForLicense(DBUtilities.GetSessionAccountId).Rows.Count & " Out Of " & LicensingBLL.GetNumberOfUsersAllowed(DBUtilities.GetSessionAccountId) & " " & ResourceHelper.GetFromResource("Users")
                CType(Me.FormView1.FindControl("lblNumberOfUsersForHosted"), Label).Text = New AccountEmployeeBLL().GetEmployeeByAccountIdForLicense(DBUtilities.GetSessionAccountId).Rows.Count & " Out Of " & LicensingBLL.GetNumberOfUsersAllowed(DBUtilities.GetSessionAccountId) & " " & ResourceHelper.GetFromResource("Users")
                CType(Me.FormView1.FindControl("ddlTaskInformation"), DropDownList).SelectedValue = DBUtilities.GetShowAdditionalTaskInformationType
                CType(Me.FormView1.FindControl("txtPasswordExpiryPeriod"), TextBox).Text = DBUtilities.GetPasswordExpiryPeriod
                Dim LDAP As New LDAPUtilitiesBLL
                If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
                    CType(Me.FormView1.FindControl("RequiredFieldValidator3"), RequiredFieldValidator).Enabled = False
                    CType(Me.FormView1.FindControl("RangeValidator2"), RangeValidator).Enabled = False
                End If
            End If
        End Sub
        Protected Sub FormView1_ItemInserted(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertedEventArgs) Handles FormView1.ItemInserted
            If Not e.Exception Is Nothing Then
                Dim lblExceptionText As Label = Me.FormView1.FindControl("lblExceptionText")
                lblExceptionText.Visible = True
                lblExceptionText.Text = e.Exception.InnerException.Message
                e.ExceptionHandled = True
                e.KeepInInsertMode = True

            ElseIf Not Request.QueryString("ApplicationMode") Is Nothing Then
                Dim bll As New AccountBLL
                bll.PostInstalledAccountAdd()
                If System.Configuration.ConfigurationManager.AppSettings("AUTO_LOGIN_AFTER_ACCOUNT_ADD") <> "Yes" Then
                    If System.Configuration.ConfigurationManager.AppSettings("ApplicationMode") = "Installed" Then
                        Response.Redirect("RegistrationComplete.aspx?EMailAddress=" & CType(Me.FormView1.FindControl("EmployeeEMailAddress"), TextBox).Text, False)
                    Else
                        UIUtilities.RedirectToLoginPage()
                    End If
                Else
                    LoginIn()
                End If
            ElseIf Request.QueryString("Mode") Is Nothing Then
                If System.Configuration.ConfigurationManager.AppSettings("AUTO_LOGIN_AFTER_ACCOUNT_ADD") <> "Yes" Then
                    Response.Redirect("RegistrationComplete.aspx?EMailAddress=" & CType(Me.FormView1.FindControl("EmployeeEMailAddress"), TextBox).Text, False)
                Else
                    LoginIn()
                End If
            ElseIf Not Request.QueryString("Mode") Is Nothing Then
                Dim AccountId As Integer = CType(New TimeLiveDataSetTableAdapters.IdentityQueryTableAdapter().GetAccountLastId.Rows(0), TimeLiveDataSet.IdentityQueryRow).LastId

                Dim LTCustomerBLL As New LTCustomerBLL
                Dim drLTCustomer As TimeLiveDataSet.LTCustomerRow = LTCustomerBLL.GetLTCustomerByAccountId(AccountId)
                Dim CustomerId As Integer = drLTCustomer.CustomerId

                EMailUtilities.DequeueEmail()

                Dim PaymentURL As String = LicensingBLL.GetPaymentURL(Me.Request, CustomerId)
                Response.Redirect(PaymentURL, False)

                End If

        End Sub
        Protected Sub FormView1_ItemInserting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewInsertEventArgs) Handles FormView1.ItemInserting
            With dsAccountObject
                .InsertParameters("UserInterfaceLanguage").DefaultValue = CType(Me.FormView1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue
            End With
        End Sub
        Protected Sub FormView1_ItemUpdated(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdatedEventArgs) Handles FormView1.ItemUpdated
            System.Web.HttpContext.Current.Session.Remove("RootNode")
            UIUtilities.RedirectToAdminHomePage()
        End Sub
        Protected Sub dsTimeZone_Selecting(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.ObjectDataSourceSelectingEventArgs)

        End Sub
        Protected Sub cmdActivateSerial_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim ActivationType As String = ""
            If CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton).Checked = True Then
                If Me.CheckTextBoxValue(CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton), CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox)) = True Then
                    CType(Me.FormView1.FindControl("lblLicenseError"), Label).Visible = True
                    Exit Sub
                End If
                ActivationType = "Online Activation"
            ElseIf CType(Me.FormView1.FindControl("rdManualActivation"), RadioButton).Checked = True Then
                If Me.CheckTextBoxValue(CType(Me.FormView1.FindControl("rdManualActivation"), RadioButton), CType(Me.FormView1.FindControl("MachineKeyTextBox"), TextBox)) = True Then
                    CType(Me.FormView1.FindControl("lblMachineKeyError"), Label).Visible = True
                    Exit Sub
                End If
                ActivationType = "Manual Activation"
            End If

            Dim LicensingBLL As New LicensingBLL
            If LicensingBLL.ActivateLincese(CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox).Text, ActivationType, CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton).Checked, CType(Me.FormView1.FindControl("MachineKeyTextBox"), TextBox).Text, CType(Me.FormView1.FindControl("MachineNameTextBox"), TextBox).Text) = True Then
                Me.ShowLicenseActivationMessage(ResourceHelper.GetFromResource("License Activated Successfully."))
            Else
                Me.ShowLicenseActivationMessage("Unable To Activate License")
            End If

        End Sub
        Public Sub FormView1_ItemUpdating(ByVal sender As Object, ByVal e As System.Web.UI.WebControls.FormViewUpdateEventArgs) Handles FormView1.ItemUpdating

            e.NewValues("CultureInfoName") = CType(Me.FormView1.FindControl("CultureInfoName"), DropDownList).SelectedValue
            e.NewValues("CurrencySymbol") = CType(Me.FormView1.FindControl("CurrencySymbol"), DropDownList).SelectedValue
            e.NewValues("TimeEntryFormat") = CType(Me.FormView1.FindControl("ddlTimeEntryFormat"), DropDownList).SelectedValue
            e.NewValues("ShowCompletedTasksInTimeSheet") = CType(Me.FormView1.FindControl("chkShowCompletedTasksInTimeSheet"), CheckBox).Checked
            e.NewValues("ShowWorkTypeInTimeSheet") = CType(Me.FormView1.FindControl("chkShowWorkTypeInTimeSheet"), CheckBox).Checked
            e.NewValues("ShowCostCenterInTimeSheet") = CType(Me.FormView1.FindControl("chkShowCostCenterInTimeSheet"), CheckBox).Checked
            e.NewValues("AccountSessionTimeout") = CType(Me.FormView1.FindControl("SessionTimeOutTextBox"), TextBox).Text
            e.NewValues("ScheduledEmailSendTime") = CType(Me.FormView1.FindControl("TPScheduledEmailSendTime"), TextBox).Text
            e.NewValues("LockSubmittedRecords") = CType(Me.FormView1.FindControl("chkLockSubmittedRecord"), CheckBox).Checked
            e.NewValues("LockApprovedRecords") = CType(Me.FormView1.FindControl("chkLockApprovedRecord"), CheckBox).Checked
            e.NewValues("IsShowElectronicSign") = CType(Me.FormView1.FindControl("chkShowElectronicSign"), CheckBox).Checked
            e.NewValues("NumberOfBlankRowsInTimeEntry") = CType(Me.FormView1.FindControl("txtNumberOfBlankRowsInTimeEntry"), TextBox).Text
            ' e.NewValues("WeekStartDay") = CType(Me.FormView1.FindControl("ddlWeekStartDay"), DropDownList).SelectedValue
            'e.NewValues("UserInterfaceLanguage") = CType(Me.FormView1.FindControl("ddlUserInterfaceLanguage"), DropDownList).SelectedValue
            e.NewValues("DefaultTimeEntryMode") = CType(Me.FormView1.FindControl("ddlDefaultTimeEntryMode"), DropDownList).SelectedValue
            e.NewValues("PageSize") = CType(Me.FormView1.FindControl("ddlPageSize"), DropDownList).SelectedValue
            e.NewValues("ShowClientInTimesheet") = CType(Me.FormView1.FindControl("chkShowClientInTimesheet"), CheckBox).Checked
            e.NewValues("ShowDescriptionInWeekView") = CType(Me.FormView1.FindControl("chkShowDescriptionInWeekView"), CheckBox).Checked
            'e.NewValues("InvoiceNoPrefix") = CType(Me.FormView1.FindControl("InvoiceNoPrefixTextBox"), TextBox).Text
            e.NewValues("ShowAdditionalTaskInformationType") = CType(Me.FormView1.FindControl("ddlTaskInformation"), DropDownList).SelectedValue
            e.NewValues("ShowCompletedProjectsInTimeSheet") = CType(Me.FormView1.FindControl("chkShowCompletedProjectsInTimeSheet"), CheckBox).Checked
            'e.NewValues("ShowProjectForTimeOff") = CType(Me.FormView1.FindControl("chkShowProjectForTimeOff"), CheckBox).Checked
            'e.NewValues("ShowTimeOffInTimesheet") = CType(Me.FormView1.FindControl("chkShowTimeOffInTimesheet"), CheckBox).Checked
            e.NewValues("PasswordExpiryPeriod") = CType(Me.FormView1.FindControl("txtPasswordExpiryPeriod"), TextBox).Text
            e.NewValues("ShowAllInTimesheetReadOnly") = CType(Me.FormView1.FindControl("chkShowAllInTimesheetReadOnly"), CheckBox).Checked
            e.NewValues("ShowTaskInExpenseSheet") = CType(Me.FormView1.FindControl("chkShowTaskInExpenseSheet"), CheckBox).Checked
            'e.NewValues("InvoiceNoPrefix") = CType(Me.FormView1.FindControl("InvoiceNoPrefixTextBox"), TextBox).Text
            'e.NewValues("ShowBillingRateInInvoiceReport") = CType(Me.FormView1.FindControl("chkShowBillingRateInInvoiceReport"), CheckBox).Checked
            'e.NewValues("InvoiceBillingTypeId") = CType(Me.FormView1.FindControl("ddlInvoiceBillingTypeId"), DropDownList).SelectedValue
            'e.NewValues("InvoiceFooter") = CType(Me.FormView1.FindControl("txtInvoiceFooter"), TextBox).Text
            e.NewValues("TimesheetOverduePeriods") = CType(Me.FormView1.FindControl("txtTimesheetOverduePeriods"), TextBox).Text
            e.NewValues("EnablePasswordComplexity") = CType(Me.FormView1.FindControl("chkEnablePasswordComplexity"), CheckBox).Checked
            e.NewValues("ShowPercentageInTimeSheet") = CType(Me.FormView1.FindControl("chkShowPercentageInTimeSheet"), CheckBox).Checked
            If Not CType(Me.FormView1.FindControl("ddlTimeEntryHoursFormatId"), DropDownList).SelectedValue = "None" Then
                e.NewValues("TimeEntryHoursFormatId") = CType(Me.FormView1.FindControl("ddlTimeEntryHoursFormatId"), DropDownList).SelectedValue
            ElseIf CType(Me.FormView1.FindControl("ddlTimeEntryHoursFormatId"), DropDownList).SelectedValue = "None" Then
                e.NewValues("ShowClockStartEnd") = False
            End If
            Dim BLL As New AccountBLL
            BLL.UpdateEmailPreferences(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("FromEmailAddressDisplayNameTextBox"), TextBox).Text, CType(Me.FormView1.FindControl("FromEmailAddressTextBox"), TextBox).Text)
            'BLL.UpdateLockSubmittedAndApprovedRecords(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("chkLockSubmittedRecord"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkLockApprovedRecord"), CheckBox).Checked)
        End Sub
        Protected Sub btnUpload_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim BLL As New AccountBLL
            BLL.FileUpload(Me.FormView1.FindControl("txtCompanyLogo"))
            BLL.UpdateIsCompanyOwnLogo(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("chkIsShowCompanyOwnLogo"), CheckBox).Checked)
            UIUtilities.RedirectToAdminHomePage()
        End Sub
        Public Function Validate() As Boolean
            Dim LDAP As New LDAPUtilitiesBLL
            Dim username As String = CType(Me.FormView1.FindControl("UsernameTextBox"), TextBox).Text
            Dim password As String = CType(Me.FormView1.FindControl("PasswordTextBox"), TextBox).Text

            If LDAP.IsValidUserNameAndPassword(username, password) = True Then
                Return True
            Else
                Return False
            End If

        End Function
        Public Sub ShowUsername()
            Dim LDAP As New LDAPUtilitiesBLL
            If Not LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
                If Me.FormView1.CurrentMode = FormViewMode.Insert Then
                    CType(Me.FormView1.FindControl("UsernameTextBox"), TextBox).ReadOnly = True
                End If
            End If
        End Sub
        Protected Sub UsernameTextBox_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.GetUserData()
        End Sub
        Public Function GetUserData() As Boolean
            Dim LDAP As New LDAPUtilitiesBLL

            If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
                Dim Username As String = CType(Me.FormView1.FindControl("UsernameTextBox"), TextBox).Text
                Dim Admin As DirectoryEntry = LDAPUtilitiesBLL.GetUserByName(Username)
                If Not Admin Is Nothing Then
                    If Admin.Properties("givenname").Count > 0 AndAlso Not Admin.Properties("givenname").Item(0) Is Nothing Then
                        CType(Me.FormView1.FindControl("FirstNameTextBox"), TextBox).Text = Admin.Properties("givenname").Item(0)
                    End If
                    If Admin.Properties("sn").Count > 0 AndAlso Not Admin.Properties("sn").Item(0) Is Nothing Then
                        CType(Me.FormView1.FindControl("LastNameTextBox"), TextBox).Text = Admin.Properties("sn").Item(0)
                    End If
                    If Not Admin.Properties("mail").Count = 0 AndAlso Not Admin.Properties("mail").Item(0) Is Nothing Then
                        CType(Me.FormView1.FindControl("EmployeeEMailAddress"), TextBox).Text = Admin.Properties("mail").Item(0)
                    End If
                    Return True
                Else
                    Return False
                End If
            Else
                Return False
            End If

        End Function
        Public Function GetUserGroup() As Boolean
            Dim LDAP As New LDAPUtilitiesBLL

            If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
                Dim Username As String = CType(Me.FormView1.FindControl("UsernameTextBox"), TextBox).Text
                Dim Admin As DirectoryEntry = LDAPUtilitiesBLL.GetUserByName(Username)
                If Not Admin Is Nothing Then
                    If LDAPUtilitiesBLL.IsUserTimeLiveAdministrator(Username) = True Then
                        Return True
                    Else
                        Return False
                    End If
                Else
                    Return False
                End If
            End If
        End Function
        Protected Sub CustomValidator2_ServerValidate1(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
            Dim LDAP As New LDAPUtilitiesBLL
            If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
                args.IsValid = Me.GetUserGroup = True
            End If
        End Sub
        Protected Sub CustomValidatorInsert_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
            Dim LDAP As New LDAPUtilitiesBLL

            If LDAP.IsAspNetActiveDirectoryMembershipProvider = True Then
                args.IsValid = Me.Validate = True
            End If
        End Sub
        Protected Sub EmployeeEMailAddress_TextChanged(ByVal sender As Object, ByVal e As System.EventArgs)
        End Sub
        Protected Sub btnChangePlanTo_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If Me.FormView1.CurrentMode = FormViewMode.Edit Then
                LicensingBLL.ChangeHostedPlan(CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue)
            End If
        End Sub
        Public Sub ForRenewal(ByVal drAccount As TimeLiveDataSet.AccountRow)
            If CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue = 1 Then
                Dim bll As New AccountBLL
                bll.UpdateLicenseKey("TLHL", DBUtilities.GetSessionAccountId)
            ElseIf CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue = 5 Then
                Response.Redirect("https://secure.avangate.com/renewal/?LICENSE=" & drAccount.LicenseId, False)
            ElseIf CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue = 10 Then
                Response.Redirect("https://secure.avangate.com/renewal/?LICENSE=" & drAccount.LicenseId, False)
            ElseIf CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue = 15 Then
                Response.Redirect("https://secure.avangate.com/renewal/?LICENSE=" & drAccount.LicenseId, False)
            End If
        End Sub
        Public Function GetPackage() As Integer
            Dim BLL As New AccountBLL
            Dim dr As TimeLiveDataSet.AccountRow = BLL.GetAccountByAccountId(DBUtilities.GetSessionAccountId)

            If IsDBNull(dr.Item("SystemPackageTypeId")) OrElse dr.Item("SystemPackageTypeId") = 1 Then
                Return 1
            ElseIf dr.Item("SystemPackageTypeId") = 5 Then
                Return 5
            ElseIf dr.Item("SystemPackageTypeId") = 10 Then
                Return 10
            ElseIf dr.Item("SystemPackageTypeId") = 15 Then
                Return 15
            End If

            Return Nothing

        End Function
        Public Function GetExpiryDateAsString(ByVal dtDate As String) As String

            Return LicensingBLL.GetStringFromEncryptedValue(dtDate)
        End Function
        'Protected Sub btnPayNow_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        '    Dim BLL As New AccountBLL
        '    Dim dr As TimeLiveDataSet.AccountRow = BLL.GetAccountByAccountId(DBUtilities.GetSessionAccountId)
        '    If IsDBNull(dr.Item("LicenseId")) Then
        '        If CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue = 5 Then
        '            Response.Redirect("https://secure.avangate.com/order/checkout.php?PRODS=1331830&QTY=1&REF=" & DBUtilities.GetSessionAccountId)
        '        ElseIf CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue = 10 Then
        '            Response.Redirect("https://secure.avangate.com/order/checkout.php?PRODS=1343185&QTY=1&REF=" & DBUtilities.GetSessionAccountId)
        '        ElseIf CType(Me.FormView1.FindControl("ddlPackage"), DropDownList).SelectedValue = 15 Then
        '            Response.Redirect("https://secure.avangate.com/order/checkout.php?PRODS=1343244&QTY=1&REF=" & DBUtilities.GetSessionAccountId)
        '        End If
        '    Else
        '        Response.Redirect("https://secure.avangate.com/renewal/LICENSE=" & dr.Item("LicenseId") & "&REF=" & DBUtilities.GetSessionAccountId)
        '    End If
        'End Sub
        Public Sub ShowLicenseActivationMessage(ByVal message As String)
            Dim strMessage As String = message
            Dim strScript As String = "alert('" & strMessage & "'); window.location = 'AccountPreferences.aspx';"
            If (Not Me.Page.ClientScript.IsStartupScriptRegistered("clientScript")) Then
                ScriptManager.RegisterClientScriptBlock(Me.Page, Me.GetType, "clientScript", strScript, True)
            End If
        End Sub
        Protected Sub rdManualActivation_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            If CType(Me.FormView1.FindControl("rdManualActivation"), RadioButton).Checked = True Then
                CType(Me.FormView1.FindControl("MachineKeyTextBox"), TextBox).ReadOnly = False
                CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox).ReadOnly = True
            End If
        End Sub
        Protected Sub rdOnlineActivation_CheckedChanged(ByVal sender As Object, ByVal e As System.EventArgs)
            If CType(Me.FormView1.FindControl("rdOnlineActivation"), RadioButton).Checked = True Then
                CType(Me.FormView1.FindControl("MachineKeyTextBox"), TextBox).ReadOnly = True
                CType(Me.FormView1.FindControl("txtLicenseKeys"), TextBox).ReadOnly = False
            End If
        End Sub
        Public Function CheckTextBoxValue(ByVal checkbox As CheckBox, ByVal textbox As TextBox) As Boolean
            If checkbox.Checked = True And textbox.Text = "" Then
                Return True
            End If
        End Function
        Protected Sub btnUpdatePrintInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            If cvExpenseSheetPrintFooterargs <> False Or CType(Me.FormView1.FindControl("txtExpenseSheetPrintFooter"), TextBox).Text = "" Then
                UpdatePrintInfo()
            End If
        End Sub
        Public Sub UpdatePrintInfo()
            Dim BLL As New AccountBLL
            BLL.btnUpdatePrintInfo(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("chkShowTaskInExpenseSheet"), CheckBox).Checked, CType(Me.FormView1.FindControl("txtExpenseSheetPrintFooter"), TextBox).Text)
            UIUtilities.RedirectToAdminHomePage()
        End Sub
        Public Sub UpdateInvoiceInfo()
            Dim BLL As New AccountBLL
            Dim InvoiceBillingTypeId As Guid = New Guid(CType(Me.FormView1.FindControl("ddlInvoiceBillingTypeId"), DropDownList).SelectedValue)
            BLL.btnUpdateInvoiceInfo(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("InvoiceNoPrefixTextBox"), TextBox).Text, InvoiceBillingTypeId, CType(Me.FormView1.FindControl("chkShowBillingRateInInvoiceReport"), CheckBox).Checked, CType(Me.FormView1.FindControl("txtInvoiceFooter"), TextBox).Text, CType(Me.FormView1.FindControl("chkShowProjectNameInInvoiceReport"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowEntryDateInInvoiceReport"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowEmployeeNameInInvoiceReport"), CheckBox).Checked)
            UIUtilities.RedirectToAdminHomePage()
        End Sub
        Public Sub UpdateProjectInfo()
            Dim BLL As New AccountBLL
            BLL.btnUpdateProjectInfo(DBUtilities.GetSessionAccountId, " ", CType(Me.FormView1.FindControl("chkAutoGenerateProjectCode"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowClientDepartmentInProject"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowCompletedProjectInProjectGrid"), CheckBox).Checked)
            UIUtilities.RedirectToAdminHomePage()
        End Sub
        Public Sub UpdateTaskInfo()
            Dim BLL As New AccountBLL
            BLL.btnUpdateTaskInfo(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("chkShowProjectNameInTask"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowClientNameInTask"), CheckBox).Checked)
            UIUtilities.RedirectToAdminHomePage()
        End Sub
        Public Sub UpdateTimeOff()
            Dim BLL As New AccountBLL
            BLL.btnUpdateTimeOff(DBUtilities.GetSessionAccountId, CType(Me.FormView1.FindControl("chkShowProjectForTimeOff"), CheckBox).Checked)
            UIUtilities.RedirectToAdminHomePage()
        End Sub
        Public Sub UpdateTimesheetSetup()
            Dim BLL As New AccountBLL
            Dim TimeEntryHoursFormat As Guid
            Dim ShowClockStartEnd As Boolean
            If Not CType(Me.FormView1.FindControl("ddlTimeEntryHoursFormatId"), DropDownList).SelectedValue = "None" Then
                TimeEntryHoursFormat = New Guid(CType(Me.FormView1.FindControl("ddlTimeEntryHoursFormatId"), DropDownList).SelectedValue)
            Else
                TimeEntryHoursFormat = System.Guid.Empty
            End If
            If CType(Me.FormView1.FindControl("chkShowPercentageInTimesheet"), CheckBox).Checked = True And CType(Me.FormView1.FindControl("ddlTimeEntryHoursFormatId"), DropDownList).SelectedValue <> "074187eb-81d9-4e06-8e70-db7bc0c53784" Or CType(Me.FormView1.FindControl("ddlTimeEntryHoursFormatId"), DropDownList).SelectedValue = "EE9CB3B1-E1A1-4346-B9FC-A3DA1C92A45E".ToLower Then
                ShowClockStartEnd = False
            Else
                ShowClockStartEnd = CType(Me.FormView1.FindControl("chkShowClockStartEnd"), CheckBox).Checked
            End If
            If cvTimesheetPrintFooterargs <> False Or CType(Me.FormView1.FindControl("txtTimesheetPrintFooter"), TextBox).Text = "" Then
                BLL.UpdateTimesheetSetup(DBUtilities.GetSessionAccountId, ShowClockStartEnd, CType(Me.FormView1.FindControl("chkShowClientInTimesheet"), CheckBox).Checked, _
                                         CType(Me.FormView1.FindControl("chkShowDescriptionInWeekView"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowCompletedProjectsInTimeSheet"), CheckBox).Checked, _
                                         CType(Me.FormView1.FindControl("chkShowCompletedTasksInTimeSheet"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowWorkTypeInTimesheet"), CheckBox).Checked, _
                                         CType(Me.FormView1.FindControl("chkShowCostCenterInTimesheet"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowTimeOffInTimesheet"), CheckBox).Checked, _
                                         CType(Me.FormView1.FindControl("chkShowAllInTimesheetReadOnly"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkShowPercentageInTimesheet"), CheckBox).Checked, _
                                         CType(Me.FormView1.FindControl("txtNumberOfBlankRowsInTimeEntry"), TextBox).Text, _
                                         CType(Me.FormView1.FindControl("txtTimesheetOverduePeriods"), TextBox).Text, TimeEntryHoursFormat, CType(Me.FormView1.FindControl("ddlTimeEntryFormat"), DropDownList).SelectedValue, _
                                         CType(Me.FormView1.FindControl("ddlTaskInformation"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("ddlDefaultTimeEntryMode"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("txtTimesheetPrintFooter"), TextBox).Text, _
                                         CType(Me.FormView1.FindControl("ddlTimesheetSort"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("ddlCostCenterInTimesheetBy"), DropDownList).SelectedValue, CType(Me.FormView1.FindControl("chkShowCopyActivitiesButtonInTimesheet"), CheckBox).Checked, _
                                         CType(Me.FormView1.FindControl("chkShowCopyTimesheetButton"), CheckBox).Checked, CType(Me.FormView1.FindControl("chkCalculateTaskPercentageAutomatically"), CheckBox).Checked)
                UIUtilities.RedirectToAdminHomePage()
            End If
        End Sub
        Protected Sub cvTimesheetPrintFooter_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
            If CType(Me.FormView1.FindControl("txtTimesheetPrintFooter"), TextBox).Text.Length > 2000 Then
                args.IsValid = False
                cvTimesheetPrintFooterargs = False
            Else
                args.IsValid = True
                cvTimesheetPrintFooterargs = True
            End If
        End Sub
        Protected Sub cvExpenseSheetPrintFooter_ServerValidate(ByVal source As Object, ByVal args As System.Web.UI.WebControls.ServerValidateEventArgs)
            If CType(Me.FormView1.FindControl("txtExpenseSheetPrintFooter"), TextBox).Text.Length > 2000 Then
                args.IsValid = False
                cvExpenseSheetPrintFooterargs = False
            Else
                args.IsValid = True
                cvExpenseSheetPrintFooterargs = True
            End If
        End Sub
        Protected Sub btnRenew_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Dim BLL As New AccountBLL
            Dim dr As TimeLiveDataSet.AccountRow = BLL.GetAccountByAccountId(DBUtilities.GetSessionAccountId)
            If Not IsDBNull(dr.Item("LicenseId")) Then
                Response.Redirect("https://secure.avangate.com/renewal/?LICENSE=" & dr.Item("LicenseId"), False)
            End If
        End Sub
        Public Sub LoginIn()
            Dim Username As String = CType(Me.FormView1.FindControl("EmployeeEMailAddress"), TextBox).Text
            Dim Password As String = CType(Me.FormView1.FindControl("PasswordTextBox"), TextBox).Text
            Dim BLL As New AuthenticateBLL
            BLL.AuthenticateLogin(Username, Password)
            BLL.LoggedIn(Username, Password)
            If DBUtilities.IsTimeLiveMobileLogin Then
                Response.Redirect(UIUtilities.RedirectToMobileHomePage())
            Else
                Response.Redirect(UIUtilities.RedirectToHomePage())
            End If
        End Sub
        Protected Sub btnInvoice_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            UpdateInvoiceInfo()
        End Sub
        Protected Sub btnUpdateProjectInfo_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.UpdateProjectInfo()
        End Sub

        Protected Sub btnApplicationPreferences_Click(ByVal sender As Object, ByVal e As System.EventArgs)

        End Sub
        Protected Sub btnUpdateTimesheetSetup_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.UpdateTimesheetSetup()
        End Sub
        Protected Sub btnUpdateTimeOff_Click(ByVal sender As Object, ByVal e As System.EventArgs)
            Me.UpdateTimeOff()
        End Sub
        Protected Sub btnUpdateTaskInfo_Click(sender As Object, e As System.EventArgs)
            Me.UpdateTaskInfo()
        End Sub
    End Class
End Namespace
