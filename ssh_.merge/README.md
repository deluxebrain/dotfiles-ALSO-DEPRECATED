# SSH 101

## File permissions

```sh
# drwx------
chmod 700 ~/.ssh ~/.ssh/config.d

# -rw-r--r--
chmod 644 ~/.ssh/config ~/.ssh/config.d/*

# -rw-------
chmod 600 ~/.ssh/*.pem

# -rw-r--r--
chmod 644 ~/.ssh/*.pub
```

## Overriding github setup to allow per account keypairs

```sh
# Config
Host github-<account>
    Hostname github.com
    User git
    PreferredAuthentications publickey
    IdentitiesOnly yes
    IdentityFile ~/.ssh/<account_id>

# Usage
$ git clone git@github-<account>:<account>/<repos>
```

## Using screen with ssh

### Basic screen usage

```sh
# List screen sessions
screen -ls

# Create and attach to session
screen -S <session>

# Detach from session
screen -d

# Attach to session
screen -dr <session>

# Kill detached session
screen -SX <session> quit

# Show if in session
echo $STY
```

### Automatic creation of screen session

```sh
# Config
Host MyHost
    RequestTTY force
    RemoteCommand screen -dR <session_name>
```
