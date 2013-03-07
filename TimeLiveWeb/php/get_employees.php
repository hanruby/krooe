<?php 
header("Access-Control-Allow-Origin: *");
if(isset($_POST)){
	require("connect.php");
$AccountDepartmentId=$_POST['AccountDepartmentId'];
$sqlStatement = "SELECT * 
				 FROM dbo.AccountEmployee 
				 WHERE AccountDepartmentId = $AccountDepartmentId";
				
$stmt = sqlsrv_query( $conn, $sqlStatement)or die(sqlsrv_errors());
$json=array();
$i=0;
while($row = sqlsrv_fetch_array($stmt)){
	$json[$i]['FirstName']=$row['FirstName'];
	$json[$i]['LastName']=$row['LastName'];
	$json[$i]['AccountEmployeeId']=$row['AccountEmployeeId'];
	$json[$i]['EMailAddress']=$row['EMailAddress'];
	$json[$i]['MobilePhoneNo']=$row['MobilePhoneNo'];

$i++;
}
header("Content-type: application/json");
echo json_encode($json);
}
 ?>