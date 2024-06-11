# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Homebrew shell completions
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
  autoload -Uz compinit && compinit
fi

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light-mode depth=1 for \
  romkatv/powerlevel10k \
  OMZL::git.zsh \
  OMZL::grep.zsh \
  OMZL::history.zsh \
  blockf OMZL::completion.zsh

POWERLEVEL9K_DISABLE_CONFIGURATION_WIZARD=true
# Load PowerLevel10K
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zinit wait lucid light-mode depth=1 for \
  atinit"zicompinit; zicdreplay" \
  zdharma-continuum/fast-syntax-highlighting \
  zdharma-continuum/history-search-multi-word \
  atload"bindkey '^[[A' history-substring-search-up; \
         bindkey '^[[B' history-substring-search-down" \
  zsh-users/zsh-history-substring-search \
  zsh-users/zsh-autosuggestions \
  chitoku-k/fzf-zsh-completions \
  joshskidmore/zsh-fzf-history-search \
  OMZ::plugins/git/git.plugin.zsh \
  OMZ::plugins/pip/pip.plugin.zsh \
  OMZ::plugins/dotenv/dotenv.plugin.zsh \
  OMZ::plugins/python/python.plugin.zsh \
  OMZ::plugins/common-aliases/common-aliases.plugin.zsh \
  MichaelAquilina/zsh-autoswitch-virtualenv \
  MichaelAquilina/zsh-you-should-use \
  supercrabtree/k

eval $(thefuck --alias)

# fzf configs - ctrl-t for filesystem, ctrl-r for command history (latter will replace history-search-multi-word)
export FZF_DEFAULT_OPTS='--height 40% --layout=reverse'
source <(fzf --zsh)

# anyframe configs - ctrl-t-ctrl-t for files, ctrl-r-ctrl-r for command history, ctrl-m-ctrl-m change directory
zinit light mollifier/anyframe
zstyle ":anyframe:selector:" use peco
bindkey '^m^m' anyframe-widget-cdr
autoload -Uz chpwd_recent_dirs cdr add-zsh-hook
add-zsh-hook chpwd chpwd_recent_dirs
bindkey '^r^r' anyframe-widget-execute-history
bindkey '^r^p' anyframe-widget-put-history
bindkey '^g^b' anyframe-widget-insert-git-branch  # anyframe-widget-checkout-git-branch seems broken
bindkey '^t^t' anyframe-widget-insert-filename
alias aw=anyframe-widget-select-widget

# zoxide for jumping directories
eval "$(zoxide init --cmd cd zsh)"

# vim-like prompt keybinds
bindkey '^j' backward-word
bindkey '^k' forward-word
bindkey '^h' backward-char
bindkey '^l' forward-char

export TERM='xterm-256color'

case `uname` in
  Darwin)
    alias ls='gls -laGv --color=auto --group-directories-first'
    ;;
  Linux)
    alias ls='ls -laGv --color=auto --group-directories-first'
    ;;
esac

alias shutdown='sudo /sbin/shutdown -h now'

alias gl='git status --porcelain'
alias gc='git commit'
alias ga='git add'
alias gpu='git push'
alias gpl='git pull'
alias gco='git checkout'
alias gd='git diff'
alias gb='git branch'
alias gbl='git branch --list'
alias gm='git merge'
alias ggls='for f in $(find . -name .git -a -type d); do d=${f%/.git}; echo ---- $d; (cd $d; git status --porcelain); done'
#alias addM='git status --porcelain | grep "^.M " | cut -c4- | xargs git add'
#alias addQ='git status --porcelain | grep "^?? " | cut -c4- | xargs git add'
#alias addD='git status --porcelain | grep "^.D " | cut -c4- | xargs git rm'

alias kc='kubectl'

alias vimrc='vim ~/.vim/vimrc'

export SHELL=$(which zsh)
export EDITOR=vim
export PATH="/usr/local/Cellar/python@3.9/3.9.5/Frameworks/Python.framework/Versions/3.9/bin:$PATH"

if type "direnv" > /dev/null; then
  eval "$(direnv hook zsh)"
fi

if type "docker-machine" > /dev/null; then
  eval "$(docker-machine env default)"
  export DOCKER_HOST_ADDR=$(docker-machine ip)
fi

# node version manager
if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  export NVM_DIR="$HOME/.nvm"
  . /usr/local/opt/nvm/nvm.sh
fi
