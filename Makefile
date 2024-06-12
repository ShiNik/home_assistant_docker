# Makefile

.PHONY: setup  create-venv run

VENV_DIR=.venv
PYTHON=$(VENV_DIR)/bin/python3

# The main setup target
setup: create-venv
	@echo "Setting up directories for Docker volumes..."
	# Run the Python script using the virtual environment's Python interpreter
	$(VENV_DIR)/bin/python create_volumes.py
	@echo "Setup complete."


# Rule to create and activate the virtual environment, and install dependencies
create-venv: requirements.txt
	@echo "Creating virtual environment..."
	python3 -m venv $(VENV_DIR)
	@echo "Installing dependencies..."
	. $(VENV_DIR)/bin/activate && pip install -r requirements.txt
	@echo "Virtual environment setup complete."


run:
	@echo "Starting Docker containers..."
	sudo docker compose up -d
	@echo "Docker containers started."