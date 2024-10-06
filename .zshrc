# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

export PATH=/Users/ccpn/.local/bin:$PATH
# Apple Silicon Homebrew path
export PATH="/opt/homebrew/bin:$PATH"
export PATH=$HOME/flutter/bin:$PATH
export PATH="/opt/homebrew/opt/python/libexec/bin:$PATH"
export PATH="/Users/ccpn/.bun/bin:$PATH"

# export JAVA_HOME="/usr/bin/java"
# export JAVA_HOME="/usr/local/opt/openjdk"
export JAVA_HOME=$(/usr/libexec/java_home -v 21.0.1)
export PATH=$JAVA_HOME/bin:$PATH
export PATH=$PATH:$(go env GOPATH)/bin


# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="powerlevel10k/powerlevel10k"

tn() {
  tmux new -s "$(pwd | sed 's/.*\///g')"
}

ta() {
	tmux attach
}

tf() {
if [[ $# -eq 1 ]]; then
        selected=$1
    else
        selected=$(find ~/dev/web ~/dev/mobile -mindepth 1 -maxdepth 1 -type d | fzf)
    fi

    if [[ -z $selected ]]; then
        return 0
    fi

    selected_name=$(basename "$selected" | tr . _)
    tmux_running=$(pgrep tmux)

    # If tmux is not running, start a new session
    if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
        tmux new-session -s "$selected_name" -c "$selected"
        return 0
    fi

    # If tmux is running, create a new session if it doesn't already exist
    if ! tmux has-session -t "$selected_name" 2> /dev/null; then
        tmux new-session -ds "$selected_name" -c "$selected"
    fi

    # If already inside a tmux session, switch to the selected one
    if [[ -n $TMUX ]]; then
        tmux switch-client -t "$selected_name"
    else
        # Attach to the session if running outside of tmux
        tmux attach-session -t "$selected_name"
    fi
}

nv() {
	# neovide --frame transparent
	nvim
}


plugins=(git)

source $ZSH/oh-my-zsh.sh

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

## [Completion]
## Completion scripts setup. Remove the following line to uninstall
[[ -f /Users/ccpn/.dart-cli-completion/zsh-config.zsh ]] && . /Users/ccpn/.dart-cli-completion/zsh-config.zsh || true
## [/Completion]
eval "$(fzf --zsh)"

export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:-1,fg+:#d0d0d0,bg:-1,bg+:#262626
  --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00
  --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf
  --color=border:#262626,label:#aeaeae,query:#d9d9d9
  --border="rounded" --border-label="Spotlight" --border-label-pos="0" --preview-window="border-rounded"
  --prompt="> " --marker=">" --pointer="◆" --separator="─"
  --scrollbar="│"'
alias lzd='lazydocker'
