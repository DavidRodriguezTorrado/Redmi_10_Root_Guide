@echo off
setlocal enabledelayedexpansion
if %1.==. (
    echo Wilcard parameter is required.
    goto end
)
for /F "tokens=* USEBACKQ" %%F in (`adb shell ls %1`) do (
    set text=%%F
    set mfile=%%F
    adb pull "!mfile!"
    adb shell rm -f "!mfile!"
)
:end
endlocal