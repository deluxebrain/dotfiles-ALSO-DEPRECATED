# Python

## Overview of tools

1. pyenv

    Used to isolate Python versions allowing multiple versions of Python to coexist and without impacting the system Python. Provides support for specifying Python version at the project level.

2. pyenv-virtualenv

    Plugin for `pyenv` to provide `virtualenv` and `conda` environments for Python. These provide isolated working copies of Python which prevent one project and its dependencies affecting another.

    Note that we will only be using `pyenv-virtualenv` for its `conda` integrations with `pyenv` (for example, allowing `conda activate` to work).

3. pipenv

    Tool that combines complete Python development tooling, including virual environment and dependency management. Used in preference to `py-virtualenv` for all non-`conda` projects. Note that `pipenv` has no support for `conda`.

4. miniconda

    Python environment for data science that combines a Python runtime as well as virtual environment and package management. Used in preference to `anaconda` which also comes prebundles with a lot of data science packages. The mini/anaconda Python environment comes packaged with the Intel Math Kernel Library (mkl) versions of `NumPy`, etc.

## Python management

### Native pyenv commands

```sh
# Show current Python version
pyenv version

# Lis all installed Python versions
pyenv versions

# List all Python versions available to install
pyenv install --list

# Install Python version
pyenv install [VERSION]
```

### Aliases

```sh
# List all Python distributions available to install
pyd

# List all versions of a Python distribution available to install
pydv # Versions of CPython
pydv [DISTRIBUTION] # Versions of DISTRIBUTION

# Install latest version of Python distribtuion
pyi # Install latest CPython
pyi [DISTRIBUTION] # Install latest DISTRIBUTION
```

## Project setup

### Anaconda project

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

### pipenv project

```sh
# Create and enter project directory
mkdir foo && cd $_

# Set local Python version
pyenv local [VERSION]

# Create pipenv environment
# or just use 'pei' alias
pipenv install --python `pyenv which python`

# Install dependencies
pipenv install [PACKAGE]

# Run Python script
# or just use 'prp' alias
pipenv run python [SCRIPT]

# Enter pipenv environment shell
pipenv shell

```

## Using Jupyter Notebook

### Conda environment

From within your activated conda environment:

```sh
conda install -i jupyter # iPython
conda install -i notebook # Notebook
jupyter notebook
```

















