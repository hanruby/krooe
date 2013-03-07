<?php 
header("Access-Control-Allow-Origin: *");
//Database credentials
$serverName = "SQL2k803.discountasp.net"; //serverName\instanceName
$connectionInfo = array( "Database"=>"SQL2008_884610_krooe", "UID"=>"SQL2008_884610_krooe_user", "PWD"=>"panda1988");
$conn = sqlsrv_connect( $serverName, $connectionInfo);
?>