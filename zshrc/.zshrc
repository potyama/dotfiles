autoload -Uz vcs_info

preexec() {
  _pre="$1"
}
precmd(){
        _r=$?
        case "${_pre}"  in
                cd*|git*|vi*|:)
                        vcs_info
                ;;
        esac
        _pre=""

        return ${_r}
}
      setopt prompt_subst
      zstyle ':vcs_info:*' enable git
      zstyle ':vcs_info:git:*' check-for-changes true
      zstyle ':vcs_info:git:*' stagedstr "%K{white}%F{yellow}"
      zstyle ':vcs_info:git:*' unstagedstr "%K{white}%F{red}"
      zstyle ':vcs_info:*' formats "%K{black}%F{white}Σ%F{green}%K{white}%c%u[%b]%f"
      zstyle ':vcs_info:*' actionformats '[%b|%a]'
      vcs_info


KYU="%K{black}%F{green}(乂'ω')きゅっ"
NYA="└('ω')┘ﾆｬｱｱｱｱｱｱｱｱｱｱ!!!!"

PROMPT="${KYU} %K{blue}%F{green}%K{green}%F{blue}%F{black}%~ %k%F{blue}%f"
RPROMPT='%f%b%k${vcs_info_msg_0_}%F{green}%K{black}Σ%F{green}%K{black} ${NYA}%f'

#alias
alias relogin='exec $SHELL -l'
alias vim='nvim'
alias emacs='nvim'
alias ls='exa'
alias cat='bat'
alias find='fd'
alias ps='procs'
alias grep='rg'
alias od='hexyl'


#pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

#pipenv
export PIPENV_VENV_IN_PROJECT=true
export PATH=$HOME/.local/bin:$PATH



export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
