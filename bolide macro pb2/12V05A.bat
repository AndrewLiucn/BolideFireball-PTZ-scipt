Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on"
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 12"
call "UltimateScpiCmd.exe" /option:send /scpicmd="current 0.8" 

rem timeout /t 1
rem call "UltimateScpiCmd.exe" /inputfile:"UltimateScpiCmd.in"
rem call "UltimateScpiCmd.bat"


exit %Status%
