@echo off
__IP To:olS KiT:: by AnonymousKitLord.
color 5f
ping -n 1 localhost 2>NUL 1>NUL
color 7
set selectedi=
:begin
set /a counter=-1
for /f "skip=3 delims=" %%a in ('netsh interface show interface') do for /f "tokens=1,2,3*" %%b in ("%%a") do if %%e NEQ "" echo "%%e"|findstr /r "[%%]" >NUL&&(echo.&echo..-Bat---Attention--required-!-!---------------------&echo.^|Found offensive character '%%' Interface name      ^|&echo.^|Unable to proceed with this interface due to this.^|&echo.^|offending character, therefore                    ^|&echo.^|please change it's name!                          ^|&echo.----------------------------------------------------&echo.Error Details: Interface Name: [%%e]&echo.&echo.Press Any Key to Open Network Adapter connection...&PAUSE >NUL&ncpa.cpl ) || call :set "%%e"
goto FIRSTstart
:set
set temporary=%1
if %1=="" goto india 
set /a counter+=1
set interface[%counter%]=%1
set /a number=counter+1

CALL set template=%%interface[%counter%]%%

if %template% NEQ "" if NOT DEFINED selectedi set selectedi=%template%
if %template% NEQ "" echo %number% Interface:%template%
:india
Exit /B
:FIRSTSTART
set /a total=number
:START
set /a number=total
set /a number+=1
if Defined CustomTemplate (echo.%number% Custom Interface Name "%CustomTemplate%") else (echo.%number% Custom Interface Name )
set /a number+=1
echo.%number% Custom Command
set /a number+=1
echo.%number% Ping Lists
set /a number+=1
echo.%number% Enable
set /a number+=1
echo.%number% Disable
set /a number+=1
echo.%number% Settings
set /a number+=1
echo.%number% Edit
echo.
echo.

if Defined selectedi echo.Selected interface=%selectedi% D=Dhcp
choice /c 123456789CDS
set /a choic=%errorlevel%
if %choic% LEQ %total% goto selectedi
set /a selected=total+1
if %choic%==%selected% goto CustomInterfaceName
set /a selected=total+2
if %choic%==%selected% goto CustomCommand
set /a selected=total+3
if %choic%==%selected% goto FileExplorer
set /a selected=total+4
if %choic%==%selected% goto enable
set /a selected=total+5
if %choic%==%selected% goto disable
set /a selected=total+6
if %choic%==%selected% goto settings
set /a selected=total+7
if %choic%==%selected% goto static
if %choic%==10 goto setinterface
if %choic%==11 goto dhcp

goto begin
:selectedi
set /a real_thing=choic-1
call set selectedi=%%interface[%real_thing%]%%
goto begin
:CustomInterfaceName
set /p CustomTemplate=Enter Interface Name:
cls
goto begin
:CustomCommand
set /p Command=Enter command^>
echo on
%command%
@echo off
PAUSE >NUL
goto begin
:FileExplorer
set /a invalid=0
set /a valid=0
if defined selectedfile goto fileopen
Cls
echo.Press a key to select ping list file....
Pause >NUL
for /f "delims=" %%i in ('powershell -c "Add-Type -AssemblyName System.Windows.Forms;$FileBrowser = New-Object System.Windows.Forms.OpenFileDialog -Property @{ InitialDirectory = [Environment]::GetFolderPath('Desktop') };$null = $FileBrowser.ShowDialog();$FileBrowser.Filename"') do set selectedfile=%%i
if not defined selectedfile goto begin
:fileopen
echo "%selectedfile%"
if defined selectedfile for /f "delims=" %%i in ('type "%selectedfile%"') do echo %%i|findstr /r "^[0-9]*[.][0-9]*[.][0-9]*[.][0-9]*$"&&(set /a valid=1 ) || (set /a invalid+=1)

if %valid%==1 if %invalid%==0 echo.Sane File Found!
if %valid%==1 if %invalid% GTR 0 echo.File may contain invalid data.
if %valid%==0                 echo.File contains invalid data.
echo. & echo.Continue?
set /a wait=200
choice /m "Continue?"
if %errorlevel%==2 goto begin
for /f "delims=" %%i in ('type "%selectedfile%"') do echo.%%i&start cmd /c "PING -n 1 -w %wait% %%i&&(mode 35,5&color 0A&ECHO OFF&CLS&ECHO %%i&title whatabout:scan09328912:%%i&PAUSE >NUL)"
echo.Press any key
PAUSE >nul
echo.&echo.Press any key to scan results...
PAUSE >NUL
echo.Beginning scan....
setlocal enabledelayedexpansion
REM LEM
set stopper=^


REM HELLO
timeout 1 >NUL
set stl=
for /f "delims=" %%i in ('tasklist /v /fi "windowtitle eq whatabout:scan09328912:*" /fo list ^| findstr  "whatabout:scan09328912:"') do for /f "tokens=4 delims=:" %%a in ("%%i") do set stl=!stl!%%a is UP!stopper!


if "!stl!"=="" (echo.No results. &echo.) else (echo !stl!)

pause >NUL

taskkill /fi "windowtitle eq whatabout:scan09328912:*" 1>NUL 2>NUL
echo.[Closed Window]
Endlocal disabledelayedexpansion
PAUSE >NUL
goto begin
:setinterface
set /a totalminusone=total-1
for /l %%d in (0,1,%totalminusone%) do CALL echo %%d. %%interface[%%d]%%
if defined CustomTemplate echo.%total%. "%CustomTemplate%"
choice /c 0123456789
set /a thechooiseintheend=%errorlevel%-1
if defined CustomTemplate if %thechooiseintheend%==%total% set selectedi="%CustomTemplate%"
for /l %%d in (0,1,%totalminusone%) do if %%d==%thechooiseintheend% CALL set selectedi=%%interface[%%d]%%
goto begin
:enable
if not defined selectedi echo.Please select an Interface&PAUSE&goto begin
echo.running command...
echo.netsh interface set interface %selectedi% enable
echo.netsh interface set interface %selectedi% enable  >> temps23210948.bat
echo.echo Errorlevel=%%errorlevel%% >> temps23210948.bat
echo.PAUSE >> temps23210948.bat

if exist temps23210948.bat for /f "tokens=*" %%i in ('dir /s /b .\temps23210948.bat') do set file_nameis=%%i

echo Set objShell = CreateObject("Shell.Application") >xxxxxxxxxx0931092.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>xxxxxxxxxx0931092.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& "%file_nameis%" ^& Chr(34) , "", "runas" >>xxxxxxxxxx0931092.vbs
wscript "xxxxxxxxxx0931092.vbs" 
timeout 2 
del xxxxxxxxxx0931092.vbs
del temps23210948.bat
goto begin
:disable
if not defined selectedi echo.Please select an Interface&PAUSE&goto begin
echo.running command...
echo.netsh interface set interface %selectedi% disable
echo.netsh interface set interface %selectedi% disable  >> temps23210948.bat
echo.echo Errorlevel=%%errorlevel%%  >> temps23210948.bat
echo.PAUSE >> temps23210948.bat
if exist temps23210948.bat for /f "tokens=*" %%i in ('dir /s /b .\temps23210948.bat') do set file_nameis=%%i

echo Set objShell = CreateObject("Shell.Application") >xxxxxxxxxx0931092.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>xxxxxxxxxx0931092.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& "%file_nameis%" ^& Chr(34) , "", "runas" >>xxxxxxxxxx0931092.vbs
wscript "xxxxxxxxxx0931092.vbs" 
timeout 2 
del xxxxxxxxxx0931092.vbs
del temps23210948.bat
goto begin
:settings
if not defined selectedi echo.Please select an Interface&PAUSE&goto begin

set ipis=
set gateis=
set subnetis=

for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^=%selectedi% ^| find "IP Address:" ') do set ipis=%%i
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^=%selectedi% ^| find "Default Gateway:" ') do set gateis=%%i
for /f "delims=" %%i in ('netsh interface ipv4 show addresses name^=%selectedi% ^| find "Subnet Prefix:" ') do set subnetis=%%i

for /f "tokens=*" %%i in ('netsh  interface ipv4 show addresses name^=%selectedi% ^| find "DHCP enabled:"') do for /f "tokens=3 delims=: " %%a in ("%%i") do set string=%%a



if "%string%"=="No"   echo.    IP settings: Static
if "%string%"=="Yes"  echo.    IP settings: DHCP
if defined ipis echo %ipis%
if defined gateis echo %gateis%
if defined subnetis echo %subnetis%
goto begin
:dhcp
if not defined selectedi echo.Please select an Interface&PAUSE&goto begin
echo @echo off^&title Running Command..^& cls ^& echo.netsh interface ipv4 set address name=%selectedi% source=dhcp  > temps23210948.bat
echo.netsh -c interface ipv4 set address name=%selectedi% source=dhcp  >> temps23210948.bat
echo.echo Errorlevel=%%errorlevel%%  >> temps23210948.bat
echo.PAUSE >> temps23210948.bat
if exist temps23210948.bat for /f "tokens=*" %%i in ('dir /s /b .\temps23210948.bat') do set file_nameis=%%i

echo Set objShell = CreateObject("Shell.Application") >xxxxxxxxxx0931092.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>xxxxxxxxxx0931092.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& "%file_nameis%" ^& Chr(34) , "", "runas" >>xxxxxxxxxx0931092.vbs
wscript "xxxxxxxxxx0931092.vbs" 
timeout 2 
del xxxxxxxxxx0931092.vbs
del temps23210948.bat
goto begin
:static
:no_good
if defined ipis for /f "tokens=3" %%i in ("%ipis%") do echo|set/p=%%i|clip
if defined ipis echo.IP Copied! You can use Paste
set /p ip=Enter IP ****
echo %ip%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&&echo.Got it! || echo.no_good&&goto no_good
:no_t
if defined gateis for /f "tokens=3" %%i in ("%gateis%") do echo|set/p=%%i|clip
if defined gateis echo.Gateway Copied! You can use Paste
set /p gate=Enter gate IP address **
echo %gate%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&&echo.Got it! || echo.no_good&&goto no_t
:not_really
if defined subnetis for /f "tokens=5 delims=() " %%i in ("%subnetis%") do echo|set/p=%%i|clip
if defined subnetis echo.Subnet Copied! You can use Paste
set /p subnet=Enter subnet ***
echo %subnet%| findstr /r "^[0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*[.][0-9][0-9]*$"&&echo.Got it! || echo.no_good&&goto not_really
:doit
echo.Done!
echo.Setting in motion..&timeout 1 >NUL&echo|set /p=Running as Administrative priveleges...

echo mode 80,7 ^&color %colors%^&echo off^&title Running Command..^& cls ^& echo.netsh interface ipv4 set address name=%selectedi% static %ip% %subnet% %gate% > temps23210948.bat
echo.netsh -c interface ipv4 set address name=%selectedi% static %ip% %subnet% %gate%  >> temps23210948.bat
echo.echo Errorlevel=%errorlevel% >> temps23210948.bat
echo.PAUSE >> temps23210948.bat

if exist temps23210948.bat for /f "tokens=*" %%i in ('dir /s /b .\temps23210948.bat') do set file_nameis=%%i

echo Set objShell = CreateObject("Shell.Application") >xxxxxxxxxx0931092.vbs
echo Set FSO = CreateObject("Scripting.FileSystemObject") >>xxxxxxxxxx0931092.vbs 
echo objShell.ShellExecute "cmd", "/c " ^& Chr(34) ^& "%file_nameis%" ^& Chr(34) , "", "runas" >>xxxxxxxxxx0931092.vbs 



wscript "xxxxxxxxxx0931092.vbs"





timeout 2

del xxxxxxxxxx0931092.vbs
del temps23210948.bat
goto begin
