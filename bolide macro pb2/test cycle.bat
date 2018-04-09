rem generate 1K sine wave
AudioGenConsoleApp.exe -Outputfile AudioGen1K.txt -PCMfileOut Sinewave1K.wav -freq 1000 -samfreq 16000 -amp 0.5 -bps 16 -size 32000
rem 
rem 10 seconds delay
rem ping 127.0.0.1 -w 10000 -n 1 > nul
rem 
rem play and record
AudioCapConsoleApp.exe -OutputFile AudioCap1K.txt -recdev "USB Audio Device",0x046d,0x0821 -samfreq 16000 -bps 16 -channels 2 -playdev "Default DirectSound Device" -soundsource "Sinewave1K.wav" -wait 500 -size 16000 -PCMFileOut Recorded1K.wav -recvol 0.8 -playvol 0
rem 
rem 10 seconds delay
rem ping 127.0.0.1 -w 10000 -n 1 > nul
rem 
rem do statistics
AudioCalcConsoleApp.exe -OutputFile AudioCalc1K.txt -PCMFileIn Recorded1K.wav -freq 1000 -TestLimitFile 1000Hzlimit.txt -DataLogFile Recorded1K.csv
rem 10 seconds delay
rem ping 127.0.0.1 -w 10000 -n 1 > nul
rem 
rem go through digital filter
AudiofilterConsoleApp.exe -OutputFile AudioFilter1K.txt -PCMFileIn Recorded1K.wav -loCut 500 -hiCut 1500
rem 
rem 10 seconds delay
rem ping 127.0.0.1 -w 10000 -n 1 > nul
rem 
rem do statistics
AudioCalcConsoleApp.exe -OutputFile AudioCalc1K_filtered.txt -PCMFileIn Recorded1K_filtered.wav -freq 1000 -TestLimitFile 1000Hzlimit.txt -DataLogFile Recorded1K_filtered.csv
rem 
rem 10 seconds delay
rem ping 127.0.0.1 -w 10000 -n 1 > nul
rem  
rem generate 2K sine wave
AudioGenConsoleApp.exe -Outputfile AudioGen2K.txt -PCMfileOut Sinewave2K.wav -freq 2000 -samfreq 16000 -amp 0.5 -bps 16 -size 32000
rem 
rem 10 seconds delay
rem ping 127.0.0.1 -w 10000 -n 1 > nul
rem 
rem play and record
AudioCapConsoleApp.exe -OutputFile AudioCap2K.txt -recdev "USB Audio Device",0x046d,0x0821 -samfreq 16000 -bps 16 -channels 2 -playdev "Default DirectSound Device" -soundsource "Sinewave2K.wav" -wait 500 -size 16000 -PCMFileOut Recorded2K.wav -recvol 0.8 -playvol 0
rem 
rem 10 seconds delay
rem ping 127.0.0.1 -w 10000 -n 1 > nul
rem 
rem do statistics
AudioCalcConsoleApp.exe -OutputFile AudioCalc2K.txt -PCMFileIn Recorded2K.wav -freq 2000 -TestLimitFile 2000Hzlimit.txt -DataLogFile Recorded2K.csv
rem 
rem 10 seconds delay
ping 127.0.0.1 -w 10000 -n 1 > nul
rem 
rem go through digital filter
AudioFilterConsoleApp.exe -OutputFile AudioFilter2K.txt -PCMFileIn Recorded2K.wav -loCut 1500 -hiCut 2500
rem 
rem 10 seconds delay
ping 127.0.0.1 -w 10000 -n 1 > nul
rem 
rem do statistics
AudioCalcConsoleApp.exe -OutputFile AudioCalc2K_filtered.txt -PCMFileIn Recorded2K_filtered.wav -freq 2000 -TestLimitFile 2000Hzlimit.txt -DataLogFile Recorded2K_filtered.csv
pause
