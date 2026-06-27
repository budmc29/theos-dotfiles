export ZSH=~/.oh-my-zsh
export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:$path"

export TERM=xterm-256color
ZSH_THEME="daveverwer"

plugins=(fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

export LANG=en_US.UTF-8

# History
HIST_STAMPS="dd/mm/yyyy"
export HISTSIZE=2000
export HISTFILE="$HOME/.history"
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE

# Functions
#
#

function catless() {
  if [ $1 ]; then
    cat $1 | less
  else
    echo 'Usage: catless filename'
  fi
}

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'
export VISUAL='vim'

# Work aliases, keep private
source ~/.aliases

source ~/.work_config

export PROJECTS_HOME=${HOME}/projects

export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"

export PATH=$HOME/bin:$PATH

# Attach to existing tmux session or create a new one
if [[ -z "$TMUX" ]] ;then
  tmux attach-session 2>/dev/null || tmux new-session
fi

set -o vi
export PATH="$HOME/.local/bin:$PATH"

# bun completions
[ -s "/Users/mugurel-teodor.chirica/.bun/_bun" ] && source "/Users/mugurel-teodor.chirica/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# NODE_AUTH_TOKEN is loaded from ~/.secrets (gitignored) — never store inline
export NODE_AUTH_TOKEN=${NODE_AUTH_TOKEN:-}

# Lendable
export AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID:-117771453557}

# Load secrets (gitignored) — override any defaults above
[ -f "$HOME/.secrets" ] && source "$HOME/.secrets"

# Added by git-ai installer on Thu Apr 16 19:40:49 BST 2026
export PATH="/Users/mugurel-teodor.chirica/.git-ai/bin:$PATH"

. "$HOME/.local/bin/env"

# uv completions
eval "$(uv generate-shell-completion zsh)"
eval "$(uvx --generate-shell-completion zsh)"

# fnm
FNM_PATH="/Users/mugurel-teodor.chirica/Library/Application Support/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="$FNM_PATH:$PATH"
  eval "$(fnm env --shell zsh)"
fi
source ~/.safe-chain/scripts/init-posix.sh # Safe-chain Zsh initialization script

# Generated for envman. Do not edit.
[ -s "$HOME/.config/envman/load.sh" ] && source "$HOME/.config/envman/load.sh"

# Default Claude Code to Opus 4.8 (1M context). The org-managed policy cached at
# ~/.claude/remote-settings.json otherwise resets the model to Sonnet 4.6 on every
# launch; this --model override beats it. Override per run with e.g.
# `claude --model sonnet` (the last --model on the line wins). Bypass with `command claude`.
# Effort/thinking is set separately in ~/.claude/settings.json (effortLevel: xhigh).
claude() { command claude --model 'claude-opus-4-8[1m]' "$@"; }
