# Python virtual environment (venv) — OctoFit Tracker

This repository follows a lightweight Python virtual environment convention. The included script and instructions make it easy to create and manage a reproducible venv.

## Quickstart (macOS / Linux)

1. Ensure Python 3.8+ is installed. Check with:

```bash
python3 --version
```

2. Create the virtual environment and install dependencies:

```bash
# make the script executable once if needed
chmod +x ./scripts/create_venv.sh

# create a venv in the default location `./.venv`
./scripts/create_venv.sh
```

3. Activate the venv:

```bash
source .venv/bin/activate
```

4. Run the project or install additional packages:

```bash
pip install -r requirements.txt
python -m your_module
```

5. Deactivate:

```bash
deactivate
```
