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

    As architected in these dotfiles `pyenv-virtualenv` is intended to be used purely integration with miniconda.
    If you find yourself writing `pyenv virtualenv` outside of conda projects please use `pipenv` instead.

5. pip

    Used for installing packages into pyenv Python versions, or virtual environments.
    In all other cases package management is natively provided by both `conda` and `pipenv`.
    E.g. `pipenv install <package>`.

## PyEnv 101

### Setting Python versions

```sh
# Set project-level Python version
# Writes down Python version in .python-version file in cwd
# Can use multiple versions, e.g. to fallback to globalenv Python environment
pyenv local <version>
pyenv local <version> globalenv

# Set global Python version used in all shells
# Writes down Python version in ~/.pyenv/version file
# Override using .python-version file or PYENV_VERSION environment variable
# Can use multiple versions
pyenv global <env_1> <env_2>

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

## Conda 101

### Basic workflow when used with pyenv

```sh
# Create conda environment
# Note we are using pyenv-virtualwrapper to achieve this (see notes section)
pyenv virtualenv <version> <name>
pyenv local <name>

# Conda environment will now automatically load on enter/exit of project directory
# To load automatically
pyenv activate <name>
pyenv deactivate <name>
```

### Managing environments

```sh
# List all environments
# Note the active environment is flagged with a *
conda env list

# Removing an environment
conda env remove --name <name> --all

# List packages installed in environment
conda list [-n <name>]
```

### Sharing environments

```sh
# Export active environment file
conda env export > environment.yml

# Create environment from environment file
conda env create -f environment.yml
```

## Pipenv 101

### NOTE 20181119

Using `pipenv install` to create a env pipenv environment using pyenv managed python no longer appears to work.
Use `pipenv --python $(pyenv which python)` instead.

### Standard workflow

```sh
# Create and enter project directory
mkdir <project> && cd $_

# Initialize Pipenv
# Note will install from a Pipfile if present
# If PIPENV_PYTHON environment variable is set it will will pyenv Python version
# Else provide python version explicitly using --python option
# Will generate Pipfile and Pipefile.lock files, both of which should be added to source control
pipenv install --python <version>

# Install production dependencies
pipenv install <package>

# Install development dependencies
# E.g. unit testing packages
pipenv install --dev <package>

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

# Create conda environment
pyenv virtualenv <version> <name>

# Use conda environment locally
pyenv local <version>

# Install dependencies
conda install -y <package>
```

### Pipenv project

```sh
# Create and enter project directory
mkdir foo && cd $_

# Set local Python version
pyenv local 3.7.1

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

First, create your pipenv based project as above. Then proceed as follows:

```sh
pipenv install jupyter

pipenv run jupyter notebook
```

## Notes

### pyenv-virtualenv

Plugin for `pyenv` to provide `virtualenv` and `conda` environments for Python.
These provide isolated working copies of Python which prevent one project and its dependencies affecting another.

Note that `pyenv-virtualenv` is being used for a couple of explicit reasons related to the setup of the system, as follows:

1. conda integration with pyenv

    `pyenv-virtualenv` provides `conda` integrations with `pyenv` to allow `conda` to work properly with Python versions managed by `pyenv`.

    See below

2. Provision of global virtual environment

    See below.

### Using VirtualEnv for virtual environment management

```sh
# Create project virtualenv
pyenv virtualenv <version> <name>

# To manually activate / deactive the virtual environment
pyenv activate <name>
pyenv deactivate

# Use the virtualenv as part of a pyenv environment
pyenv local <name>
```

E.g. the following would create a global virtual environment for the installation of common packages.
This helps preserve the system python by preventing packages being directly installed into it.

```sh
pyenv virtualenv 3.7.1 globalenv
pyenv activate
pip install <package>
pyenv deactivate
pyenv global 3.7.1 globalenv
```

### Creating global Python environment

Python is used in several ways on a development machine:

- As a project runtime within Python projects;
- Project-level development dependencies, such as testing frameworks;
- Machine-wide development dependencies, such as the AWS cli, Powerline, etc;

All use of Python outside of the latter are performed at the project level and can be isolated from system python through pyenv and pipenv.

Machine-wide usage of Python is more problematic. The following approaches are possible:

- Direct usage of the system Python
- Usage of Python version managed through pyenv
- Usage of Python virtual environment through virtualenv

Where-ever possible the system Python should be preserved - i.e. neither updated nor have any pip packaged installed into it. Therefore any approach will need to use a version of Python managed by pyenv.

As far as isolation is concerned, the ideal solution would be to use a global virtual environment in addition to a pyenv managed Python version. This would allow global Python packages to be installed into a dedicated virtual environment, therefore keeping the associated pyenv Python version clean. For example:

```sh
pyenv virtualenv 3.7.1 globalenv
pyenv activate
pip install awscli
pyenv deactivate
# Set global Python, including a reference to the global env
pyenv global 3.7.1 globalenv
```

However, for this to work, the global virtual environment would need to be referenced by the local python version in order for it to resolve global packages. This then leads to the global virtual environment becoming a development dependency through it being referenced in the project-level .python-version file. For example:

```sh
pyenv local 3.7.1 globalenv
cat .python-version # references globalenv
```

This leaves the remaining option of just installing Python packages directly into a pyenv managed Python version and using this Python version globally. For example:

```sh
pyenv global 3.7.1
pip install awscli
```

Any project-level dependency on Python 3.7.1 ( in the above case ) can access the globally installed packages.

However, for this to work, all global packages need to be installed into all Python versions installed through pyenv. E.g. in the above case Python 3.7.0 projects would not be able to access the awscli package.

Note that from the perspective of a development machine, and unlike the system Python, there is no particular need to keep pyenv managed Python versions clean of global dependencies. The Python version is both a runtime and a development environment, with the key issue being able to prevent the latter from affecting the specification of the former. And at the end of the day, Python versions managed with pyenv can be removed and reinstalled with ease.

### Using conda with pyenv

As per all Python versions, conda is installed through pyenv.

With pyenv-virtualenv installed, it is then possible to use conda in the normal way. E.g.

```sh
# Use miniconda
pyenv local miniconda

# Create named conda environment
# By default will use the current Python version
conda create -n <name> [python=<version>]

# Activate environment
conda activate

# Deactivate environment
conda deactivate
```

However, this approach ends up with inconsistent virtual environments, as follows:

```sh
pyenv install miniconda
```

This creates a pyenv version for miniconda that is actually a virtual environment, as demonstrated as follows:

```sh
pyenv virtualenvs
```

However, conda environments from within this conda Python version do not appear as virtual environments.
For example, the following will not create any additional virtual environments:

```sh
pyenv activate <name>
echo $VIRTUAL_ENV   # points to <name>
conda create -yn <env>
echo $VIRTUAL_ENV   # still points to <name>
pyenv virtualenvs   # <env> not listed
```

This causes issues with Powerline, as it uses the following quasi-logic to determine the enviromnment name to display:

- Is $VIRTUAL_ENV set? Then display environment name given by $VIRTUAL_ENV
- Else is $CONDA_DEFAULT_ENV set? Then display environment given by $CONDAA_DEFAULT_ENV

Due to the above issues of inconsistencies, Powerline will always use the pyenv conda version name as the environment name.

It also causes the inconvenience that the conda environment is not automatically activated on entering the project directory.

The correct approach is therefore to use pyenv-virtualenv to manage conda virtual environments, as follows:

```sh
# Use a pyenv-virtualenv to create a virtual environment to act as the conda environment
pyenv virtualenv <version> <name>
pyenv local <name>

# Verify conda recognises the virtual environment as a conda environment
conda env list
```

#### NOTE 20181119

Due to a bug with pyenv / pyenv-virtualwrapper, the above approach to managing conda virtual environment using
pyenv-virtualenv does not work.

See here: https://github.com/pyenv/pyenv-virtualenv/issues/178

The suggested solution is implemented in the Python provisioner.
