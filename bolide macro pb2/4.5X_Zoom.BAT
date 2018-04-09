@echo on 
rem This script will save the mtf steps to eeprom
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%

lvreg.exe eeprom write 5a 25
lvreg.exe eeprom write 5b 9
lvreg.exe eeprom write 5c c1
lvreg.exe eeprom write 5d 1

exit 0