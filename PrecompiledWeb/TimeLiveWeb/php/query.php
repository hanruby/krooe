<?php 
require("connect.php");
	$sqlStatement="SELECT t.name AS table_name,SCHEMA_NAME(schema_id) AS schema_name,
		c.name AS column_name
		FROM sys.tables AS t
		INNER JOIN sys.columns c ON t.OBJECT_ID = c.OBJECT_ID
		WHERE c.name LIKE '%AccountWorkTypeId%'
		ORDER BY schema_name, table_name;";
	$stmt = sqlsrv_query( $conn, $sqlStatement)or die(sqlsrv_errors());
	
	$data=array();
	$i=0;
	while($row = sqlsrv_fetch_array($stmt)){
		$data[$i]["table_name"]=$row[0];

	}
	header("Content-type: application/json");
	header("Access-Control-Allow-Origin: *");
	echo  json_encode($data);


 ?>