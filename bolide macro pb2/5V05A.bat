Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state on"
call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 5"
call "UltimateScpiCmd.exe" /option:send /scpicmd="current 0.5" 


exit %Status%
