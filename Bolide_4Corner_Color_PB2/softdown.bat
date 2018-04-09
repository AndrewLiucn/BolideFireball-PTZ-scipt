unodriver p5l
echo Wscript.Sleep WScript.Arguments(0) >%tmp%\delay.vbs
rem echo %time%
cscript //b //nologo %tmp%\delay.vbs 450
rem echo %time%
unodriver p5h
echo Wscript.Sleep WScript.Arguments(0) >%tmp%\delay.vbs
rem echo %time%
cscript //b //nologo %tmp%\delay.vbs 200
rem echo %time%
unodriver p5l