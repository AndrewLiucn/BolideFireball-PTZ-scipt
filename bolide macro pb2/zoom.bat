Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%
call "EasyLensMotorCmd.exe" /inputfile:"Zoom.in"  /outputFile:"zoom.out"  

call "EasyLensMotorCmd.bat"


if not "%Status%"=="0"  exit %status%
lvreg.exe eeprom write 0x65 %VarResultSummary%
lvreg.exe eeprom read 0x65 >tmpFile2
set /p val2= < tmpFile2
del tmpFile2
Echo val2=%val2%
if not "%VarResultSummary%"=="%val2%"  exit 3
exit %status%
