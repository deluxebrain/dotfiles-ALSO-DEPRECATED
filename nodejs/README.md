# NVM

## NodeJS administration

```sh
# List remote node versions
nvm ls-remote

# List install node versions
nvm ls

# Install latest node
nvm install node

# Install latest node with major version x
nvm install x
```

## Using NodeJS versions

```sh
# Use latest node in the current shell
nvm use node

# Use the latest node with major version x in the current shell
nvm use x

# Check current version
nvm version

# Stop using the set node version
nvm use default
```

## Development workflow

```sh
# Create and enter project directory
mkdir my_project && cd $_

# Create a project nvm file specifying the desired version
echo "8" > .nvmrc

# Activate the node version
nvm use
# Or using bash PROMPT_COMMAND integration
# ( just enter / exit project directory )
```
