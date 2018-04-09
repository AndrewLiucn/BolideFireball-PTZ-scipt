@echo off
rem Status=1 == FAIL
Set Status = 1
SET PATH=%PATH%;
SET LOCALPATH=%~dp0
SET LOCALDIR=%~d0
setlocal EnableDelayedExpansion
echo [%LOCALPATH%]

Set Status=%errorlevel%

if exist "bolide.txt" (
del bolide.txt
)
rem exit %Status%
if exist "bolide.log" (
copy "bolide.log" "testtracking.log"
rename "bolide.log" "bolide.txt"
)
if exist "sn.txt" (
del sn.txt
)
if exist "sn.out" (
del sn.out
)

rem for /F "skip=4 delims=," %i in ("%LOCALPATH%"bolide.txt) Do set /p xprvar= <bolide.txt

rem echo %xprvar%
  
set "xprvar="
for /F "skip=5 delims=" %%i in (bolide.txt) do if not defined xprvar set "xprvar=%%i"   
echo %xprvar%
rem set /p var="%xprvar%"
set var=%xprvar:~13%

echo [outputs]>>sn.txt
echo Status^=0>>sn.txt
echo ReturnCode^=0>>sn.txt
echo Message^=Ok!>>sn.txt
echo Headers^=sn>>sn.txt
echo Values=%var%>>sn.txt
echo LowLimit^=1>>sn.txt
echo UpLimit^=1 >>sn.txt
rem echo Values=>>pan.in
rem echo LogFile=test.log>>pan.in
rem echo VarResultSummary^=>>pan.in

rename sn.txt sn.out
rem pause

rem for /F "tokens=1 delims==," %%G IN (%xprvar%) DO set serout=<%%G
rem set serout
rem echo sr:%serout%

rem set /p SnVer=<%var%
rem set Str=%SnVer%


rem Del wifimac.txt
rem Del wifimac.in
rem Echo %Str% >wifimac.txt
rem COPY FWver.txt wifimac.txt
rem COPY sn.in wifimac.in
rem TDEBT-Analyzer.exe wifimac.in wifimac.txt
rem COPY wifimac.out sn.out

rem call status.bat
rem echo %status%
exit %status%



rem set /p btresultvalues=<"%LOCALPATH%\m.txt"
rem echo %btresultvalues%
