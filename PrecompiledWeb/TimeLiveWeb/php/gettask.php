<?php 
if(isset($_POST['AccountId']) &&isset($_POST['AccountEmployeeId'])){
	require("connect.php");
	$AccountId=$_POST['AccountId'];
	$AccountEmployeeId=$_POST['AccountEmployeeId'];
	$query="select * from dbo.AccountProjectTaskEmployee where AccountId=".$AccountId."AND AccountEmployeeId=".$AccountEmployeeId;  
	$result=mssql_query($query)or die("query error ");
	$i=0;
	while($row = mssql_fetch_assoc($result)){
		$data[$i]["AccountId"]=$row["AccountId"];
		$data[$i]["AccountEmployeeId"]=$row["AccountEmployeeId"];
		$data[$i]["AccountProjectTaskEmployeeId"]=$row["AccountProjectTaskEmployeeId"];
		$i++;
	}
	header("Content-type: application/json");
	header("Access-Control-Allow-Origin: *");
	echo  json_encode($data);
}



 ?>