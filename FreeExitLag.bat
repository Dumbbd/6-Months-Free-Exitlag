@echo off
setlocal enabledelayedexpansion
title FREE EXITLAG
mode con: cols=80 lines=30
color 0D

:: ---------------------------------------------
::  BIG TITLE (purple) - plain ASCII, safe codepage
:: ---------------------------------------------
cls
call :banner
echo.
color 07
echo.

:: ---------------------------------------------
::  FAKE LOADING LINES
:: ---------------------------------------------
call :loadline "Initializing modules"
call :loadline "Connecting to server"
call :loadline "Verifying license"
call :loadline "Optimizing network routes"
call :loadline "Applying configuration"
call :loadline "Finalizing setup"

echo.
color 0A
echo   [+] Successfully Complete
color 07
echo.
echo   Press 4 to close . . .

:waitkey
set "key="
set /p "key=  > "
if "%key%"=="4" exit
goto waitkey

:: ---------------------------------------------
:: subroutine: fake spinner loading line
:: ---------------------------------------------
:loadline
set "msg=%~1"
set "spin=-\|/"
for /l %%i in (1,1,10) do (
    set /a idx=%%i %% 4
    for %%s in (!idx!) do set "char=!spin:~%%s,1!"
    color 0A
    <nul set /p "=  [!char!] %msg%     "
    color 07
    <nul set /p "=      "
    ping -n 1 -w 120 127.0.0.1 >nul
    cls
    call :banner
)
color 0A
echo   [+] %msg% ... done
color 07
exit /b

:banner
color 0D
echo.
echo    #######   ######   #######  #######
echo    #        #     #  #        #
echo    #####    ######   #####    #####
echo    #        #   #    #        #
echo    #        #    #   #######  #######
echo.
echo    #######  #     #  ###  #######  #         #####    ######
echo    #         #   #    #      #     #        #     #  #     #
echo    #####      # #     #      #     #        #######  #  ####
echo    #         #   #    #      #     #        #     #  #     #
echo    #######  #     #  ###     #     #######  #     #   #####
echo.
color 07
exit /b
