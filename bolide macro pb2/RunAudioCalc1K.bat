@echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
rem set userName=tsoperator
set userName=tsoperator
Set dirPath=C:\Users\%userName%\Desktop\COMBINED_UTESTS
set outputFile=teststatus_AudioCalc1K.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"

rem del log.csv
rem del NiSignalAnalysis.csv
rem del TempAudioMicLeft_151_L.csv
rem del TempAudioMicLeft_151_R.csv
rem del output.out

:START_ACTIONS
echo //////////////////////////////////////////////////////////////////// START OF SCRIPT  

:ACTIONS
echo //////////////////////////////////////////////////////////////////// ACTIONS               
AudioCalcConsoleApp.exe -OutputFile teststatus_AudioCalcTele.txt -PCMFileIn RecordedTele1K10s.wav -freq 300 -windowSize 80000 -TestLimits testlimit_ZoomLensMotorNoise.txt -LogFile datalog_RecordedTele1K10s.csv -slave

:END_ACTIONS
echo ////////////////////////////////////////////////////////////////////  END_ACTIONS   

rem //////////////////////////////////////////////////////////////////// OUTPUT HANDLER
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
exit %STATUS%
rem END

:getvalue
FOR /F "eol=; eol=[ tokens=1,2* delims==" %%i in ('findstr /b /l /i %~2= %1') DO set %~4=%%~j
goto:eof

:PASS_MSG
echo ////////////////////////////////////////////////////// TEST PASSED //////////////////////////////////////////////////////
goto:eof

:FAIL_MSG
echo ////////////////////////////////////////////////////// TEST FAILED //////////////////////////////////////////////////////
goto:eof
rem //////////////////////////////////OUTPUT HANDLER//////////////////////////////////////
 
rem //////////////////////////////////END OF SCRIPT//////////////////////////////////////



