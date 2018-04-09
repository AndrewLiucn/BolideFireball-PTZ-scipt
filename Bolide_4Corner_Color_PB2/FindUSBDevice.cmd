@ECHO off
rem Eduardo Arreola - Sr.Software Engineer IV -earreola@logitech.com
rem example
rem USB\VID_413C&PID_8197\2016D8912342 
ECHO.
rem %1 is PID 
rem %2 is VID 
SET VID=%1
SET PID=%2
IF [%1]==[] GOTO Syntax
SETLOCAL
devcon find "@USB\VID_%VID%&PID_%PID%\*" | findstr /I /B /C:"1 matching device(s) found."
if %errorlevel% == 0 (
    echo usb device found
) else (
    echo usb device not found
)
ENDLOCAL
GOTO:End

:Syntax
ECHO FindUSBDevice.bat,  Version 1.00 for Windows 7
ECHO This is a batch that checks for a usb device
ECHO.
ECHO Usage:  CheckUSB device
ECHO.
ECHO Written by Eduardo Arreola
ECHO earreola@logitech.com
:End
exit /b %errorlevel%