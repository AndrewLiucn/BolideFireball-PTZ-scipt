Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%


call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state off"

exit %Status%
