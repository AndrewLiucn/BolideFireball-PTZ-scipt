@echo off
set status =1

Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

rem call "UltimateScpiCmd.exe" /option:send /scpicmd="current 2.0" /COMPort:1 /avoidreturn:true
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 5.2;output:state on" /COMPort:1 /avoidreturn:true

rem ksleep 100
call "UltimateScpiCmd.exe" /inputfile:"HP6612Com1I_5V2.in" /outputfile:"HP6612Com1I_5V2.out"
call "UltimateScpiCmd.bat"
rem pause

rem =====================================
if "%Status%"=="0" exit 0  
satrt HP6612Com1_0V.bat
exit 1

