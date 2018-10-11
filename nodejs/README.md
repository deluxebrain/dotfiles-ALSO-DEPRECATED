# NVM

## NVM development workflow

Note that the `nvm use` step has been automated in the shell dotfiles through integration with the `PROMPT_COMMAND`. This causes the node version specified in the project `.nvmrc` file to be activated on entering the project directory.

```sh
# Create and enter project directory
mkdir my_project && cd $_

# Create a project nvm file specifying the desired version
echo "8" > .nvmrc

# Activate the node version
nvm use
```

## NodeJS version administration

### Listing versions

```sh
# List remote node versions
nvm ls-remote

# List installed node versions
nvm ls

# Show default version
nvm alias default

# Show current version
nvm version
```

### Installing versions

```sh
# Install latest node
nvm install node

# Install latest node with major VERSION
nvm install [VERSION]
```

### Setting versions

```sh
# Set the default VERSION
nvm alias default VERSION

# Use the default version
nvm use default

# Use latest node in the current shell
nvm use node

# Use the latest node with major VERSION in the current shell
nvm use [VERSION]
```
