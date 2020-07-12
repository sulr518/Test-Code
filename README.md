# Test-Code


#### - CMD String 2 Powershell enc string

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

#### - PS1 file -> Powershell enc string
~~~
#for 3.0
#$scriptPath = $PSScriptRoot 

# for 2.0
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition

$ps1_str = Get-Content "$scriptPath\test.ps1"

$bytes = [System.Text.Encoding]::Unicode.GetBytes($ps1_str)
$encodedCommand = [Convert]::ToBase64String($bytes)
echo $encodedCommand
~~~


### Invoke-Expression - run ps code
~~~
$cmdstr = "powershell -EncodedCommand dwBoAG8AYQBtAGkACgA=";
$cmdstr = Invoke-Expression "$cmdstr"

#$scriptPath = $PSScriptRoot
$scriptPath = split-path -parent $MyInvocation.MyCommand.Definition
#Invoke-Expression "$scriptPath\test.ps1"
~~~
