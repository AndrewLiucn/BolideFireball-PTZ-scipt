@echo on

rem exit 0
rem set oldname=RecordedWide10s.wav
AudioCapConsoleApp.exe -OutputFile teststatus_AudioCapWide10s.txt -recdev "(Umik-1  Gain: 12dB ",0x2757,0x0007 -samfreq 16000 -bps 16 -channels 2 -size 80000 -PCMFileOut RecordedWide10s.wav -recvol 0.5 -slave

rem Set FileFolderDate=MOTOR_%time:~0,2%%time:~3,2%%time:~6,2%_%date:~-10,2%%date:~-7,2%%date:~-4,4%
rem del "%oldname%"
exit 0
