<?php
//第一题
$arr=array(
	"Jersey"=>array("Monday"=>2,"Tuesday"=>8,"Wednesday"=>4,"Thursday"=>2,"Friday"=>4),
	"Pete"=>array("Monday"=>0,"Tuesday"=>0,"Wednesday"=>3,"Thursday"=>8,"Friday"=>8),
	"Joel"=>array("Monday"=>4,"Tuesday"=>6,"Wednesday"=>4,"Thursday"=>4,"Friday"=>4),
	"Martin"=>array("Monday"=>8,"Tuesday"=>8,"Wednesday"=>8,"Thursday"=>8,"Friday"=>8),
);
//第二题
foreach ($arr as $key => $val) {
	echo $key."<br>";
	/*
	foreach ($val as $vk => $v) {
		if($v<=1){
			//echo $vk.":Very Rare (".$v.")";
		}elseif($v=2||$v=3){
			//echo $vk.":Rare (".$v.")";
		}elseif($v=4||$v=5){
			//echo $vk.":Normal(".$v.")";
		}elseif($v=6||$v=7){
			//echo $vk.":Freqent (".$v.")";
		}else{
			//echo $vk.":Very Freqent (".$v.")";
		}		
	}
	*/
	echo "<br><br>";
}
?>