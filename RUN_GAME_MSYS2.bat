@echo off
setlocal
cd /d "%~dp0"

if exist "build-direct\mongo_game.exe" (
    cd build-direct
    mongo_game.exe
) else (
    echo Mongo Engine Brick 019.11 has not been built yet.
    echo Run BUILD_WINDOWS.bat first.
    pause
)
