@echo on 
rem This script will save the mtf steps to eeprom
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set LvregPath="c:\Program Files\Kinetic\Kinetic\"
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;%LvregPath%

lvreg.exe testxu write a 8
lvreg.exe eeprom write ee 0
lvreg.exe eeprom write ef 0
lvreg.exe eeprom write f0 64
lvreg.exe eeprom write f1 0

exit 0