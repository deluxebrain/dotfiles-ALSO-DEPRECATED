# Ruby

## RVM 101

RVM allows for the installation of multiple ruby interpreters and runtimes.

The basis usage is as follows:

```sh
# List ruby versions available for installation
rvm list known

# Install ruby version
rvm install <version>

# List installed ruby versions
rvm list

# Use ruby version
rvm use <version>
ruby -v

# Show information about current ruby version
rvm info

# Set default version
rvm --default use <version>

# Use system ruby
rvm use system
```

## RVM project workflow

RVM supports automatic project-level ruby configuration using a few different techniques.

### .rvmrc file

The richest approach is via a project-level `.rvmrc` file.
This allows for full scripting, however it requires explicit rvm trust.

```sh
# Create .rvmrc file with specified version
rvm --create --rvmrc use <version>@<project>

# Trust the file
rvm rvmrc trust /path/to/project
```

### .ruby-version

```sh
rvm use --ruby-version <version>
```

## Notes

### RVM install

Note that RVM should be installed using the generic script installer and not via any OS package manager.

For example, the Ubuntu RVM package installs RVM in multi-user mode outside of the users home directory.
This leads to complexity around managing user group permissions ( via the `rvm` group ) and requires the usage
of `rvmsudo` for various features.

E.g. I have been unable to get `rvm get stable` to work without prefixing it with `rvmsudo`.
