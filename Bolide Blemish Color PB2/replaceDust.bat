@echo on

echo ***** Replace "Value" as "Values" *****
set strOld=Headers
set strNew=Header

setlocal enabledelayedexpansion

for /f "tokens=*" %%i in ('dir teststatus_sensordust.txt /b') do (
    set "var=%%i"
    if not !var!.==. (
    for /f "tokens=*" %%j in (!var!) do (
        set "tmp=%%j"
        if not !tmp!.==. (
          set "tmp=!tmp:%strOld%=%strNew%!"
          echo !tmp!>>temp.txt
        )
    )
     move temp.txt !var!
    )
)

