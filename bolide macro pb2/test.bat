Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%
call "EasyLensMotorCmd.exe" /inputfile:"EasyLensMotorCmd.in"  /outputFile:"EasyLensMotorCmd.out"  
call "EasyLensMotorCmd.bat"
rem Set Value=6
if not "%Status%"=="0"  exit %status%
lvreg.exe eeprom write 0x05 %value%
lvreg.exe eeprom read 0x05 >tmpFile
set /p val2= < tmpFile
del tmpFile
Echo val2=%val2%
if not "%value%"=="%val2%"  exit 3
exit %status%


