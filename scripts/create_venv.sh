#!/usr/bin/env bash
set -euo pipefail

# Usage: ./scripts/create_venv.sh [python_executable] [venv_dir]
# Examples:
#   ./scripts/create_venv.sh            # uses system 'python3' and creates .venv
#   ./scripts/create_venv.sh python3.11 myenv

PYTHON_EXECUTABLE=${1:-python3}
VENV_DIR=${2:-.venv}

echo "Using Python executable: $PYTHON_EXECUTABLE"

if ! command -v "$PYTHON_EXECUTABLE" >/dev/null 2>&1; then
  echo "Error: $PYTHON_EXECUTABLE not found. Install Python or provide a valid path." >&2
  exit 1
fi

# Create the virtual environment
$PYTHON_EXECUTABLE -m venv "$VENV_DIR"

# Activate and upgrade pip, install requirements if present
# shellcheck source=/dev/null
source "$VENV_DIR/bin/activate"
python -m pip install --upgrade pip setuptools wheel

if [ -f requirements.txt ]; then
  echo "Installing from requirements.txt..."
  pip install -r requirements.txt
fi

echo
echo "Virtual environment created at: $VENV_DIR"
echo "Activate it with: source $VENV_DIR/bin/activate"

echo "To remove: rm -rf $VENV_DIR"
