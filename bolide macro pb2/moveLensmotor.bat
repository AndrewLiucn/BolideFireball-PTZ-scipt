Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%

call "EasyLensMotorCmd.exe" /option:movemotor /movingsteps:1000

rem exit %Status%
