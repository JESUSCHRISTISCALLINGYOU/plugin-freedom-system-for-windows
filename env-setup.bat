@echo off
REM plugin-freedom-system Windows Environment Setup Script

echo Setting up plugin-freedom-system environment for Windows 11...

REM Set core environment variables (Windows paths)
set "PLUGIN_FREEDOM_DIR=%CD%"
set "PYTHON=%PLUGIN_FREEDOM_DIR%\.venv\Scripts\python.exe"
set "JUCE_ROOT=C:\JUCE"
REM Add to PATH
set "PATH=%PLUGIN_FREEDOM_DIR%;%PLUGIN_FREEDOM_DIR%\node_modules\.bin;%PATH%"

echo Environment configured successfully!
echo PYTHON=%PYTHON%
echo JUCE_ROOT=%JUCE_ROOT%
echo CMAKE is at %CMAKE%

REM Verify JUCE
if exist "%JUCE_ROOT%" (
    echo [OK] JUCE found at %JUCE_ROOT%
) else (
    echo [WARN] JUCE not found at %JUCE_ROOT%
)

REM Verify CMake
where cmake.exe 2>nul
