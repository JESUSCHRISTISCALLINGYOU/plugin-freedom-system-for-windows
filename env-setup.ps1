# plugin-freedom-system Environment Setup Script for PowerShell

# Set core environment variables
$PLUGIN_FREEDOM_DIR = Split-Path -Parent $MyInvocation.MyCommand.Path
$PYTHON = Join-Path $PLUGIN_FREEDOM_DIR ".local\bin\python.exe"
$JUCE_ROOT = Join-Path $PLUGIN_FREEDOM_DIR "..\C\JUCE"
$CMAKE = Join-Path $PLUGIN_FREEDOM_DIR "..\Program Files\CMake\bin\cmake.exe"
$NPM = Join-Path $PLUGIN_FREEDOM_DIR ".npm\nodejs\node.exe"

# Add to PATH
$env:PATH = "$PLUGIN_FREEDOM_DIR\.local\bin;$PLUGIN_FREEDOM_DIR\node_modules\.bin;$env:PATH"

# Export for child processes
[System.Environment]::SetEnvironmentVariable("PYTHON", $PYTHON, "User")
[System.Environment]::SetEnvironmentVariable("JUCE_ROOT", $JUCE_ROOT, "User")
[System.Environment]::SetEnvironmentVariable("CMAKE", $CMAKE, "User")

Write-Host "Environment configured successfully!"
Write-Host "PYTHON=$PYTHON"
Write-Host "JUCE_ROOT=$JUCE_ROOT"
Write-Host "CMAKE=$CMAKE"
