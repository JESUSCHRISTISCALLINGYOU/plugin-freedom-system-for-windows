@echo off
REM Install JUCE for Windows plugin development

REM Check if JUCE is already installed at common locations
if exist "C:\JUCE" (
    echo [OK] JUCE found at C:\JUCE
    goto :already_installed
)

if exist "C:\Program Files\JUCE" (
    echo [OK] JUCE found at C:\Program Files\JUCE
    goto :already_installed
)

REM Check PATH
for %%i in (cmake.exe) do (
    if %%~i neq "" (
        echo CMake found at %%~i
    )
)

echo.
echo Installing JUCE for Windows plugin development...
echo.
echo Please choose installation method:
echo [1] Download JUCE 7.x from https://github.com/juce-framework/JUCE/releases
echo [2] Skip for now (use system JUCE or set JUCE_ROOT path later)
echo [3] Use pre-installed JUCE (if available via winget)
echo.
set /p CHOICE="Enter choice (1-3): "

if "%CHOICE%"=="1" (
    echo.
    echo Downloading JUCE 7.x...
    echo.
    echo IMPORTANT: Due to download size (~400MB), please visit the URL manually:
    echo https://github.com/juce-framework/JUCE/releases
    echo.
    echo After downloading:
    echo 1. Extract JUCE to C:\JUCE
    echo 2. Or add to PATH: set PATH=C:\JUCE;%PATH%
    echo 3. Run setup.bat again
    echo.
) else if "%CHOICE%"=="2" (
    echo.
    echo [SKIP] JUCE installation skipped for now.
    echo Please set JUCE_ROOT environment variable to your JUCE installation path.
    echo Example: set JUCE_ROOT=C:\JUCE
    echo Add to your .bat scripts or system PATH.
    echo.
) else if "%CHOICE%"=="3" (
    echo.
    echo Trying to find JUCE via winget...
    winget search juce -s winget 2>nul
    if %errorlevel% equ 0 (
        echo JUCE found, please install with: winget install JuceFramework.JUCE
    ) else (
        echo [SKIP] JUCE not found via winget
    )
)

:already_installed
echo.
echo [OK] Environment ready!
echo.
echo Next steps:
echo 1. Set JUCE_ROOT=C:\JUCE (or your JUCE path)
echo 2. Add CMAKE to PATH if not already set
echo 3. Run 'env-setup.bat' to configure
