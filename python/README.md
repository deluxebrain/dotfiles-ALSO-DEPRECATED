# Python

## Overview of tools

These tools are used to solve the following problems associated with Python development - managing muliple versions of Python on the same system, and providing project-level isolation of Python dependencies.

1. pyenv

    Used to isolate Python versions allowing multiple versions of Python to coexist and without impacting the system Python. 
    Provides support for specifying Python version at the project level using the `pyenv local <version>` command.

2. pipenv

    Tool that provides complete Python development tooling, including virual environment and dependency management.    
    Note that `pipenv` has no support for `conda` and hence is only Intended to be used for non-`conda` projects.
    By default uses the Python it is installed against to create virtual environments. This can be overriden using the `--python` option or by setting the `PIPENV_PYTHON` environment variable.

3. miniconda

    Python environment for data science that combines a Python runtime as well as virtual environment and package management. Used in preference to `anaconda` which also comes prebundles with a lot of data science packages. The mini/anaconda Python environment comes packaged with the Intel Math Kernel Library (mkl) versions of `NumPy`, etc.

4. pyenv-virtualenv

    As architected in these dotfiles `pyenv-virtualenv` is intended to be used purely for system setup and integration.
    If you find yourself writing `pyenv virtualenv` please stop and use `pipenv` or `conda` instead.

5. pip

    Note that `pip` is not actually used. Package management is natively provided by both `conda` and `pipenv`.

## PyEnv 101

### Setting Python versions

```sh
# Set local application-specific Python version
# Writes down Python version in .pyenv-version file in cwd
# Can use multiple versions, e.g. to fallback to global Python 
pyenv local <version>
pyenv local <version> global
 
# Set global Python version used in all shells
# Writes down Python version in ~/.pyenv/version file
# Override using .pyenv-version file or PYENV_VERSION environment variable
# Can use multiple versions
pyenv global <version>

# Set global Python to system Python ( as determined by your $PATH )
pyenv global system 

# Show current Python version
pyenv version
```

### Installing Python versions

```sh
# List Python versions available to install
pyenv install --list

# Install Python <version>
pyenv install <version>

# Show installed Python versions
pyenv versions
```

## Pipenv 101

### Standard workflow

```sh
# Create and enter project directory
mkdir <project> && cd $_

# Install Pipenv
# Note will install from a Pipfile if present
pipenv install --python <version>

# Install production dependencies
pipenv install <package>

# Install development dependencies
# E.g. unit testing packages
pipenv installl --dev <package>

# Generate Pipfile listing all project dependencies
pipenv lock

# Activate Pipenv shell
pipenv shell
python --version

# Run Python script in Pipenv virtual environment
pipenv run python <script>
```

## Suggested development workflows

### Conda project

```sh
# Create and enter project directory
mkdir foo && cd $_

# Set local Python <version>
pyenv local miniconda3-<version>

# Create conda environment
conda create -y -n <name>

# Activate conda environment
conda activate <name>

# Install dependencies
conda install -y <package>

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

# Create pipenv environment
# Override Python version using --python option
# ( $PIPENV_PYTHON environment variable )
pipenv install --python `pyenv which python`

# Install dependencies
pipenv install <package>

# Run Python script 
pipenv run python <script>

# Enter pipenv environment shell
pipenv shell
```

## Jupyter Notebook workflows

Note that the `jupyter` package installs both `notebook` and `ipykernel` as dependencies.

### Conda environment workflow

From within your activated conda environment:

```sh
conda install -y jupyter

# Allow the current environment to be accessed from notebook
conda install -y nb_conda

# Launch the Jupyter server
# Pulls in configuration from ~/.jupyter/jupyter_notebook_config.py
jupyter notebook
```

### Pipenv environment workflow

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

    Where-ever possible Python pacakges should be installed in per-project virtual environments.

    However, some Python packages are genuinely required system-wide in that they are either needed across or outside of project specific work.

    Such Python packages are installed in the `global` virtual environment which is created using `pyenv-virtualenv`.

    For example, `pipenv` is installed into the global virtual enironment to allow it to be used for the creation of per-project virtual environments.

### Using VirtualEnv for virtual environment management

This is just FYI - use conda or pipenv in preference.

```sh
# Create project virtualenv
pyenv virtualenv <version> <name>

# Create and enter project directory
mkdir foo && cd $_

# Set local python environment
pyenv local <name>

# To manually activate / deactive the virtual environment
pyenv activate <name>
pyenv deactivate
```
