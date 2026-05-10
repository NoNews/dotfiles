# dotfiles

Config for bash, tmux, ghostty. Symlinked to home dir.

## Structure

```
bash/functions.sh     — shared functions (compu, help)
tmux/tmux.conf        — tmux config
ghostty/config        — ghostty config
```

## Setup (new machine)

```bash
./install.sh
source ~/.bash_profile
```

One-time. After that, edit files directly and commit.

## Machine-local stuff

Anything not for git goes in `~/.bash_profile.local` — paths, project shortcuts, secrets. Never committed.
