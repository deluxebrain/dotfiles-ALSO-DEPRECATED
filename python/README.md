# Python

## Overview of tools

These tools are used to solve the following problems associated with Python development - managing muliple versions of Python on the same system, and providing project-level isolation of Python dependencies.

1. pyenv

    Used to isolate Python versions allowing multiple versions of Python to coexist and without impacting the system Python. Provides support for specifying Python version at the project level.

2. pipenv

    Tool that combines complete Python development tooling, including virual environment and dependency management.
    Intended to be used for all non-`conda` projects.
    Note that `pipenv` has no support for `conda`.

3. miniconda

    Python environment for data science that combines a Python runtime as well as virtual environment and package management. Used in preference to `anaconda` which also comes prebundles with a lot of data science packages. The mini/anaconda Python environment comes packaged with the Intel Math Kernel Library (mkl) versions of `NumPy`, etc.

4. pyenv-virtualenv

    As architected in these dotfiles `pyenv-virtualenv` is intended to be used purely for system setup and integration.
    If you find yourself writing `pyenv virtualenv` please stop and use `pipenv` or `conda` instead.

5. pip

    Note that `pip` is not actually used. Package management is natively provided by both `conda` and `pipenv`.

## Python management

### Native pyenv commands

```sh
# Show current Python version
pyenv version

# List all installed Python versions
pyenv versions

# List all Python versions available to install
pyenv install --list

# Install Python VERSION
pyenv install VERSION
```

### Usage through dotfile aliases

```sh
# List all Python distributions available to install
pyd

# List all versions of a Python DISTRIBUTION available to install
# Defaults to CPython
pydv
pydv DISTRIBUTION

# Install latest version of Python distribtuion
# Defaults to CPython
pyi
pyi DISTRIBUTION
```

## Python project setup

### Conda project

```sh
# Create and enter project directory
mkdir foo && cd $_

# Set local Python version
pyenv local miniconda-[VERSION]

# Create conda environment
conda create -y -n [NAME]

# Activate conda environment
conda activate [NAME]

# Install dependencies
conda install -y [PACKAGE]

# Deactivate conda environment
conda deactivate # or just cd out of project directory
```

### Pipenv project

```sh
# Create and enter project directory
mkdir foo && cd $_

# Set local Python version
# Include fallback to the global environment for globally installed packages
pyenv local 3.7.0 global

# Create pipenv environment (or use 'pei' alias)
# Note that pipenv is pulled in from the global environment
pipenv install --python `pyenv which python`

# Install dependencies
pipenv install [PACKAGE]

# Run Python script (or use 'prp' alias)
pipenv run python [SCRIPT]

# Enter pipenv environment shell
pipenv shell
```

## Using Jupyter Notebook

Note that the `jupyter` package installs both `notebook` and `ipykernel` as dependencies.

### Usage with a Conda environment

From within your activated conda environment:

```sh
conda install -y jupyter

# Allow the current environment to be accessed from notebook
conda install -y nb_conda

# Launch the Jupyter server
# Pulls in configuration from ~/.jupyter/jupyter_notebook_config.py
jupyter notebook
```

### Usage with a pipenv environment

First, create your pipenv based project as above.

```sh
pipenv install jupyter

pipenv run jupyter notebook
```

## Notes

### pyenv-virtualenv

Plugin for `pyenv` to provide `virtualenv` and `conda` environments for Python. These provide isolated working copies of Python which prevent one project and its dependencies affecting another.

Note that `pyenv-virtualenv` is being used for a couple of explicit reasons related to the setup of the system, as follows:

1. conda integration with pyenv

    `pyenv-virtualenv` provides `conda` integrations with `pyenv` to allow `conda` to work properly with Python versions managed by `pyenv`.

    For example, `pyenv-virtualenv` is required to get `conda activate` working when used in conjunction with `pyenv`.

2. Provision of global virtual environment

    Whereever possible Python pacakges should be installed in per-project virtual environments.

    However, some Python packages are genuinely required system-wide in that they are either needed across or outside of project specific work.

    Such Python packages are installed in the `global` virtual environment which is created using `pyenv-virtualenv`.
    For example, `pipenv` is installed into the global virtual enironment to allow it to be used for the creation of per-project virtual environments.

### Using VirtualEnv for virtual environment management

This is just FYI - use conda or pipenv in preference.

```sh
# Create project virtualenv
pyenv virtualenv [VERSION] [ENV_NAME]

# Create and enter project directory
mkdir foo && cd $_

# Set local python environment
pyenv local [ENV_NAME]

# To manually activate / deactive the virtual environment
pyenv activate [ENV_NAME]
pyenv deactivate
```
