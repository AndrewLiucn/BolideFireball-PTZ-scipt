@echo off 
rem set userName=tsoperator
rem Cleaned by Edward Arreola in 2017,Jan11
rem Used in Merdian Build PB1. 
rem Blemish Test Dust Analysis
rem both %CD% and %~dp0 contain current directory of the batch file.
rem however, %CD% might change, such as CD command.
rem %~dp0 does not change, obtained from %0 which is the batch filename.
Set dirPath=%CD%
set outputFile=teststatus_sensordust.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"
set IMAGE_TARGET="C:\tstPlan\SSD\Dust_180.bmp"

REM SET STATUS=%errorlevel%
:START_ACTIONS


:ACTIONS
rem 
REM SensorPckgDPDConsoleApp 
REM -BMPFileIn "Dust_180.BMP" 
REM -TestSettings "testconfig_sensordust.txt" 
REM -TestLimits "testlimit_sensordust.txt" 
REM -OutputFile "teststatus_sensordust.txt" 
REM -LogFile "datalog_sensordust.txt" 
REM -slave 
rem 
rem copy "C:\tstPlan\SSD\Dust_180.bmp" "C:\tstPlan\SSD\Dust_1801.BMP"
SensorPckgDPDConsoleApp -BMPFileIn %IMAGE_TARGET% -TestSettings "%~dp0/testconfig_sensordust.txt" -TestLimits "%~dp0/testlimit_sensordust.txt" -OutputFile "%~dp0/teststatus_sensordust.txt" -LogFile "%~dp0/datalog_sensordust.txt" -slave
set /p SEQNUM=<C:\tstplan\seqnum.txt
set /p SNO=<C:\tstplan\SerialNum.txt
set BKDIR=%~dp0%SEQNUM%
rem 
if not exist "backup" mkdir "backup" 
if not exist "%BKDIR%" mkdir "%BKDIR%" 
copy "C:\tstPlan\SSD\Dust_180.BMP" "%BKDIR%\Dust_180.BMP"


copy "%~dp0teststatus_sensordust.txt" "%BKDIR%\teststatus_sensordust.csv"
COPY "%~dp0datalog_sensordust.txt" "%BKDIR%\datalog_sensordust.csv"
copy "%~dp0pkgdfects.bmp" "%BKDIR%\pkgdfects.bmp"

:END_ACTIONS

:OUTPUT_HANDLER
rem now collect and process the results 
call:getvalue %INIFILE% "Status" "" STATUS
call:getvalue %INIFILE% "ReturnCode" "" RETURNCODE
call:getvalue %INIFILE% "Message" "" MESSAGE
call:getvalue %INIFILE% "LogFile" "" LOGFILE
echo status: %STATUS%
echo ReturnCode: %RETURNCODE%
echo Message: %MESSAGE%
echo LogFile: %LOGFILE%
echo RETURN IS: %STATUS%

IF (%STATUS%)==(0) call:PASS_MSG
rem 
IF (%STATUS%)==(1) call:FAIL_MSG
rem

rem ===========================================================
rem create directory and store files there
rem use sequence number to name subfolder

rem ===========================================================

exit %STATUS%
rem END

:getvalue
FOR /F "eol=; eol=[ tokens=1,2* delims==" %%i in ('findstr /b /l /i %~2= %1') DO set %~4=%%~j
goto:eof

:PASS_MSG
echo //////////// TEST PASSED
goto:eof

:FAIL_MSG
echo //////////// TEST FAILED
goto:eof

