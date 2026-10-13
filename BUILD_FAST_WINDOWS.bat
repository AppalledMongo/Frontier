@echo off
setlocal
cd /d "%~dp0"

echo ==========================================
echo MONGO ENGINE - FAST BUILD COMPATIBILITY ALIAS
echo ==========================================
echo.
echo BUILD_FAST_WINDOWS.bat now delegates to the canonical DEV pipeline.
echo This removes the old divergent launch/staging path that could crash.
echo.

call BUILD_DEV_WINDOWS.bat
exit /b %ERRORLEVEL%
