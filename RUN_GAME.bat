@echo off
setlocal
cd /d "%~dp0"

if not exist "build-direct\mongo_game.exe" (
    echo [ERROR] Mongo Engine has not been built yet.
    echo Run BUILD_DEV_WINDOWS.bat or BUILD_WINDOWS.bat first.
    pause
    exit /b 1
)

set "UCRT64_BIN=C:\msys64\ucrt64\bin"
if not exist "%UCRT64_BIN%\SDL3.dll" (
    echo [ERROR] UCRT64 runtime not found at %UCRT64_BIN%
    echo Expected SDL3.dll beside the active MSYS2 UCRT64 compiler.
    pause
    exit /b 1
)

rem Do not allow partial/stale EXE-local runtime copies to override the
rem architecture-consistent UCRT64 dependency chain.
set "STALE_RUNTIME="
for %%D in (SDL3.dll libgcc_s_seh-1.dll libstdc++-6.dll libwinpthread-1.dll) do (
    if exist "build-direct\%%D" (
        echo [ERROR] Stale EXE-local runtime DLL found: build-direct\%%D
        set "STALE_RUNTIME=1"
    )
)
if defined STALE_RUNTIME (
    echo.
    echo Re-run BUILD_DEV_WINDOWS.bat. The canonical builder removes stale DLL copies.
    pause
    exit /b 1
)

set "PATH=%UCRT64_BIN%;%PATH%"
echo Launching Mongo Engine from canonical PROJECT ROOT working directory...
echo Runtime: UCRT64 bin first on PATH
where SDL3.dll 2>nul
where libstdc++-6.dll 2>nul
where libgcc_s_seh-1.dll 2>nul
where libwinpthread-1.dll 2>nul
echo.
"build-direct\mongo_game.exe"
set "GAME_EXIT=%ERRORLEVEL%"

if not "%GAME_EXIT%"=="0" (
    echo.
    echo ==========================================
    echo MONGO ENGINE EXITED WITH CODE %GAME_EXIT%
    echo ==========================================
    if "%GAME_EXIT%"=="-1073741701" (
        echo Windows status 0xC000007B: invalid image format / architecture mismatch.
        echo The DEV launcher is already using the canonical UCRT64 dependency chain.
        echo Re-run BUILD_DEV_WINDOWS.bat and capture the [RUNTIME] x64 preflight lines.
    )
    echo The console is being kept open so the failure is visible.
    pause
)

exit /b %GAME_EXIT%
