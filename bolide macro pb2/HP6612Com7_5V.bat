@echo off
set status=1
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="current 2" /COMPort:1 /avoidreturn:true
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 5;output:state on" /COMPort:1 /avoidreturn:true


rem call "UltimateScpiCmd.exe" /inputfile:"HP6612_12V.in" /outputfile:"HP6612_12V.out"

call "UltimateScpiCmd.bat"
rem pause
if not "%Status%"=="0"  call AllPowerOff.bat

exit %Status%
