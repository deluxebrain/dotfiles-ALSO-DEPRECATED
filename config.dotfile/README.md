# XDG Base Directory

Applications compliant with the XDG Base Directory specification store their data in one of three locations dependent on the data type.

Discovery of data storage location is performed using environment variables, as follows:

| Env var | Default value | Description |
| --- | --- | --- |
| XDG_CACHE_HOME | $HOME/.cache/ | cache data |
| XDG_CONFIG_HOME | $HOME/.config/ | app config and state |
| XDG_DATA_HOME | $HOME/.local/share/ | app user-created data |

For example, the *Powerline* application uses the XDG specification for configuration, and stores its application configuration in `$HOME/.config/powerline`.
