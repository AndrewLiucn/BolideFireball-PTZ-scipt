@ECHO off

if exist "f.txt" ( 
DEL f.txt
) 

SETLOCAL
usbview.exe /q /f /saveall:f.txt

findstr /I /E /C:"Current Config Value:              0x01  -> Device Bus Speed: High" f.txt

if %errorlevel% == 0 (
findstr /I /E /C:"idProduct:                       0x0881" f.txt
    echo usb3.0 device found
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

:End
ECHO DATA=%errorlevel%

exit /b %errorlevel%




