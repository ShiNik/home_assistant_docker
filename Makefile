# Makefile

.PHONY: setup

# Directory where the virtual environment will be created
VENV_DIR = venv

# The main setup target
setup: install-venv $(VENV_DIR)/bin/activate
	@echo "Setting up directories for Docker volumes..."
	# Run the Python script using the virtual environment's Python interpreter
	$(VENV_DIR)/bin/python create_volumes.py
	@echo "Setup complete."

# Rule to install python3.12-venv if not already installed
install-venv:
	@echo "Installing python3.12-venv..."
	sudo apt-get update
	sudo apt-get install -y python3.12-venv
	@echo "python3.12-venv installation complete."

# Rule to create and activate the virtual environment, and install dependencies
$(VENV_DIR)/bin/activate: requirements.txt
	@echo "Creating virtual environment..."
	# Create a virtual environment in the specified directory
	python3.12 -m venv $(VENV_DIR)
	@echo "Activating virtual environment and installing dependencies..."
	# Source the virtual environment and install dependencies
	. $(VENV_DIR)/bin/activate && pip install -r requirements.txt
	@echo "Virtual environment setup complete."


