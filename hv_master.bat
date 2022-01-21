@echo off
call :Resume
goto %current%
goto :eof

:one
::Add script to Run key
reg add HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v %~n0 /d %~dpnx0 /f
echo two >%~dp0current.txt
echo -- Section one --
start /wait powershell.exe -executionpolicy remotesigned "& "'C:\Users\Administrator\Desktop\hv_rename_pc.ps1'
pause
shutdown -r -t 0
goto :eof

:two
echo three >%~dp0current.txt
echo -- Section two --
start /wait powershell.exe -executionpolicy remotesigned "& "'C:\Users\Administrator\Desktop\hv_static_ip.ps1'
pause
shutdown -r -t 0
goto :eof

:three
echo four >%~dp0current.txt
echo -- Section three --
::start /wait powershell.exe -executionpolicy remotesigned "& "'C:\Users\Administrator\Desktop\fs_add_domain.ps1
netdom join %computername% /domain:windows.lab /reboot
pause
::set /p DUMMY=Hit ENTER to continue...
::shutdown -r -t 0
goto :eof

:four
echo five >%~dp0current.txt
echo -- Section four --
::start /wait powershell.exe -executionpolicy remotesigned "& "'C:\Users\Administrator\Desktop\hv_install_hyperv.ps1'
pause
shutdown -r -t 0
goto :eof

:five
::Remove script from Run key
reg delete HKCU\Software\Microsoft\Windows\CurrentVersion\Run /v %~n0 /f
del %~dp0current.txt
echo -- Section five --
pause
shutdown -r -t 0
goto :eof

:resume
if exist %~dp0current.txt (
    set /p current=<%~dp0current.txt
) else (
    set current=one
)