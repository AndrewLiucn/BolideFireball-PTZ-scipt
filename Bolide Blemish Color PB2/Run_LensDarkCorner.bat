rem @echo off 
rem //////////////////////////////////VARIBLES//////////////////////////////////////
rem both %CD% and %~dp0 contain current directory of the batch file.
rem however, %CD% might change, such as CD command.
rem %~dp0 does not change, obtained from %0 which is the batch filename.
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%;"C:\Program Files\Kinetic\kinetic\";"C:\Windows\System32\"

Set dirPath=%CD%
set outputFile=testStatus_DarkCorner.txt
set STATUS=
set RETURNCODE=
set MESSAGE=
set LOGFILE=
set INIFILE="%~dp0%outputFile%"

:START_ACTIONS
echo //////////////////////////////////////////////////////////////////// START OF SCRIPT  

:ACTIONS
echo //////////////////////////////////////////////////////////////////// ACTIONS     
LensShadingEvalConsoleApp -BMPFileIn "C:\tstplan\SSD\Dust_180.bmp" -TestLimits "%~dp0testlimit_DarkCorner.txt" -OutputFile "%~dp0testStatus_DarkCorner.txt" -LogFile "%~dp0UniformityLog.txt" -CenterDim 300x300 -SideDim 200x200 -EdgeOutliers 360,10,360,10 -slave 
rem ping 1.1.1.1 -n 1 -w 100 > nul
rem pause
rem call replacedark.bat
set /p SEQNUM=<C:\tstplan\seqnum.txt

if exist "C:\tstplan\SerialNum.txt" ( 
set /p SNO=<C:\tstplan\SerialNum.txt
) 


set BKDIR=%~dp0%SNO%backup\%SEQNUM%


rem 
if not exist "%BKDIR%" mkdir "%BKDIR%" 
copy "c:\tstplan\SSD\Dust_180.bmp" "%BKDIR%"
copy "%~dp0UniformityLog.txt" "%BKDIR%\UniformityLog.csv"
copy "%~dp0testStatus_DarkCorner.txt" "%BKDIR%\testStatus_DarkCorner.csv"



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

rem ======= Henry Remark below =================================== 
rem =========lorry remark again==================================================
rem create directory and store files there
rem use sequence number to name subfolder

rem ===========================================================

exit %STATUS%
rem END

:getvalue
FOR /F "eol=; eol=[ tokens=1,2* delims==" %%i in ('findstr /b /l /i %~2= %1') DO set %~4=%%~j
goto:eof

:PASS_MSG
echo //////////////////////////////////////////////////////lens darkcorner TEST PASSED //////////////////////////////////////////////////////
goto:eof

:FAIL_MSG
echo //////////////////////////////////////////////////////lens darkcorner TEST FAILED //////////////////////////////////////////////////////
goto:eof
rem //////////////////////////////////OUTPUT HANDLER//////////////////////////////////////
 
rem //////////////////////////////////END OF SCRIPT//////////////////////////////////////
