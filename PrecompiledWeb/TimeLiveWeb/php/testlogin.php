<?php
header("Access-Control-Allow-Origin:*");
require("connect.php");
//Grabbing information from POST call
$uname = $_POST['username'];
$pword = $_POST['password'];

//Encrypting the password
$EncryptionKey = "zooooooooooo123";
$data = mb_convert_encoding($pword, "UTF-16LE", "UTF-8");

$EncodedPassword = base64_encode(HexToBytes(hash_hmac("sha1", $data, $EncryptionKey)));



$sqlStatement = "SELECT TOP 1 * 
				 FROM dbo.AccountEmployee 
				 WHERE EMailAddress = '$uname'
				 AND Password = '$EncodedPassword'";
$stmt = sqlsrv_query( $conn, $sqlStatement)or die(sqlsrv_errors());
$row = sqlsrv_fetch_array($stmt);
if($row){
	$json = array(
			  'status' => true,
			  'fname' => $row['FirstName'], 
			  'lname' => $row['LastName'],
			  'email' => $row['EMailAddress'],
			  'pword' => $row['Password'],
			  'AccountEmployeeId'=>$row['AccountEmployeeId'],
			  'AccountId'=>$row['AccountId']
		   );

}else{
	$json = array('status' => false,
				  'fname' => 'Testing', 
				  'lname' => 'For failure!',
				  'error_message'=>sqlsrv_errors()
				  );
}

echo json_encode($json);


//Encrypting Password function: Hex to Bytes
function HexToBytes($input) {
	return join('', array_map('chr', array_map('hexdec', str_split($input, 2))));
}	
?>