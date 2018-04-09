rem 
rem 5B3 sensor holes detection
rem 
rem SensorBlemishDetectConsoleApp.exe 
rem -OutputFile teststatus_5b3sensorholes.txt 
rem -LogFile datalog_5b3sensorholes.txt 
rem -TestLimits testlimit_5b3sensorholes.txt 
rem -TestSettings testconfig_5b3sensorholes.txt 
rem -BMPFileIn 5B3_Bayer_Holes_NDPC.bmp 
rem -debug
SensorBlemishDetectConsoleApp.exe -OutputFile teststatus_5b3sensorholes.txt -LogFile datalog_5b3sensorholes.txt -TestLimits testlimit_5b3sensorholes.txt -TestSettings testconfig_5b3sensorholes.txt -BMPFileIn 5B3_Bayer_Holes_NDPC.bmp -debug
mkdir 5B3-holes
move teststatus_5b3sensorholes.txt .\5B3-holes\
move datalog_5b3sensorholes.txt .\5B3-holes\
move *.csv .\5B3-holes\
rem 
rem 5B3 sensor stars detection
rem 
rem SensorBlemishDetectConsoleApp.exe 
rem -OutputFile teststatus_5b3sensorstars.txt 
rem -LogFile datalog_5b3sensorstars.txt 
rem -TestLimits testlimit_5b3sensorstars.txt 
rem -TestSettings testconfig_5b3sensorstars.txt 
rem -BMPFileIn 5B3_Bayer_Stars_NDPC.bmp 
rem -debug
SensorBlemishDetectConsoleApp.exe -OutputFile teststatus_5b3sensorstars.txt -LogFile datalog_5b3sensorstars.txt -TestLimits testlimit_5b3sensorstars.txt -TestSettings testconfig_5b3sensorstars.txt -BMPFileIn 5B3_Bayer_Stars_NDPC.bmp -debug
mkdir 5B3-stars
move teststatus_5b3sensorstars.txt .\5B3-stars\
move datalog_5b3sensorstars.txt .\5B3-stars\
move *.csv .\5B3-stars\
rem 
rem Magneto sensor holes detection
rem 
rem SensorBlemishDetectConsoleApp.exe 
rem -OutputFile teststatus_magnetosensorholes.txt 
rem -LogFile datalog_magnetosensorholes.txt 
rem -TestLimits testlimit_magnetosensorholes.txt 
rem -TestSettings testconfig_magnetosensorholes.txt 
rem -BMPFileIn Magneto_Bayer_Holes_NDPC.bmp 
rem -debug 
SensorBlemishDetectConsoleApp.exe -OutputFile teststatus_magnetosensorholes.txt -LogFile datalog_magnetosensorholes.txt -TestLimits testlimit_magnetosensorholes.txt -TestSettings testconfig_magnetosensorholes.txt -BMPFileIn Magneto_Bayer_Holes_NDPC.bmp -debug 
mkdir magneto-holes
move teststatus_magnetosensorholes.txt .\magneto-holes\
move datalog_magnetosensorholes.txt .\magneto-holes\
move *.csv .\magneto-holes\
rem 
rem Magneto sensor stars detection
rem 
rem SensorBlemishDetectConsoleApp.exe 
rem -OutputFile teststatus_magnetosensorstars.txt 
rem -LogFile datalog_magnetosensorstars.txt 
rem -TestLimits testlimit_magnetosensorstars.txt 
rem -TestSettings testconfig_magnetosensorstars.txt 
rem -BMPFileIn Magneto_Bayer_Stars_NDPC.bmp 
rem -debug
SensorBlemishDetectConsoleApp.exe -OutputFile teststatus_magnetosensorstars.txt -LogFile datalog_magnetosensorstars.txt -TestLimits testlimit_magnetosensorstars.txt -TestSettings testconfig_magnetosensorstars.txt -BMPFileIn Magneto_Bayer_Stars_NDPC.bmp -debug
mkdir magneto-stars
move teststatus_magnetosensorstars.txt .\magneto-stars\
move datalog_magnetosensorstars.txt .\magneto-stars\
move *.csv .\magneto-stars\
rem 
