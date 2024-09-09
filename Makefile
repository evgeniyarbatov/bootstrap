PROJECT_NAME := $(shell basename $(PWD))

VENV_PATH = ~/.venv/$(PROJECT_NAME)

NOTEBOOKS = notebooks
SCRIPTS = scripts

PYTHON_GITIGNORE = https://raw.githubusercontent.com/github/gitignore/main/Python.gitignore

all: gitignore venv install jupyter dirs

gitignore:
	@wget -q $(PYTHON_GITIGNORE) -O .gitignore

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
	--display-name "$(PROJECT_NAME)" \
	> /dev/null 2>&1

dirs:
	@mkdir -p $(NOTEBOOKS)
	@mkdir -p $(SCRIPTS)

.PHONY: gitignore venv install jupyter dirs