Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%
call "EasyLensMotorCmd.exe" /inputfile:"focus.in"  /outputFile:"focus.out"  

call "EasyLensMotorCmd.bat"

if not "%Status%"=="0"  exit %status%
lvreg.exe eeprom write 0x64 %VarResultSummary%
lvreg.exe eeprom read 0x64 >tmpFile
set /p val2= < tmpFile
del tmpFile
if not "%VarResultSummary%"=="%val2%"  exit 3

exit %status%
