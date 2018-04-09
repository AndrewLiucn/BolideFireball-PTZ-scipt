rem Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
rem Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;"C:\Program Files\Kinetic\kinetic\"
RS232V6_line.exe COM1 "VOLT 0;CURR 0"
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state OFF"
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 0"
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="current 2" 
exit %Status%
