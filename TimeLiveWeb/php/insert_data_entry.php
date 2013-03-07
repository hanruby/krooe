<?php 
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);
header("Access-Control-Allow-Origin: *");


/*
if(isset($_POST)){*/
	require("connect.php");
	
	$AccountEmployeeId=$_POST['AccountEmployeeId'];
	$Hours=$_POST['Hours'];
	$AccountProjectTaskId=$_POST['AccountProjectTaskId'];
	$AccountProjectId=$_POST['AccountProjectId'];
	$query="SELECT *
			FROM dbo.AccountEmployeeTimeEntry AS a INNER JOIN dbo.AccountEmployeeTimeEntryApprovalProject AS b
			ON
			a.AccountEmployeeTimeEntryApprovalProjectId=b.AccountEmployeeTimeEntryApprovalProjectId
			Inner Join dbo.AccountEmployeeTimeEntryPeriod AS c
			ON c.AccountEmployeeTimeEntryPeriodId= b.AccountEmployeeTimeEntryPeriodId

			AND a.AccountEmployeeId=$AccountEmployeeId And a.AccountProjectTaskId=$AccountProjectTaskId  
			ORDER BY a.AccountEmployeeTimeEntryId DESC ;";

  $stmt = sqlsrv_query( $conn, $query)or die(sqlsrv_errors());
  
	$duration=$_POST['Hours'];
	$h=$duration/1;
	$m=$duration%1;

	$StartTime= DateTime::createFromFormat('d/m/Y H:i:s', $_POST["StartTime"].' 00:00:00');
	$StartTime= $StartTime->format('m/d/Y H:i:s A');//dateTime
	$date=explode("/",$_POST["StartTime"]);
	$time =mktime(0,0,0,$date[1],$date[0],$date[2]);
	$time=$time+60*$m+60*60*$h;
	$EndTime=date("m/d/Y H:i:s A",$time);//dateTime
	$AccountEmployeeTimeEntryPeriodId="NULL";//guid
	/** Get the period id from given date ****/
	/***************** first request ***************/
	/**	select AccountEmployeeTimeEntryPeriodId	
		from AccountEmployeeTimeEntryPeriod
		where '12/31/2012 12:00:00 AM' between TimeEntryStartDate and TimeEntryEndDate and '12/31/2012 12:15:00 AM' between TimeEntryStartDate and TimeEntryEndDate	
	**/
	/**	select AccountEmployeeTimeEntryPeriodId	
		from AccountEmployeeTimeEntryPeriod
		where '12/31/2012 12:00:00 AM' =TimeEntryStartDate  and '12/31/2012 12:15:00 AM' = TimeEntryEndDate	
	**/

	$query2="SELECT AccountEmployeeTimeEntryPeriodId	
			FROM AccountEmployeeTimeEntryPeriod
			WHERE '".$StartTime."' BETWEEN TimeEntryStartDate AND TimeEntryEndDate 
			AND '".$EndTime."' BETWEEN TimeEntryStartDate AND TimeEntryEndDate";
			
	$stmt2= sqlsrv_query( $conn, $query2)or die(sqlsrv_errors());

	if($row2=sqlsrv_fetch_array($stmt2)){

		$AccountEmployeeTimeEntryPeriodId=$row2['AccountEmployeeTimeEntryPeriodId'];
	  	$AccountEmployeeTimeEntryPeriodId="'".$AccountEmployeeTimeEntryPeriodId."'";
	}
    $CreatedByEmployeeId="NULL";//int
    $EmployeeRateCurrencyId="NULL";//int
    
    $BillingRateCurrencyId="NULL";//int
    $AccountBaseCurrencyId="NULL";//int
    $AccountCostCenterId="NULL";//int
    $EmployeeRate="NULL";//decimal
	$TimeEntryDate=$StartTime;//dateTime
	$TotalTime=$EndTime;//dateTime
	$Description="NULL";//string
    $AccountWorkTypeId="NULL";//int
    $AccountPartyId="NULL";//int
	$BillingRate="NULL";
	$Rejected="NULL";
    $IsTimeOff="NULL";//boolean
    $BillingRate="NULL";
    $Submitted="NULL";
    $Approved="NULL";
    $BillingRateExchangeRate="NULL";//float
    $Billed="NULL";//boolean
    $TeamLeadApproved="NULL";
    $ProjectManagerApproved="NULL";
    $EmployeeRateExchangeRate="NULL";
    $AdministratorApproved="NULL";
    $AccountId="NULL";
	if($row=sqlsrv_fetch_array($stmt)){
        $AccountPartyId=$row['AccountPartyId'];
        $BillingRate=$row['BillingRate'];
		$Rejected=$row['Rejected'];
	    $IsTimeOff=$row['IsTimeOff'];
	    $BillingRate=$row['BillingRate'];
	    $Submitted=$row['Submitted'];
	    $Approved=$row['Approved'];
	    $CreatedByEmployeeId=$row['CreatedByEmployeeId'];
	    $Billed=$row['Billed'];
	    $TeamLeadApproved=$row['TeamLeadApproved'];
	    $ProjectManagerApproved=$row['ProjectManagerApproved'];
	    $EmployeeRateExchangeRate=$row['EmployeeRateExchangeRate'];
	    $EmployeeRateCurrencyId=$row['EmployeeRateCurrencyId'];
	    //Test if the AccountEmployeeTimeEntryPeriodId is set 
	    //else create new record
	    if($AccountEmployeeTimeEntryPeriodId=="NULL"){
	    	$AccountId=$row['AccountId'];
	    	//insert the period record
	    	$query3="INSERT INTO [dbo].[AccountEmployeeTimeEntryPeriod] ([AccountEmployeeTimeEntryPeriodId], [AccountId], [AccountEmployeeId], [TimeEntryStartDate], [TimeEntryEndDate], [TimeEntryViewType], [Submitted], [Approved], [Rejected], [InApproval], [SubmittedDate], [ApprovedOn], [ApprovedByEmployeeId], [RejectedOn], [RejectedByEmployeeId], [SubmittedBy], [CreatedByEmployeeId], [ModifiedByEmployeeId], [PeriodDescription], [CreatedOn], [ModifiedOn]) VALUES (default, $AccountId, $AccountEmployeeId, '$StartTime', '$EndTime','Weekly', 1, 0, 0, 0, '$StartTime', NULL, NULL, NULL, NULL, $AccountEmployeeId, $AccountEmployeeId, NULL, NULL, '$StartTime', NULL)";

	    	$stmt3 = sqlsrv_query( $conn, $query3)or die(sqlsrv_errors());
	    	if(sqlsrv_rows_affected ($stmt3)>0){
				$message= "Period record inserted successfully";
			}else{
				$message= "Period record insert failed";
			}
			// now grab that period id
			$query4="SELECT *
					FROM [dbo].[AccountEmployeeTimeEntryPeriod]
					WHERE TimeEntryStartDate='$StartTime' AND TimeEntryEndDate='$EndTime';
					";
			$stmt4 = sqlsrv_query( $conn, $query4)or die(sqlsrv_errors());		
			if($row4=sqlsrv_fetch_array($stmt4)){
				$AccountEmployeeTimeEntryPeriodId=$row4['AccountEmployeeTimeEntryPeriodId'];
				$AccountEmployeeTimeEntryPeriodId="'".$AccountEmployeeTimeEntryPeriodId."'";
			}	
		}
	    $BillingRateCurrencyId=$row['BillingRateCurrencyId'];
	    $AccountBaseCurrencyId=$row['AccountBaseCurrencyId'];
	    $AccountCostCenterId=$row['AccountCostCenterId'];
	    $AccountCostCenterId="NULL";
	    $BillingRateExchangeRate=$row['BillingRateExchangeRate'];
	    $EmployeeRate=$row['EmployeeRate'];
	    $AdministratorApproved=$row['AdministratorApproved'];
        $AccountWorkTypeId=$row['AccountWorkTypeId'];
	}
	
		$query="INSERT INTO AccountEmployeeTimeEntry (AccountEmployeeId, TimeEntryDate, StartTime, EndTime, TotalTime, AccountProjectId, AccountProjectTaskId, Description, Approved, CreatedOn, ModifiedOn, TeamLeadApproved, ProjectManagerApproved, AdministratorApproved, Rejected, BillingRate, AccountPartyId, Submitted, AccountWorkTypeId, EmployeeRate, AccountCostCenterId, BillingRateCurrencyId, EmployeeRateCurrencyId, BillingRateExchangeRate, EmployeeRateExchangeRate, AccountBaseCurrencyId, AccountEmployeeTimeEntryPeriodId, Billed, CreatedByEmployeeId, ModifiedByEmployeeId, IsTimeOff,Hours) 

		VALUES ($AccountEmployeeId, '$TimeEntryDate', '$StartTime', '$EndTime', '$TotalTime', $AccountProjectId, $AccountProjectTaskId,$Description, $Approved, getdate(), getdate(), $TeamLeadApproved, $ProjectManagerApproved, $AdministratorApproved, $Rejected, $BillingRate, $AccountPartyId,  $Submitted, $AccountWorkTypeId, $EmployeeRate, $AccountCostCenterId, $BillingRateCurrencyId, $EmployeeRateCurrencyId, $BillingRateExchangeRate, $EmployeeRateExchangeRate, $AccountBaseCurrencyId, $AccountEmployeeTimeEntryPeriodId, $Billed, $CreatedByEmployeeId, $AccountEmployeeId, $IsTimeOff,$Hours);
		;";
		
		$stmt = sqlsrv_query( $conn, $query)or die(sqlsrv_errors());
		if(sqlsrv_rows_affected ($stmt)>0){
			
			$message= "success";
		}else{
			$message= "fail";
		}
		/*
}*/
echo json_encode(array(
					"message"=>$message,
					#"query"=>$query,
					"AccountEmployeeTimeEntryPeriodId"=>$AccountEmployeeTimeEntryPeriodId,
					"StartTime"=>$StartTime,
					"EndTime"=>$EndTime
					
				));
 ?>