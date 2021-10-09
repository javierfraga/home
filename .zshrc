#######################################################################
#                               PROMPT                                #
#######################################################################
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# https://unix.stackexchange.com/questions/53789/whats-the-newline-symbol-in-zshs-ps1
# Enable colors and change prompt:
autoload -U colors && colors
NEWLINE=$'\n'
PROMPT='%F{red}[%f''%F{yellow}${USER}%f''%F{green}@%f''%F{blue}${HOST}%f''%F{red}]%f'' %~${NEWLINE}${CWDIR}'

#######################################################################
#                                 GIT                                 #
#######################################################################
#https://git-scm.com/book/en/v2/Appendix-A%3A-Git-in-Other-Environments-Git-in-Zsh
#https://salferrarello.com/zsh-git-status-prompt/
# Autoload zsh add-zsh-hook and vcs_info functions (-U autoload w/o substition, -z use zsh style)
autoload -Uz add-zsh-hook vcs_info
# Enable substitution in the prompt.
setopt prompt_subst
# Run vcs_info just before a prompt is displayed (precmd)
add-zsh-hook precmd vcs_info
RPROMPT='%F{red}${vcs_info_msg_0_}%f'

# Enable checking for (un)staged changes, enabling use of %u and %c
zstyle ':vcs_info:*' check-for-changes true
# Set custom strings for an unstaged vcs repo changes (*) and staged changes (+)
zstyle ':vcs_info:*' unstagedstr ' *'
zstyle ':vcs_info:*' stagedstr ' +'
# Set the format of the Git information for vcs_info
zstyle ':vcs_info:git:*' formats       '(%b%u%c)'
zstyle ':vcs_info:git:*' actionformats '(%b|%a%u%c)'

#######################################################################
#                               YouTube                               #
#######################################################################
# YouTube ref config: zsh: Syntax Highlighting, vi-mode, Autocomplete, more
# YouTube ref config: https://www.youtube.com/watch?v=eLEo4OQ-cuQ
#History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -U compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
compinit
#autocompletion of privileged environments in privileged commands (e.g. sudo)
zstyle ':completion::complete:*' gain-privileges 1
# Include hidden files.
_comp_options+=(globdots)

# vi mode
EDITOR='nvim'
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

#######################################################################
#                               ctrl-o                                #
#######################################################################
# Use lf to switch directories and bind it to ctrl-o
lfcd () {
    tmp="$(mktemp)"
    lf -last-dir-path="$tmp" "$@"
    if [ -f "$tmp" ]; then
        dir="$(cat "$tmp")"
        rm -f "$tmp"
        [ -d "$dir" ] && [ "$dir" != "$(pwd)" ] && cd "$dir"
    fi
}
bindkey -s '^o' 'lfcd\n'

#######################################################################
#                               ctrl-e                                #
#######################################################################
# Edit line in vim with ctrl-e:
autoload edit-command-line; zle -N edit-command-line
bindkey '^e' edit-command-line

#######################################################################
#                        Reverse Search Lookup                        #
#######################################################################
bindkey '^R' history-incremental-search-backward

# Load aliases and shortcuts if existent.
[ -f "$HOME/.alias" ] && source "$HOME/.alias"

#######################################################################
#                                conda                                #
#######################################################################
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/Caskroom/miniconda/base/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh" ]; then
        . "/usr/local/Caskroom/miniconda/base/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/Caskroom/miniconda/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

#######################################################################
#                              selenium                               #
#######################################################################
export PATH="/Users/jf732h/selenium:$PATH"

#######################################################################
#                                 NVM                                 #
#######################################################################
export NVM_DIR="$HOME/.nvm"
[ -s "/usr/local/opt/nvm/nvm.sh" ] && . "/usr/local/opt/nvm/nvm.sh"  # This loads nvm
[ -s "/usr/local/opt/nvm/etc/bash_completion.d/nvm" ] && . "/usr/local/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

#######################################################################
#                              Functions                              #
#######################################################################
function getenm() {
    if [ -z "$1" ]; then
        echo "Missing node argument to search for"
    else
        csvfile=$(lynx -dump http://155.165.129.44/LabConfigs/EricssonLabConfig/ | \grep 'LabConfig-' | tail -n 1 | awk -F' ' '{print $2}')
        wget -qO- ${csvfile} | awk -F',' '{print $1 "\t" $4}' | sort | uniq | grep -i $1
    fi
}


#######################################################################
#                       zsh-syntax-highlighting                       #
#######################################################################
#Load zsh-syntax-highlighting; should be last.
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
