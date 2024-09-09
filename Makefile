PROJECT_NAME := $(shell basename $(PWD))

VENV_PATH = ~/.venv/$(PROJECT_NAME)

NOTEBOOKS_DIR = notebooks

all: venv install jupyter

venv:
	@python3 -m venv $(VENV_PATH)

install: venv
	@source $(VENV_PATH)/bin/activate && \
	pip install --disable-pip-version-check -q -r requirements.txt

jupyter:
	@source $(VENV_PATH)/bin/activate && \
	python3 -m ipykernel install \
	--user \
	--name "$(PROJECT_NAME)" \
	--display-name "$(PROJECT_NAME)"

dirs:
    @mkdir -p $(notebooks)

.PHONY: gpx venv jupyter dirs