REM =======================================================================
REM  WinCleaner by @Nokky - SYSTEM CLEANUP TOOL (Elevated)
REM  This script is for educational use only. Use at your own risk!
REM =======================================================================

@echo off
title WinCleaner ^| @Nokky

REM --- Block direct execution, force UAC elevation via main script ---
set "foundUAC="
for %%A in (%*) do (
    if /I "%%A"=="/UAC" set "foundUAC=1"
)
if not defined foundUAC goto fail_direct

REM --- Setup logging directory in AppData (safer from accidental deletion) ---
set "logdir=%APPDATA%\WinCleaner"
set "logfile=%logdir%\WinCleaner.log"
if not exist "%logdir%" md "%logdir%"
echo [%date% %time%] WinCleaner Started >> "%logfile%"

REM --- Signal elevation for main script ---
echo elevated > "%temp%\WinCleaner_ELEVATED.flag"
chcp 65001 >nul
goto menu

REM =======================================================================
REM  MAIN MENU - All the options, all the vibes
REM =======================================================================

:menu
cls
echo.
echo.                  
REM --- ASCII ART & Welcome ---
echo                                       [38;2;255;0;0m███╗   ██╗ ██████╗ ██╗  ██╗██╗  ██╗██╗   ██╗  [0m
echo                                       [38;2;255;51;0m████╗  ██║██╔═══██╗██║ ██╔╝██║ ██╔╝╚██╗ ██╔╝ [0m
echo                                       [38;2;255;102;0m██╔██╗ ██║██║   ██║█████╔╝ █████╔╝  ╚████╔╝ [0m
echo                                       [38;2;255;153;0m██║╚██╗██║██║   ██║██╔═██╗ ██╔═██╗   ╚██╔╝  [0m
echo                                       [38;2;255;204;0m██║ ╚████║╚██████╔╝██║  ██╗██║  ██╗   ██║   [0m
echo                                       [38;2;255;255;0m╚═╝  ╚═══╝ ╚═════╝ ╚═╝  ╚═╝╚═╝  ╚═╝   ╚═╝   [0m
echo.
echo                       [38;2;255;0;0m██╗    ██╗██╗███╗   ██╗ ██████╗██╗     ███████╗ █████╗ ███╗   ██╗███████╗██████╗ [0m
echo                       [38;2;255;51;0m██║    ██║██║████╗  ██║██╔════╝██║     ██╔════╝██╔══██╗████╗  ██║██╔════╝██╔══██╗[0m
echo                       [38;2;255;102;0m██║ █╗ ██║██║██╔██╗ ██║██║     ██║     █████╗  ███████║██╔██╗ ██║█████╗  ██████╔╝[0m
echo                       [38;2;255;153;0m██║███╗██║██║██║╚██╗██║██║     ██║     ██╔══╝  ██╔══██║██║╚██╗██║██╔══╝  ██╔══██╗[0m
echo                       [38;2;255;204;0m╚███╔███╔╝██║██║ ╚████║╚██████╗███████╗███████╗██║  ██║██║ ╚████║███████╗██║  ██║[0m
echo                       [38;2;255;255;0m ╚══╝╚══╝ ╚═╝╚═╝  ╚═══╝ ╚═════╝╚══════╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝[0m
echo.                     
echo.
echo                       [38;2;255;51;0m╔═══════════════════╗    ╔═══════════════════╗    ╔═══════════════════╗[0m
echo                       [38;2;255;51;0m║ Created By @Nokky ║    ║ WinCleaner V.1.0. ║    ║ This Tool Is Free ║[0m
echo                       [38;2;255;51;0m╚═══════════════════╝    ╚═══════════════════╝    ╚═══════════════════╝[0m      
echo.
echo.
echo                      [38;2;255;102;0mWelcome to Ground Zero WinCleaner V.1.0.0 %username%![0m
echo.
echo                      [38;2;255;102;0mNote: I am not resonsible for any damages. This program is for educational purposes only.[0m
echo [38;2;255;204;0m╔══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╗[0m
echo [38;2;255;204;0m║                                                                                                                      ║[0m
echo [38;2;255;204;0m║                                           ╔══════════════════════════════╗                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [1] - Clean Temp Folders     ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [2] - Clean Driver Caches    ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [3] - Verify System Files    ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [4] - Clear Prefetch Caches  ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [5] - Repair System Image    ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [6] - Clean Windows Temp     ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [7] - Clean Browser Caches   ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [8] - List Suspicious Tasks  ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [9] - Empty Recycle Bin      ║                                           ║[0m
echo [38;2;255;204;0m║                                           ║ [10] - Exit WinCleaner       ║                                           ║[0m
echo [38;2;255;204;0m║                                           ╚══════════════════════════════╝                                           ║[0m
echo [38;2;255;204;0m║                                                                                                                      ║[0m
echo [38;2;255;204;0m╠══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════╝[0m

REM --- Input handling with error checking ---
:input_loop
set "user="
set /p "user=[38;2;255;204;0m╚══════════════════════: Please enter a command: > [0m"
if "%user%"=="" (
    echo [41m[!] Invalid input![0m
    timeout /t 1 >nul
    cls
    goto menu
)
if "%user%"=="1" goto clean_temp
if "%user%"=="2" goto clean_drivers
if "%user%"=="3" goto run_sfc
if "%user%"=="4" goto clean_prefetch
if "%user%"=="5" goto run_dism
if "%user%"=="6" goto clean_wintemp
if "%user%"=="7" goto clean_browsers
if "%user%"=="8" goto clean_tasks
if "%user%"=="9" goto empty_recyclebin
if "%user%"=="10" goto end

echo [41m[!] Invalid input![0m
timeout /t 1 >nul
cls
goto menu

REM =======================================================================
REM 1. Clean Temp Folders - nukes all the temp junk
REM =======================================================================
:clean_temp
cls
echo [38;2;255;153;0m[*] Cleaning TEMP Folders...[0m
set /a count=0
for %%d in ("%TEMP%\*" "%SystemRoot%\Temp\*" "%USERPROFILE%\AppData\Local\Temp\*") do (
    if exist "%%d" (
        echo [38;2;255;255;255mScanning: %%d[0m
        for /f "delims=" %%f in ('dir /a /b /s "%%d" 2^>nul') do (
            del /f /q "%%f" >nul 2>&1 && (
                echo [38;2;255;153;0mDeleted: %%f[0m
                echo [%date% %time%] Deleted: %%f >> "%logfile%"
                set /a count+=1
            )
        )
        rd /s /q "%%d" >nul 2>&1
    ) else (
        echo [38;2;128;128;128m[~] Skipped: %%d not found[0m
    )
)
echo [37;48;2;46;139;87m[✓] Deleted %count% temporary files![0m
timeout /t 3 >nul
goto menu

REM =======================================================================
REM 2. Clean Driver Caches - backs up then wipes AMD/NVIDIA/INTEL folders
REM =======================================================================
:clean_drivers
cls
set "backup_dir=C:\DriverBackup"
if not exist "%backup_dir%" md "%backup_dir%"

echo [38;2;255;153;0m[*] Cleaning Driver Cache...[0m
set /a count=0
for %%D in ("%SystemDrive%\AMD" "%SystemDrive%\NVIDIA" "%SystemDrive%\INTEL") do (
    if exist "%%D" (
        xcopy /E /I "%%D" "%backup_dir%\%%~nD" >nul 2>&1 && echo [38;2;128;128;128mBacked up: %%D[0m
        echo [38;2;255;255;255mScanning %%D...[0m
        for /f "delims=" %%f in ('dir /a /b /s "%%D" 2^>nul') do (
            del /a /f /q "%%f" >nul 2>&1 && (
                echo [38;2;255;153;0mDeleted: %%f[0m
                echo [%date% %time%] Deleted: %%f >> "%logfile%"
                set /a count+=1
            )
        )
        rd /s /q "%%D" >nul 2>&1
    ) else (
        echo [38;2;128;128;128m[~] Skipped: %%D not found[0m
    )
)
echo [37;48;2;46;139;87m[✓] Deleted %count% driver files![0m
timeout /t 3 >nul
goto menu

REM =======================================================================
REM 3. Verify System Files - SFC /scannow, classic Windows fix
REM =======================================================================
:run_sfc
cls
echo [38;2;255;153;0m[*] Running System File Checker...[0m
echo [38;2;255;255;0m[!] This may take 5-15 minutes. Please wait...[0m
sfc /scannow
if errorlevel 1 (
    echo [38;2;255;0;0m[✗] SFC found issues. Check CBS.log for details.[0m
) else (
    echo [37;48;2;46;139;87m[✓] System Files Verified![0m
)
echo [%date% %time%] Ran SFC >> "%logfile%"
timeout /t 3 >nul
goto menu

REM =======================================================================
REM 4. Clear Prefetch Caches - Windows prefetch folder
REM =======================================================================
:clean_prefetch
cls
echo [38;2;255;153;0m[*] Clearing Prefetch files...[0m
set /a count=0
for /f "delims=" %%f in ('dir /a /b /s "%SystemRoot%\Prefetch" 2^>nul') do (
    echo [38;2;255;255;255mScanning: %%f[0m
    del /f /q "%%f" >nul 2>&1 && (
        echo [38;2;255;153;0mDeleted: %%f[0m
        echo [%date% %time%] Deleted: %%f >> "%logfile%"
        set /a count+=1
    )
)
echo [37;48;2;46;139;87m[✓] Deleted %count% Prefetch Cache Files![0m
timeout /t 3 >nul
goto menu

REM =======================================================================
REM 5. Repair System Image - DISM /Online /Cleanup-Image /RestoreHealth
REM =======================================================================
:run_dism
cls
echo [38;2;255;153;0m[*] Running DISM Image Repair...[0m
echo [38;2;255;255;0m[!] This may take 5-15 minutes. Please wait...[0m
DISM /Online /Cleanup-Image /RestoreHealth
set "dism_exit_code=%errorlevel%"
if "%dism_exit_code%"=="0" (
    echo [37;48;2;46;139;87m[✓] DISM completed successfully![0m
) else (
    echo [38;2;255;0;0m[✗] DISM failed with exit code %dism_exit_code%. Check CBS.log.[0m
)
echo [%date% %time%] DISM completed with code %dism_exit_code% >> "%logfile%"
timeout /t 2 >nul
goto menu

REM =======================================================================
REM 6. Clean Windows Temp - nukes %windir%\Temp
REM =======================================================================
:clean_wintemp
cls
echo [38;2;255;153;0m[*] Cleaning Windows Temp folder...[0m
set /a count=0
for /f "delims=" %%f in ('dir /a /b /s "%SystemRoot%\Temp" 2^>nul') do (
    del /f /q "%%f" >nul 2>&1 && (
        echo [38;2;255;255;255mScanning: %%f[0m
        echo [38;2;255;153;0mDeleted: %%f[0m
        echo [%date% %time%] Deleted: %%f >> "%logfile%"
        set /a count+=1
    )
)
rd /s /q "%SystemRoot%\Temp" >nul 2>&1
md "%SystemRoot%\Temp" >nul 2>&1
echo [37;48;2;46;139;87m[✓] Deleted %count% Windows Temp files![0m
timeout /t 3 >nul
goto menu

REM =======================================================================
REM 7. Clean Browser Caches - Chrome, Firefox, Edge
REM =======================================================================
:clean_browsers
cls
echo [38;2;255;153;0m[*] Cleaning Browser Caches...[0m
set /a count=0

REM -- Chrome Cache --
if exist "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\" (
    del /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache\*" >nul 2>&1 && (
        echo [38;2;255;153;0mCleaned Chrome cache[0m
        set /a count+=1
    )
) else (
    echo [38;2;128;128;128m[~] Chrome cache not found.[0m
) 

REM -- Firefox Cache --
if exist "%APPDATA%\Mozilla\Firefox\" (
    del /s /q "%APPDATA%\Mozilla\Firefox\Profiles\*\cache2\*" >nul 2>&1 && (
        echo [38;2;255;153;0mCleaned Firefox cache[0m
        set /a count+=1
    )
) else (
    echo [38;2;128;128;128m[~] Firefox cache not found.[0m
)

REM -- Edge Cache --
if exist "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\" (
    del /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache\*" >nul 2>&1 && (
        echo [38;2;255;153;0mCleaned Edge cache[0m
        set /a count+=1
    )
) else (
    echo [38;2;128;128;128m[~] Edge cache not found.[0m
)

echo [37;48;2;46;139;87m[✓] Cleaned %count% browser caches![0m
echo [%date% %time%] Cleaned browser caches >> "%logfile%"
timeout /t 3 >nul
goto menu

REM =======================================================================
REM 8. List Suspicious Tasks - non-Microsoft scheduled tasks
REM =======================================================================
:clean_tasks
cls
echo [38;2;255;153;0m[*] Listing Suspicious Tasks (Non-Microsoft)...[0m
echo [38;2;255;255;0m[!] Manual deletion required via Task Scheduler![0m
echo [38;2;255;255;0m[!] Only showing task names - check full details in Task Scheduler[0m
echo.

schtasks /query /FO CSV /NH 2>nul | findstr /V /I /C:"Microsoft" | findstr /V /I /C:"TaskName" > "%temp%\tasks.tmp"

set "taskCount=0"
for /f "tokens=1 delims=," %%a in ('type "%temp%\tasks.tmp"') do (
    set /a taskCount+=1
    echo [38;2;255;0;0m[!] Suspicious Task: %%a[0m
)

if %taskCount% equ 0 (
    echo [38;2;128;128;128m[~] No non-Microsoft tasks found.[0m
) else (
    echo.
    echo [38;2;255;153;0mFound %taskCount% suspicious tasks[0m
)

del "%temp%\tasks.tmp" >nul 2>&1
echo [%date% %time%] Listed suspicious tasks >> "%logfile%"
echo.
echo [38;2;255;153;0m[!] Please review in Task Scheduler for manual deletion.[0m
echo.
echo [37;48;2;46;139;87m[✓] Task listing complete![0m
pause
goto menu

REM =======================================================================
REM 9. Empty Recycle Bin - WARNING: This is permanent!
REM =======================================================================
:empty_recyclebin
cls
echo [38;2;255;153;0m[*] Running Recycle Bin Cleanup...[0m
echo.
echo [38;2;255;0;0m╔══════════════════════════════════════════════════════════════════╗[0m
echo [38;2;255;0;0m║  [!] WARNING: This will permanently delete ALL files in the      ║[0m
echo [38;2;255;0;0m║      Recycle Bin! Important files may be lost.                   ║[0m
echo [38;2;255;0;0m╚══════════════════════════════════════════════════════════════════╝[0m
echo.
set /p confirm=[38;2;255;204;0mType YES to confirm: [0m
if /i "%confirm%" neq "YES" (
    echo [38;2;255;0;0m[✗] Recycle Bin cleanup cancelled.[0m
    timeout /t 2 >nul
    goto menu
)

echo [38;2;255;153;0m[!] Emptying Recycle Bin...[0m
mshta vbscript:Execute("CreateObject(""WScript.Shell"").Run ""powershell -Command Clear-RecycleBin -Force"", 0, False:close")
echo [%date% %time%] Emptied Recycle Bin >> "%logfile%"
echo [37;48;2;46;139;87m[✓] Recycle Bin Emptied![0m
timeout /t 2 >nul
goto menu

REM =======================================================================
REM 10. Exit - log and peace out
REM =======================================================================
:end
echo [%date% %time%] WinCleaner Exited >> "%logfile%"
exit

REM =======================================================================
REM  Block direct execution - force user to use main script for UAC
REM =======================================================================
:fail_direct
cls
chcp 65001 >nul
echo.
echo [38;2;255;0;0m                                ███████╗ █████╗ ██╗██╗     ██╗   ██╗██████╗ ███████╗██╗[0m
echo [38;2;255;51;0m                                ██╔════╝██╔══██╗██║██║     ██║   ██║██╔══██╗██╔════╝██║[0m
echo [38;2;255;102;0m                                █████╗  ███████║██║██║     ██║   ██║██████╔╝█████╗  ██║[0m
echo [38;2;255;153;0m                                ██╔══╝  ██╔══██║██║██║     ██║   ██║██╔══██╗██╔══╝  ╚═╝[0m
echo [38;2;255;204;0m                                ██║     ██║  ██║██║███████╗╚██████╔╝██║  ██║███████╗██╗[0m
echo [38;2;255;255;0m                                ╚═╝     ╚═╝  ╚═╝╚═╝╚══════╝ ╚═════╝ ╚═╝  ╚═╝╚══════╝╚═╝[0m                                                     
echo.
echo [91m                          [✗] Please launch WinCleaner using the main script![0m
echo.
echo [90m                       ╔══════════════════════════════════════════════════════════════════════╗[0m
echo [90m                       ║  Do not run WinCleaner_Elevated.bat directly.                       ║[0m
echo [90m                       ║  Use WinCleaner.bat to ensure proper UAC elevation and features.     ║[0m
echo [90m                       ╚══════════════════════════════════════════════════════════════════════╝[0m
echo.
echo [90m                         Press any key to exit...[0m
pause >nul
exit