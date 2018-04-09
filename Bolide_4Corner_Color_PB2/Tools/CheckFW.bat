@echo OFF
Set EasyAVRuntimeEnginePath=c:\Program Files\Common Files\Logitech\EasyAVRuntimeEngine\
Set PATH=%PATH%;%EasyAVRuntimeEnginePath%



set status=0
set PMTT_fileVar=%FWVer.txt


lvreg.exe infoxu read 01 >%PMTT_fileVar%
ksleep 500

set /p FWVer=<%PMTT_fileVar%
set Str=%FWVer:~13,7%


rem ====================================================================================================
rem   wifimac.txt, wifimac.in are hard coded in TDEBT-Analyzer.exe, DO NOT change their file names !!!
rem   command "call status.bat" is necessary for storing Sno in csv file
rem   VC2005/vcredist_x86.exe needed to be executed for needed VC libraies for TDEBT-Analyzer.exe
rem
rem   Not able to compare String !!!
rem ====================================================================================================
Del wifimac.txt
Del wifimac.in
EchO %Str% >wifimac.txt
rem COPY FWver.txt wifimac.txt
COPY FWVer.in wifimac.in
TDEBT-Analyzer.exe wifimac.in wifimac.txt
COPY wifimac.out FWVer.out

call status.bat

exit %status%