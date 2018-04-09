@echo OFF
set status=0

rem ====================================================================================================
rem  DOS command %DATE% --> "31/01/2015 ", with a Blank at the end 
rem  DOS coomad %Time% ---> "TUE16:23:22:27"
rem  DOS command %Date%%Time% --> "07/24/2015 TUE16:23:22:27" --> Lenovo Laptop Format
rem  DOS command %Date%%Time% --> "TUE 31/01/201516:23:22:27" --> Production Line Dell Desktop Format
rem  
rem  Babylon USB UID Address: 0x1B  0x1C  0x1C 0x1D, 4Bytes
rem  
rem  Data Structure needed:  0x1B: Year(Last Digit, Bit7-Bit4) + Month (HEX, Bit3-Bit 0)
rem                          0x1C: Date, Digit
rem                          0x1D: Hour, Digit
rem                          0x1F: Seq_num sotred under C:/Test, least 2 digits, 
rem  where XX is for the Test Flow Test Tracking, following characters are for serial number tracking  
rem ====================================================================================================



rem =================================================
rem ====  Go test mode for EEPROM access  ===========
rem =================================================

set m1=m1
set m3=m3
set m5=m5
set m7=m7

 if exist "%m1%" (
del %m1%
)
 if exist "%m3%" (
del %m3%
)
 if exist "%m5%" (
del %m5%
)
 if exist "%m7%" (
del %m7%
)


lvreg testxu write A 8
lvreg eeprom read B >%m1%
lvreg eeprom read c >%m3%
lvreg eeprom read D >%m5%
lvreg eeprom read E >%m7%



set /p rm1=<%m1%
set /p rm3=<%m3%
set /p rm5=<%m5%
set /p rm7=<%m7%



del wifimac.txt
echo %rm1:~2,2%%rm3:~2,2%%rm5:~2,2%%rm7:~2,2% >wifimac.txt


rem ====================================================================================================
rem   wifimac.txt, wifimac.in are hard coded in TDEBT-Analyzer.exe, DO NOT change their file names !!!
rem   
rem ====================================================================================================

COPY UDIChk.in wifimac.in 
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out UIDchk.out

call status.bat

exit %status%


