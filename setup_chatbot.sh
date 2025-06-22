#!/bin/bash

# Get directory of the script (assumes chatbot.py is in same directory)
project_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
chatbot_path="$project_dir/chatbot.py"

# Check chatbot.py exists
if [[ ! -f "$chatbot_path" ]]; then
    echo "Error: chatbot.py not found in $project_dir"
    exit 1
fi

# Prompt for API key
read -s -p "Enter your GROQ API key: " groq_api_key
echo

# Create and activate virtual environment
cd "$project_dir" || exit 1
python3 -m venv venv
source venv/bin/activate

# Install required packages
pip install --upgrade pip
pip install pyinstaller groq

# Build with PyInstaller
pyinstaller --onefile "$chatbot_path"

# Clean up
deactivate
rm -rf venv

# Path to binary
binary_path="$project_dir/dist/chatbot"

if [[ ! -f "$binary_path" ]]; then
    echo "Error: Build failed, binary not found"
    exit 1
fi

# Detect user shell and rc file
if [[ $SHELL == */zsh ]]; then
    shell_rc="$HOME/.zshrc"
else
    shell_rc="$HOME/.bashrc"
fi

# Add alias if not already present
if ! grep -q "alias chatbot=" "$shell_rc"; then
    echo "alias chatbot='$binary_path'" >> "$shell_rc"
    echo "Alias added to $shell_rc"
fi

# Add GROQ_API_KEY export if not already present
if ! grep -q "export GROQ_API_KEY=" "$shell_rc"; then
    echo "export GROQ_API_KEY=\"$groq_api_key\"" >> "$shell_rc"
    echo "GROQ_API_KEY added to $shell_rc"
fi

# Source the updated shell config
echo "Sourcing $shell_rc..."
# shellcheck source=/dev/null
source "$shell_rc"

echo "Setup complete! You can now run 'chatbot' from any terminal."
