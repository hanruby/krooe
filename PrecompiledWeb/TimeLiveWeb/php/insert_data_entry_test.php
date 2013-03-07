<?php 
ini_set('display_errors',1);
ini_set('display_startup_errors',1);
error_reporting(-1);
header("Access-Control-Allow-Origin: *");
$StartTime= DateTime::createFromFormat('d/m/Y H:i:s', $_POST["StartTime"].' 00:00:00');
	$StartTime= $StartTime->format('m/d/Y H:i:s A');//dateTime
	$date=explode("/",$_POST["StartTime"]);
	$time =mktime(0,0,0,$date[1],$date[0],$date[2]);
	$duration=$_POST['Hours'];
	$h=$duration/1;
	$m=$duration%1;
	$time=$time+60*$m+60*60*$h;
	$EndTime=date("m/d/Y H:i:s A",$time);//dateTime
	echo "StartTime ".$StartTime."<br/>";
	echo "EndTime ".$EndTime;

?>