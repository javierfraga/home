#######################################################################
#                               PROMPT                                #
#######################################################################
# https://scriptingosx.com/2019/07/moving-to-zsh-06-customizing-the-zsh-prompt/
# https://zsh.sourceforge.io/Doc/Release/Prompt-Expansion.html
# https://unix.stackexchange.com/questions/53789/whats-the-newline-symbol-in-zshs-ps1
# https://superuser.com/questions/1092033/how-can-i-make-zsh-tab-completion-fix-capitalization-errors-for-directories-and
# Enable colors and change prompt:
autoload -U colors && colors
NEWLINE=$'\n'
PROMPT='%F{red}[%f''%F{yellow}${USER}%f''%F{green}@%f''%F{blue}${HOST}%f''%F{red}]%f'' %F{green}%~%f''${NEWLINE}'
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'

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
#https://stackoverflow.com/questions/24513873/git-tab-completion-not-working-in-zsh-on-mac
#History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zsh/history

# Basic auto/tab complete:
autoload -Uz compinit && compinit
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

#######################################################################
#                                ALIAS                                #
#######################################################################
[ -f "$HOME/.alias" ] && source "$HOME/.alias"



# Begin Confgirations specific to individual computer #
# ................................................... #

#######################################################################
#                              LunarVim                               #
#######################################################################
export PATH=/Users/javier/.local/bin:$PATH

#######################################################################
#                              neovim / nvim                          #
#######################################################################
export PATH="/Users/javier/nvim-macos-arm64-v0.10.0/bin:$PATH"

#######################################################################
#                              selenium / chromedriver                #
#######################################################################
export PATH="/Users/javier/selenium:$PATH"

#######################################################################
#                              Scripts                                #
#######################################################################
export PATH="/Users/javier/.scripts:$PATH"

#######################################################################
#                     Default best  vi editor available               #
#######################################################################
export EDITOR=$(command -v lvim || command -v nvim || command -v vim || command -v vi)
export VISUAL="$EDITOR"

#...................................................... #
#   End Confgirations specific to individual computer   #


#######################################################################
#                              zsh-completions                        #
#######################################################################
# https://github.com/zsh-users/zsh-completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH

  autoload -Uz compinit
  compinit
  # The <(...) syntax is called process substitution.
  # It runs the command inside (...),
  # then treats the output as if it were a file and sources it.
  source <(kubectl completion zsh)
  source <(minikube completion zsh)
  source <(docker completion zsh)
  source <(chezmoi completion zsh)
fi

#######################################################################
#                                 Chezmoi                             #
#######################################################################
ch() {
    chezmoi "$@"
}
# Ensure completion is correctly assigned
if [[ -n ${functions[_chezmoi]} ]]; then
    compdef ch=chezmoi
fi

# MUST BE AT END
#######################################################################
#                       zsh-syntax-highlighting                       #
#######################################################################
#Load zsh-syntax-highlighting; should be last.
#                              Functions                              #
# source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
