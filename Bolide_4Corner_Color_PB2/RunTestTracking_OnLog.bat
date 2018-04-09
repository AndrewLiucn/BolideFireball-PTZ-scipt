@echo off
setlocal

rem core session
set fname=%~n0.txt
set STARTTIME=%TIME%
rem 
rem pull up test tracking info from a bolide and save it to bolide.log
rem TestTrackingConsoleApp 
rem -config "bolide\bolide.ini" 
rem -onFileOfHistory "bolide.log"
rem 
TestTrackingConsoleApp -config "bolide\bolide.ini" -onFileOfHistory "bolide.log"
ping 1.1.1.1 -n 1 -w 50 > nul
set ENDTIME=%TIME%

rem output as time
echo STARTTIME: %STARTTIME% >> %fname%
echo ENDTIME: %ENDTIME% >> %fname%

rem convert STARTTIME and ENDTIME to centiseconds
set /A STARTTIME=(1%STARTTIME:~0,2%-100)*360000 + (1%STARTTIME:~3,2%-100)*6000 + (1%STARTTIME:~6,2%-100)*100 + (1%STARTTIME:~9,2%-100)
set /A ENDTIME=(1%ENDTIME:~0,2%-100)*360000 + (1%ENDTIME:~3,2%-100)*6000 + (1%ENDTIME:~6,2%-100)*100 + (1%ENDTIME:~9,2%-100)

rem calculating the duratyion is easy
set /A DURATION=%ENDTIME%-%STARTTIME%

rem we might have measured the time inbetween days
if %ENDTIME% LSS %STARTTIME% set set /A DURATION=%STARTTIME%-%ENDTIME%

rem now break the centiseconds down to hors, minutes, seconds and the remaining centiseconds
set /A DURATIONH=%DURATION% / 360000
set /A DURATIONM=(%DURATION% - %DURATIONH%*360000) / 6000
set /A DURATIONS=(%DURATION% - %DURATIONH%*360000 - %DURATIONM%*6000) / 100
set /A DURATIONHS=(%DURATION% - %DURATIONH%*360000 - %DURATIONM%*6000 - %DURATIONS%*100)

rem some formatting
if %DURATIONH% LSS 10 set DURATIONH=0%DURATIONH%
if %DURATIONM% LSS 10 set DURATIONM=0%DURATIONM%
if %DURATIONS% LSS 10 set DURATIONS=0%DURATIONS%
if %DURATIONHS% LSS 10 set DURATIONHS=0%DURATIONHS%

rem outputing
echo STARTTIME: %STARTTIME% centiseconds >> %fname%
echo ENDTIME: %ENDTIME% centiseconds >> %fname%
echo DURATION: %DURATION% in centiseconds >> %fname%
echo %DURATIONH%:%DURATIONM%:%DURATIONS%,%DURATIONHS% >> %fname%

endlocal
@echo on


