@echo off

Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="current 2.0" /COMPort:8 /avoidreturn:true
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 0;output:state on" /COMPort:8 /avoidreturn:true


rem pause

exit 0
