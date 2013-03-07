<?php 
header("Access-Control-Allow-Origin: *");
if(isset($_POST)){
	require("connect.php");
$AccountId=$_POST['AccountId'];
$sqlStatement = "SELECT * 
				 FROM dbo.AccountDepartment 
				 WHERE AccountId = $AccountId";
				
$stmt = sqlsrv_query( $conn, $sqlStatement)or die(sqlsrv_errors());
$json=array();
$i=0;
while($row = sqlsrv_fetch_array($stmt)){
	$json[$i]['AccountDepartmentId']=$row['AccountDepartmentId'];
	$json[$i]['AccountId']=$row['AccountId'];
	$json[$i]['DepartmentName']=$row['DepartmentName'];
$i++;
}
header("Content-type: application/json");
echo json_encode($json);
}
 ?>