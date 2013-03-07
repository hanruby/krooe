<?php 
header("Access-Control-Allow-Origin: *");
if(isset($_POST['AccountId'])){
	require("connect.php");
	$account_id=$_POST['AccountId'];
	$sqlStatement="select * from dbo.AccountProject where AccountId=".$account_id;
	$stmt = sqlsrv_query( $conn, $sqlStatement)or die(sqlsrv_errors());
	
	$data=array();
	$i=0;
	while($row = sqlsrv_fetch_array($stmt)){
		$data[$i]["AccountId"]=$row["AccountId"];
		$data[$i]["ProjectName"]=$row["ProjectName"];
		$data[$i]["AccountProjectId"]=$row["AccountProjectId"];
		$i++;
	}
	header("Content-type: application/json");
	header("Access-Control-Allow-Origin: *");
	echo  json_encode($data);
}


 ?>