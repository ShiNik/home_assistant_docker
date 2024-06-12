# Makefile

.PHONY: setup  create-venv run stop

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


# Rule to run Docker services
run: setup
	@echo "Starting Docker services..."
	docker compose up -d
	@echo "Docker services started."

# Rule to stop Docker services
stop:
	@echo "Stopping Docker services..."
	sudo docker compose down
	@echo "Docker services stopped."
