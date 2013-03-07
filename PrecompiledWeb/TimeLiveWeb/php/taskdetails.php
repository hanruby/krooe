<?php 
header("Access-Control-Allow-Origin: *");
if(isset($_POST['AccountProjectId'])){
	require("connect.php");
	$AccountProjectId=$_POST['AccountProjectId'];
	$query="select * from dbo.AccountProjectTask 
	where AccountProjectId=".$AccountProjectId;
	$result=mssql_query($query)or die("query error");
	$json="{ 'items':[";
	$num_rows=mssql_num_rows($result);
	$i=0;
	while($row = mssql_fetch_assoc($result)){
		$i++;
		if($i<$num_rows){
			$json.="{'AccountProjectTaskId':".$row["AccountProjectTaskId"].",";
		 	$json.="'TaskName':".$row["TaskName"].",";
		 	$json.="'TaskDescription':".$row["TaskDescription"]."},";

		}else{
			$json.="{'AccountProjectTaskId':".$row["AccountProjectTaskId"].",";
		 	$json.="'TaskName':".$row["TaskName"].",";
		 	$json.="'TaskDescription':".$row["TaskDescription"]."}";
		}
		 

	}
	$json.="]}";
	header('Content-type: application/json');
	
	echo $json;
}

 ?>