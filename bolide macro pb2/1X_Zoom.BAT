@echo on 
rem This script will save the mtf steps to eeprom
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%

lvreg.exe eeprom write 5a 0
lvreg.exe eeprom write 5b 0
lvreg.exe eeprom write 5c 64
lvreg.exe eeprom write 5d 0

exit 0