# NVM

## NVM development workflow

Note that the `nvm use` step has been automated in the shell dotfiles through integration with the `PROMPT_COMMAND`. 
This causes the node version specified in the project `.nvmrc` file to be activated on entering the project directory.
( As well as activating the global version when exiting the project directory. )

```sh
# Create and enter project directory
mkdir my_project && cd $_

# Create a project nvm file specifying the desired <version>
echo <version> > .nvmrc

# Activate the node version as specified in the .nvmrc
# ( performed automatically by the PROMPT_COMMAND )
nvm use
```

## NodeJS version administration

### Listing versions

```sh
# List node versions available for installation
nvm ls-remote

# List installed node versions
nvm ls

# Show currently active node version
nvm version

# Show default node version
nvm alias default
```

### Installing versions

```sh
# Install latest node
nvm install node

# Install latest node version matching version specification major.minor.patch
# E.g. nvm install 10.1
nvm install <version>
```

### Setting versions

```sh
# Set the default <version>
nvm alias default <version>

# Use latest node in the current shell
nvm use node

# Use the latest node version matching version specification major.minor.patch
# E.g. nvm use 10.1
nvm use <version>

# Use the default version
nvm use default
```
