rem This batch is to run on test station %1 and insert at the bottom of Kinetic script
rem If %2 get value 0, meaning a PASS.
rem 
rem TestTrackingConsoleApp 
rem -config "bolide\bolide.ini" 
rem -onEndOfTestCycle %1,%2
rem 
TestTrackingConsoleApp -config "bolide\bolide.ini" -onEndOfTestCycle 2,1
ping 1.1.1.1 -n 1 -w 50 > nul
@echo off
rem 
