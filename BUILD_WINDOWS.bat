@echo off
setlocal
cd /d "%~dp0"

echo ==========================================
echo MONGO ENGINE - BRICK 019.19.2
echo FRONTIER UNIT REFIT FOUNDATION
echo DIRECT MSYS2 UCRT64 LAUNCHER
echo ==========================================
echo.

set "MSYS2=C:\msys64"
set "BASH=%MSYS2%\usr\bin\bash.exe"

if not exist "%BASH%" (
    echo [ERROR] MSYS2 was not found at C:\msys64
    pause
    exit /b 1
)

"%BASH%" -lc "export MSYSTEM=UCRT64; export CHERE_INVOKING=1; export PATH=/ucrt64/bin:/usr/bin:$PATH; cd \"$(cygpath -u '%CD%')\"; ./build_msys2.sh"

if errorlevel 1 goto :fail

echo.
echo Build script completed.
pause
exit /b 0

:fail
echo.
echo [BUILD FAILED]
pause
exit /b 1
