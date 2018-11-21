# Powerline

## Configuration 101

The global Powerline configuration is installed alongside Powerline here:
`powerline_root/powerline/config_files`.

Where `powerline_root` can be determined as follows:

```sh
pip show powerline-status
```

Per-use configuration is provided by the Powerline dotfiles, located here:
`~/.config/powerline`.

Per-user configuration is *merged* at the file level with the global powerline configuration

Merging is performed at the file level, except for *lists*.
I.e. to change a list you need to redeclare the entire list.

## Configuring Powerline

Configuration changes should be linted before being applied, as follows:

```sh
powerline-lint -p ~/.config/powerline
```

Configuration changes are then applied as follows:

```sh
power-daemon --replace
```

## Notes

### Installation and the powerline-daemon daemon

Powerline installs a daemon process to help speed up prompt generation.
When Powerline is installed through pip, pip will attempt to compile and install
the daemon as an executable. If this fails, it will fall back a Python script.
The compiled daemon should be used in preference as it is considerably quicker at evaluating the prompt.

For pip to install Powerline as an executable a `c` complilation environment has to be
available from Python.
This is provided by the `build-essential` apt package.

The version of the daemon running can be found as follows:

```sh
file `pyenv which powerline-daemon`
```

### Using Powerline with pyenv

Installing Powerline into pyenv managed Python versions leads to the following issues:

- Prompt responsivess becomes very slow
- Unable to use Powerline outside of its pyenv python version

The latter issue could be resolved in one of two ways:

- Reference the pyenv python version belonging to powerline from all referencing pyenv python versions
- Install powerline into all pyenv python versions

However, both of these solutions leads to dependency issues with referencing pyenv Python versions.

In the former solution, the pyenv python version will be written into the referencing pyenv python versions
`.python-version` file.

In the second solution, the Powerline pip package will be written into the referencing pyenv python versions
requirements file.

For this reason, it should be installed into the system Python as part of the global
Python development envionment for the user.

### Usage from root shell

Powerline is activated and configured at the user level within the `.bashrc` dotfile.

Running Powerline from a root shell means either configuring the root user `.bashrc` dotfile or elevating to a root shell without taking on the root user context. The latter is done as follows:

```sh
# Basically equivalent to sudo bash
sudo -s
```
