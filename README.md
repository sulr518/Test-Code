# Test-Code




#### -  Powershell Command String

- cmd2base64.ps1,  encode cmd to base64 string

~~~ powershell
$fileContent = "cmd.exe /c start calc.exe "
$bytes = [System.Text.Encoding]::Unicode.GetBytes($fileContent)
$encodedCommand = [Convert]::ToBase64String($bytes)
echo $encodedCommand
~~~



- cmd2base64.bat

~~~markdown
powershell.exe -nologo -noprofile -exec bypass -f cmd2base64.ps1
pause
~~~

output:

> YwBtAGQALgBlAHgAZQAgAC8AYwAgAHMAdABhAHIAdAAgAGMAYQBsAGMALgBlAHgAZQAgAA==

usage:

~~~
powershell.exe -enc YwBtAGQALgBlAHgAZQAgAC8AYwAgAHMAdABhAHIAdAAgAGMAYQBsAGMALgBlAHgAZQAgAA==
~~~
