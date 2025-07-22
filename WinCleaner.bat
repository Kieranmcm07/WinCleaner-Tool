@echo off
title WinCleaner ^| @Nokky

REM =======================================================================
REM  WinCleaner Launcher - Handles UAC Elevation and Starts Main Script
REM =======================================================================

cls

REM --- Save original code page so we can restore it later (for colors/ASCII) ---
for /f "tokens=4 delims=: " %%a in ('chcp') do set "ORIG_CP=%%a"

REM --- Set UTF-8 for proper color output ---
chcp 65001 > nul

REM --- Welcome Banner & Vibes ---
echo.
echo [38;2;255;0;0m                                ╔═══════════════════════════════════════════════════════╗[0m
echo [38;2;255;51;0m                                ║                                                       ║[0m
echo [38;2;255;102;0m                                ║           PREPARING WINCLEANER v1.0 - 2025            ║[0m
echo [38;2;255;153;0m                                ║        Your system optimization is starting...        ║[0m
echo [38;2;255;204;0m                                ║                                                       ║[0m
echo [38;2;255;255;0m                                ╚═══════════════════════════════════════════════════════╝[0m 

timeout /t 1 >nul

REM --- More ASCII for the vibes ---
echo.                                                                                  
echo [38;2;255;0;0m                                                                                :=+++[0m     
echo [38;2;255;51;0m                                                                =+++***************[0m     
echo [38;2;255;102;0m                                                   +++++= +***********************[0m     
echo [38;2;255;153;0m                                       +++**************+ +***********************[0m     
echo [38;2;255;204;0m                                      :*****************+ +***********************[0m     
echo [38;2;255;255;0m                                       *****************+ +***********************[0m     
echo [38;2;255;0;0m                                        :*****************+ +***********************[0m     
echo [38;2;255;51;0m                                       :*****************+ +***********************[0m     
echo [38;2;255;102;0m                                      :*****************+ +***********************[0m     
echo [38;2;255;153;0m                                      :*****************+ +***********************[0m     
echo [38;2;255;204;0m                                       *****************+ +***********************[0m     
echo [38;2;255;255;0m                                       *****************+ +***********************[0m     
echo.                         
echo [38;2;255;0;0m                                        :*****************+ +***********************[0m     
echo [38;2;255;51;0m                                       :*****************+ +***********************[0m     
echo [38;2;255;102;0m                                      :*****************+ +***********************[0m     
echo [38;2;255;153;0m                                      :*****************+ +***********************[0m     
echo [38;2;255;204;0m                                      :*****************+ +***********************[0m     
echo [38;2;255;255;0m                                      :*****************+ +***********************[0m     
echo [38;2;255;0;0m                                        :*****************+ +***********************[0m     
echo [38;2;255;51;0m                                        +**+*************+ +***********************[0m     
echo [38;2;255;102;0m                                                  =+++**+ +***********************[0m     
echo [38;2;255;153;0m                                                              ++++*++*************[0m     
echo [38;2;255;204;0m                                                                           -+++***[0m     

echo.
echo [38;2;255;255;0m                                [!] Please respond to the UAC prompt when it appears.[0m

timeout /t 1 >nul

REM --- Restore original code page (so user's console isn't stuck in UTF-8) ---
chcp %ORIG_CP% > nul

REM --- Clean up any old elevation flag ---
if exist "%temp%\WinCleaner_ELEVATED.flag" del "%temp%\WinCleaner_ELEVATED.flag"
echo clearing elevation flag...
REM --- Launch the elevated script with UAC ---
powershell -Command "Start-Process '%~dpn0_Elevated.bat' -Verb RunAs -ArgumentList '/UAC'"

REM --- Wait for the elevated script to signal completion (via flag file) ---
set "max_checks=30"  REM Increased from 15 to 30 (6 seconds total)
set "check_interval=200"
for /L %%i in (1,1,%max_checks%) do (
    ping -n 1 -w %check_interval% 127.0.0.1 > nul
    if exist "%temp%\WinCleaner_ELEVATED.flag" (
        del "%temp%\WinCleaner_ELEVATED.flag" > nul 2>&1
        exit /b
    )
)

REM --- If we get here, elevation failed or was denied ---
goto failitNOW

REM =======================================================================
REM  Elevation Failure Handler
REM =======================================================================
:failitNOW
cls
chcp 65001 > nul
echo.
echo.                       
echo [38;2;255;0;0m                                ███████╗ █████╗ ██╗██╗     ██╗   ██╗██████╗ ███████╗██╗[0m
echo [38;2;255;51;0m                                ██╔════╝██╔══██╗██║██║     ██║   ██║██╔══██╗██╔════╝██║[0m
echo [38;2;255;102;0m                                █████╗  ███████║██║██║     ██║   ██║██████╔╝█████╗  ██║[0m
echo [38;2;255;153;0m                                ██╔══╝  ██╔══██║██║██║     ██║   ██║██╔══██╗██╔══╝  ╚═╝[0m
echo [38;2;255;204;0m                                ██║     ██║  ██║██║███████╗╚██████╔╝██║  ██║███████╗██╗[0m
echo [38;2;255;255;0m                                ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝[0m                                                     
echo.
echo [91m                          [✗] Administrator privileges were not granted![0m
echo.
echo [90m                       ╔══════════════════════════════════════════════════════════════════════╗[0m
echo [90m                       ║  TIP: Right-click and 'Run as administrator' for manual elevation.   ║[0m
echo [90m                       ╚══════════════════════════════════════════════════════════════════════╝[0m
echo.
echo [91m                          [✗] Windows Cleaner was denied administrator privileges.[0m
echo [90m                       ├══════════════════════════════════════════════════════════════════════┤[0m
echo [90m                          LOG:[0m
echo [90m                          - Requested elevation via UAC.[0m
echo [90m                          - User denied or closed the UAC prompt.[0m
echo [90m                          - Administrative privileges are required to proceed.[0m
echo [90m                       ├══════════════════════════════════════════════════════════════════════┤[0m
echo.
echo [90m                         Press any key to exit...[0m
pause >nul
exit