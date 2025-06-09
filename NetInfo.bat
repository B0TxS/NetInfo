@echo off

color 9
title NetInfo


cls
echo.
echo ==============================================================================
echo                            NETWORK INFORMATION TOOL                         
echo ==============================================================================
echo.


echo Date: %date%
echo Time: %time%
echo.


echo Hostname: %COMPUTERNAME%
echo.
echo Gathering network information...
echo Loading, please wait...
timeout /t 4 >nul

echo Vital IP Configuration:
echo ------------------------
for /f "tokens=2 delims=:" %%I in ('ipconfig ^| findstr "IPv4"') do (
    echo IPv4 Address: %%I
)
for /f "tokens=2 delims=:" %%I in ('ipconfig ^| findstr "Subnet"') do (
    echo Subnet Mask: %%I
)
for /f "tokens=2 delims=:" %%I in ('ipconfig ^| findstr "Default Gateway"') do (
    echo Default Gateway: %%I
)
echo.


echo Active Connections:
echo ------------------------
netstat -ano | findstr LISTENING
if errorlevel 1 (
    echo No active connections found.
)
echo.


echo ==============================================================================
echo.
echo                    Thank you for using NetInfo!
echo                         Press any key to exit...
pause >nul


exit