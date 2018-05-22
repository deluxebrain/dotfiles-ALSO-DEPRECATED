# Powerline

## Usage

Powerline is activated and configured at the user level within their .bashrc dotfile.

Running Powerline from a root shell means either configuring the root user .bashrc dotfile or elevating to a root shell without taking on the root user context. The latter is done as follows:

```sh
# Basically equivalent to sudo bash
sudo -s
```

## Configuration

Powerline is configured using its dotfiles located under `~/.config/powerline`. Per-user configuration is merged with the global powerline configuration (installed alongside Powerline).

The following command should be run to make any config changes take affect:

```sh
power-daemon --replace
```
