<?php
define('ENVIRONMENT',isset($_SERVER['CI_ENV'])?$_SERVER['CI_ENV']:'production');
switch(ENVIRONMENT){
	case  'development':error_reporting(-1);
		ini_set('display_errors',1);
		break;
	case  'testing':"";
	case  'production':ini_set('display_errors',0);
		if(version_compare(PHP_VERSION,'5.3','>=')){error_reporting(E_ALL&~E_NOTICE&~E_DEPRECATED&~E_STRICT&~E_USER_NOTICE&~E_USER_DEPRECATED);}else{error_reporting(E_ALL&~E_NOTICE&~E_STRICT&~E_USER_NOTICE);}
		break;
	default:
		header('HTTP/1.1 503 Service Unavailable.',TRUE,503);
		echo 'The application environment is not set correctly.';exit(1);
}
ini_set('display_errors',1);
$a='include';
$b='app';
$c='';
if(defined('STDIN')){
	chdir(dirname(__FILE__));
}
if(($d=realpath($a))!==FALSE){
	$a=$d.'/';
}else{
	$a=rtrim($a,'/').'/';
}
if(!is_dir($a)){
	header('HTTP/1.1 503 Service Unavailable.',TRUE,503);
	echo 'Your system folder path does not appear to be set correctly. Please open the following file and correct this: '.pathinfo(__FILE__,PATHINFO_BASENAME);
	exit(3);
}
define('SELF',pathinfo(__FILE__,PATHINFO_BASENAME));
define('BASEPATH',str_replace('\\','/',$a));
define('FCPATH',dirname(__FILE__).'/');
define('SYSDIR',trim(strrchr(trim(BASEPATH,'/'),'/'),'/'));
if(is_dir($b)){
	if(($d=realpath($b))!==FALSE){
		$b=$d;
	}
	define('APPPATH',$b.DIRECTORY_SEPARATOR);
}else{
	if(!is_dir(BASEPATH.$b.DIRECTORY_SEPARATOR)){
		header('HTTP/1.1 503 Service Unavailable.',TRUE,503);
		echo 'Your application folder path does not appear to be set correctly. Please open the following file and correct this: '.SELF;exit(3);
	}
	define('APPPATH',BASEPATH.$b.DIRECTORY_SEPARATOR);
}
if(!is_dir($c)){
	if(!empty($c)&&is_dir(APPPATH.$c.DIRECTORY_SEPARATOR)){
		$c=APPPATH.$c;
	}elseif(!is_dir(APPPATH.'views'.DIRECTORY_SEPARATOR)){
		header('HTTP/1.1 503 Service Unavailable.',TRUE,503);
		echo 'Your view folder path does not appear to be set correctly. Please open the following file and correct this: '.SELF;exit(3);
	}else{
		$c=APPPATH.'views';
	}
}
if(($d=realpath($c))!==FALSE){
	$c=$d.DIRECTORY_SEPARATOR;
}else{
	$c=rtrim($c,'/\\').DIRECTORY_SEPARATOR;
}
define('VIEWPATH',$c);
require_once BASEPATH.'core/CodeIgniter.php';