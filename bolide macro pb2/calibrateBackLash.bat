@setlocal enableextensions enabledelayedexpansion
@echo off
rem Script Title : Backlash Correction Script. 
rem Script Version Number: 1.0
rem Script Edited By: Edward Arreola earreola@logitech.com , Andrew Liu - aliu8@logitech.com
rem Kinetic Version: 
rem Station Name: Backlash Test Station.
rem Date: 12/26/2015

del date.txt
date /T>>date.txt
set /p dateVar=<date.txt
echo. 
set char_threshold=5
for /f %%i in ('time /T') do set datetime=%%i
echo The local Time is[%dateVar% %datetime%]

set FirmwareVersionVal=0301
echo. 
echo \\Backlash Correction Test\\
echo. 


rem check PROTECTION FLAG ///////////////////////////////////////////
echo check protection flag. 
for /f %%i in ('lvreg eeprom read 0x6e') do set testxu_tde_mode=%%i
set var_tde=%testxu_tde_mode%
set var_tde=%var_tde:~2%
echo protection value [%var_tde%]
set procflag=%var_tde%


if "%var_tde%"== "88" (
echo not ok to correct - protection applied.'
goto END
)else (
echo ok to correct
)


rem check fw version ///////////////////////////////////////////
echo Checking Firmware Version. 
for /f %%i in ('lvreg infoxu read 0x03') do set testxu_tde_mode=%%i
set var_tde=%testxu_tde_mode%
set var_tde=%var_tde:~2%
echo firmware version value is: [%var_tde%]
if "%var_tde%"== "%FirmwareVersionVal%" (
echo correct
)else (
echo wrong firmware version.'
goto END
)


echo.
rem check fw version ///////////////////////////////////////////


rem set TDE mode /////////////////////////////////////////////////////
lvreg testxu write 0x0a 0x08
for /f %%i in ('lvreg testxu read 0x0a') do set testxu_tde_mode=%%i
set var_tde=%testxu_tde_mode%
set var_tde=%var_tde:~3%
echo lvreg tdemode value is: [%var_tde%]
if "%var_tde%"== "8" (
echo tde mode set.
) else (
echo tde mode set.
)

rem calibration backlash for focus. //////////////////////////////
echo. 
rem //read the calibration backlash for focus.
for /f %%i in ('lvreg eeprom read 0x64') do set eeprom64Read=%%i
set var_temp1=%eeprom64Read%
set var_temp1=%var_temp1:~3%
echo focus backlash value is: [%var_temp1%]
set backlash_valx=%var_temp1%
echo.
rem calibration backlash for focus. //////////////////////////////
set thesetValue=0
echo //Backlash Max Protection////////////
if %var_temp1% GEQ %char_threshold% (
echo Backlash is not spec [NOT OK]
echo - Device backlash [%var_temp1%] is greater than or equal to upper limit [%char_threshold%]
goto SETCALIBRATE
) else (
echo Backlash result is [OK]
echo Backlash [%var_temp1%] is less than [%char_threshold%]
echo  NORMAL BACKLASH IS IN SPEC.
echo - Device is OK
goto SETCALIBRATE_OK
echo.
)
echo //Backlash Max Protection////////////

:SETCALIBRATE_OK
echo calibrate ok 
set thesetValue=%var_temp1%

goto CALIBRATE_PROC


:SETCALIBRATE
set thesetValue=5



:CALIBRATE_PROC
echo calibrate value is: %thesetValue%



rem //read the home position value/////////////////////////////
for /f %%i in ('lvreg eeprom read 0x66') do set eeprom66Read=%%i
set var_temp2=%eeprom66Read%
set var_temp2=%var_temp2:~2%
echo home position value is: [%var_temp2%]
for /f %%i in ('hex2int %var_temp2%') do set hxval=%%i
set var_hxval=%hxval%
set var_hxval=%var_hxval%
echo home c value is: [%var_hxval%]
set homepos_x=%var_hxval%
rem //read the home position value/////////////////////////////



rem //record final step values///////////////////////////////
set var_temp3=-%thesetValue%
echo f-backlash: %var_temp3%
set /a v1 =%var_hxval% -256
echo home cal value: %v1%
set /a v2 =%var_temp3% +v1
echo final home cal value: %v2%
echo  i: [%v2%]
for /f %%i in ('int2hex %v2%') do set ihx=%%i
set var_ihx=%ihx%
set var_ihx=%var_ihx:~6%
echo  value to eeprom: [%var_ihx%]
set final_Step_val=%var_ihx%


rem=================== safety
lvreg eeprom write 0x66 0x%var_ihx%
ksleep 500
lvreg eeprom write 0x66 0x%var_ihx%
ksleep 500
lvreg eeprom write 0x66 0x%var_ihx%
ksleep 500
rem===================

rem=================== apply protection 
lvreg eeprom write 0x6e 0x88
ksleep 500
lvreg eeprom write 0x6e 0x88
ksleep 500
lvreg eeprom write 0x6e 0x88
ksleep 500

rem //record final step values///////////////////////////////

rem //read the home position value/////////////////////////////
echo.
echo verifying ---------------------------------------------------
echo reading back from eeprom
for /f %%i in ('lvreg eeprom read 0x66') do set readsec=%%i
set var_temp6=%readsec%
set var_temp6=%var_temp6:~2%
echo home position value is: [%var_temp6%]
for /f %%i in ('hex2int %var_temp6%') do set hxval=%%i
set var_hxval=%hxval%
set var_hxval=%var_hxval%
echo final home c value is: [%var_hxval%]
set final_verifyVal=%var_hxval%
rem //read the home position value/////////////////////////////



rem //logfile///////////////////////////////
set /p serialnumber=<"C:\tstPlan\PLEASE ENTER TITLE.txt"
set /p seqnum=<"C:\tstPlan\seqNum.txt"


for /f %%i in ('hex2int %final_Step_val%') do set ihx_va3=%%i
echo  final value to eeprom: %final_Step_val% [%ihx_va3%]

echo %datetime%_%dateVar%,%seqnum%,%serialnumber%,%procflag%,%FirmwareVersionVal%,%backlash_valx%,%homepos_x%,%final_verifyVal%>>log.csv

:END
echo done.
ksleep 5000
exit %errorlevel%

endlocal