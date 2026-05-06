#!/bin/bash
# plugin-freedom-system Environment Setup Script
# This script configures environment variables for development

echo "Setting up plugin-freedom-system environment..."

# Set core environment variables
export PLUGIN_FREEDOM_DIR="$(cd "$(dirname "$0")" && pwd)"
export PYTHON="$PLUGIN_FREEDOM_DIR/.local/bin/python"
export JUCE_ROOT="$PLUGIN_FREEDOM_DIR/../../../C/JUCE"
export CMAKE="$PLUGIN_FREEDOM_DIR/../../../Program Files/CMake/bin/cmake.exe"
export NPM="$PLUGIN_FREEDOM_DIR/.npm/nodejs\node.exe"

# Add to PATH
export PATH="$PLUGIN_FREEDOM_DIR/.local/bin:$PLUGIN_FREEDOM_DIR/node_modules/.bin:$PATH"

echo "Environment configured successfully!"
echo "PYTHON=$PYTHON"
echo "JUCE_ROOT=$JUCE_ROOT"
echo "CMAKE=$CMAKE"
