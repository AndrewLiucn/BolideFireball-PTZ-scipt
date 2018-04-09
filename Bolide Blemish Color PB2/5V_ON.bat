rem Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;"C:\Program Files\Kinetic\kinetic\"
RS232V6_line.exe COM1 "VOLT 5;CURR 1.5"
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="output:state On"
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="voltage 5"
rem call "UltimateScpiCmd.exe" /option:send /scpicmd="current 2"

del C:\tstPlan\SSD\BayerFrameCOLD.bmp
exit %Status%
