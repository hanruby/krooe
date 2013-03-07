<?php 
header("Access-Control-Allow-Origin: *");
if(isset($_POST)){
	require("connect.php");
	$AccountProjectId=$_POST['AccountProjectId'];
	$sqlStatement="select * from dbo.AccountProjectTask where  AccountProjectId=".$AccountProjectId;  
	$stmt = sqlsrv_query( $conn, $sqlStatement)or die(sqlsrv_errors());
	
	$i=0;
	$data=array();
	while($row = sqlsrv_fetch_array($stmt)){
		
		$data[$i]["AccountProjectTaskId"]=$row["AccountProjectTaskId"];
		$data[$i]["AccountProjectId"]=$row["AccountProjectId"];
		$data[$i]["TaskName"]=$row["TaskName"];
		$data[$i]["TaskDescription"]=$row["TaskDescription"]; 
		$data[$i]["ParentAccountProjectTaskId"]=$row["ParentAccountProjectTaskId"];
		$i++;
	}
	header("Content-type: application/json");
	echo  json_encode($data);




}

 ?>