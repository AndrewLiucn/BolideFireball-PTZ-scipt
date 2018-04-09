set fileVar=serialnum.txt

lvreg eeprom read c8>serialnum.txt
lvreg eeprom read c9>>serialnum.txt
lvreg eeprom read ca>>serialnum.txt
lvreg eeprom read cb>>serialnum.txt

set /p serialnum=<%fileVar%

ksleep 500

tdebt_123.exe -s serialnumber %serialnum%