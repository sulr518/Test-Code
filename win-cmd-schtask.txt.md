- 创建计划任务
~~~
schtasks /create /s IP地址 /u 用户名 /p "密码" /tn "任务名称" /sc 计划频率 /tr 运行程序路径 /ru "运行帐户" /f
schtasks /create /tn TaskName /tr TaskRun /sc minute [/mo {1 - 1439}] [/st StartTime] [/sd StartDate] [/ed EndDate] [/s computer [/u [domain\]user /p password]] [/ru {[Domain\]User | "System"} [/rp Password]] 


每分钟运行1次
cmd /c schtasks /create /sc MINUTE /tn "Tasks" /tr "d:\Tasks.js" /mo 1 /F


计划任务每 20 分钟运行一次。 
schtasks /create /sc minute /mo 20 /tn "Security Script" /tr \\central\data\scripts\sec.vbs 


计划命令每五小时运行一次
 schtasks /create /sc hourly /mo 5 /sd 03/01/2001 /tn "My App" /tr c:\apps\myapp.exe 
 
 
计划 MyApp 程序在每天的 8:00 A.M. 运行一次，直到 2001 年 12 月 31 日结束
 
schtasks /create /tn "My App" /tr c:\apps\myapp.exe /sc daily /st 08:00:00 /ed 12/31/2001 
~~~


- gen vbs-task by cmd
~~~
echo set WS1 = CreateObject("WScript.Shell") > "%xxx%\%yyy%.vbs"
echo WS1.Run "cmd.exe /c Powershell.exe -ExecutionPolicy UnRestricted -File %xxx%\%yyy%.ps1",0,false >>"%xxx%\%yyy%.vbs"
~~~

- add vsb task
~~~
schtasks /Create /SC Minute /MO 9 /F /tn %yyy% /tr "%xxx%\%yyy%.vbs"
~~~

- add js task
~~~
cmd /c schtasks /create /sc MINUTE /tn "aaTasks" /tr "d:\aaTasks.js" /mo 1 /F
~~~

~~~
删除计划任务
    schtasks /delete /s IP地址 /u 用户名 /p "密码" /tn "任务名称" /f   

检查是否存在某个计划任务 
    schtasks /query /s IP地址 /u 用户名 /p "密码" | findstr /c:"任务名称" 

运行计划任务
    schtasks /run /s IP地址 /u 用户名 /p "密码" /i /tn "任务名称"  
~~~
    
    
