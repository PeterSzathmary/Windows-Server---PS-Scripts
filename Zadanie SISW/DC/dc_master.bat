@echo off
call :Resume
goto %current%
goto :eof

:one
::Add script to Run key
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v %~n0 /d %~dpnx0 /f
echo two >%~dp0current.txt
echo -- Section one --
::powershell.exe -executionpolicy remotesigned -file .\dc_rename_pc.ps1
start /wait powershell.exe -executionpolicy remotesigned "& "'C:\Users\Administrator\Desktop\dc_rename_pc.ps1'
::pause
shutdown -r -t 0
goto :eof

:two
echo three >%~dp0current.txt
echo -- Section two --
::powershell.exe -executionpolicy remotesigned -file .\dc_static_ip.ps1
start /wait powershell.exe -executionpolicy remotesigned "& "'C:\Users\Administrator\Desktop\dc_static_ip.ps1'
::pause
shutdown -r -t 0
goto :eof

:three
echo four >%~dp0current.txt
echo -- Section three --
::powershell.exe -executionpolicy remotesigned -file .\dc_dns.ps1
start /wait powershell.exe -executionpolicy remotesigned "& "'C:\Users\Administrator\Desktop\dc_dns.ps1'
::pause
shutdown -r -t 0
goto :eof

:four
echo five >%~dp0current.txt
echo -- Section four --
::powershell.exe -executionpolicy remotesigned -file .\dc_adds.ps1
start /wait powershell.exe -executionpolicy remotesigned "& "'C:\Users\Administrator\Desktop\dc_adds.ps1'
::pause
shutdown -r -t 0
goto :eof

:five
::Remove script from Run key
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v %~n0 /f
del %~dp0current.txt
echo -- Section five --
::pause
shutdown -r -t 0
goto :eof

:resume
if exist %~dp0current.txt (
    set /p current=<%~dp0current.txt
) else (
    set current=one
)