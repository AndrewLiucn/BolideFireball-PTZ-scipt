rem @echo off 
set PATH=PATH;%~dp0;"C:\Program Files\Kinetic\kinetic"
rem This batch is to run on test station %1 and insert at the top of Kinetic script
rem 
lvreg testxu write a 8
rem TestTrackingConsoleApp 
rem -config "bolide\bolide.ini" 
rem -onStartOfTestCycle %1
rem 
lvreg testxu write a 8
lvreg testxu write a 8
klogsend.exe TEST1
TestTrackingConsoleApp -config "bolide\bolide.ini" -onStartOfTestCycle 3
rem pause
SET TestSuccess=%errorlevel%
rem pause
klogsend.exe TEST2 %errorlevel%
rem 
if %TestSuccess% equ 0 ( klogsend.exe Success. )

if %TestSuccess% equ 1 ( klogsend.exe Enumeration issue. )

if %TestSuccess% equ 2 ( klogsend.exe Error R/W device. )

if %TestSuccess% equ 3 ( klogsend.exe Invalid arguments due to parsing error or invalid config file content.)

if %TestSuccess% equ 4 ( klogsend.exe Error writing test log file. )

if %TestSuccess% equ 5 ( klogsend.exe Test log is full. )

if %TestSuccess% equ 6 ( klogsend.exe Test nodes or test stations exceed range. )

if %TestSuccess% equ 7 ( klogsend.exe Software not initialized before use. )

if %TestSuccess% equ 8 ( klogsend.exe Undefined error.)

rem EQU: equal
rem NEQ: not equal
rem LSS: less than
rem LEQ: less than or equal
rem GTR: greater than
rem GEQ: greater than or equal
if %TestSuccess% geq 127 ( klogsend error level %TestSuccess% )

if %TestSuccess% equ 65 ( klogsend.exe "error .............station has been skipped............. error" )


exit %TestSuccess%
