# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=/Users/zacksmith/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="powerlevel9k/powerlevel9k"

#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(background_jobs node_version)


# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
 #ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
 COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
 HIST_STAMPS="yyyy-mm-dd"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm thefuck yarn z)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

upfind() {
  while [[ "$PWD" != / ]]; do
    res=$(find "$PWD" -maxdeptch 1 -type f -iname "$1")
    if [[ ! -z "$res" ]]; then
      echo "$res"
      exit 0
    fi
    cd ..
  done
}

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ls="lsd -lah"
alias cask="brew cask"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/zacksmith/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/zacksmith/.config/yarn/global/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/zacksmith/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/zacksmith/.config/yarn/global/node_modules/tabtab/.completions/sls.zsh

#export PATH="$PATH:`yarn global bin`"
export PATH="$PATH:$HOME/.config/yarn/global/node_modules/.bin"

brew-update() {
  brew update && brew upgrade --formulae && brew cleanup
}

vundle-update() {
  vim +PluginUpdate +qall
}

antigen-update() {
  antigen update
}

update-all() {
  brew-update && vundle-update && antigen-update
}

dash() {
  open "dash://$1:$2"
}

export PATH=$PATH:~/flutter/bin

cloc-git() {
  git clone --depth 1 "$1" temp-linecount-repo &&
  printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
  scc temp-linecount-repo &&
  rm -rf temp-linecount-repo
}

export PATH="/usr/local/sbin:$PATH"

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env --use-on-cd`"
export PATH=/Users/zacksmith/.fnm/current/bin:$PATH
export FNM_MULTISHELL_PATH=/Users/zacksmith/.fnm/current
export FNM_DIR=/Users/zacksmith/.fnm/
export FNM_NODE_DIST_MIRROR=https://nodejs.org/dist
export FNM_LOGLEVEL=all
export FNM_COREPACK_ENABLED=true
export FNM_RESOLVE_ENGINES=true

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/zacksmith/projects/vslr/lunchbot/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/zachsmit/projects/vslr/lunchbot/node_modules/tabtab/.completions/slss.zsh

#export JAVA_HOME=/Applications/Android\ Studio\ Preview.app/Contents/jre/Contents/Home
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

eval $(thefuck --alias)
alias dockernuke="docker system prune -a --volumes --force"

eval "$(starship init zsh)"

# ANTIGEN PACKAGES
source $(brew --prefix)/share/antigen/antigen.zsh
antigen use oh-my-zsh

antigen bundle docker-compose
antigen bundle git
antigen bundle z
antigen bundle changyuheng/fz
antigen bundle Aloxaf/fzf-tab
antigen bundle zsh-users/zsh-syntax-highlighting
# antigen bundle zsh-users/zsh-autosuggestions
antigen bundle colored-man-pages
antigen bundle unixorn/autoupdate-antigen.zshplugin
antigen bundle MichaelAquilina/zsh-you-should-use
antigen bundle akoenig/npm-run.plugin.zsh
antigen bundle zsh-users/zsh-history-substring-search

antigen cache-gen

case `uname` in
  Darwin)
    # Commands for OS X go here
    antigen bundle osx
  ;;
  Linux)
    # Commands for Linux go here
  ;;
esac

# workaround for https://github.com/zsh-users/antigen/issues/675
THEME=robbyrussell

antigen list | grep $THEME; if [ $? -ne 0 ]; then antigen theme $THEME; fi
# antigen theme robbyrussell

antigen apply

listening() {
  sudo lsof -i -P | grep LISTEN
}
# kill process on port lol
kpop() {
  if [ $# -eq 0 ]; then
    echo "Must provide a port"
    return
  fi

  lsof -ti ":$1" | xargs kill -9
}

nukenm() {
  find . -name "node_modules" -type d -prune -print -exec rm -rf '{}' \;
}

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH=$(brew --prefix openssl)/bin:$PATH
export PATH="$HOME/.rover/bin:$PATH"

export CRUMBL_ROOT="~/projects/crumbl/crumbl"
alias yarnx="rm -rf node_modules && yarn install"
alias retype="pushd $CRUMBL_ROOT/packages/types >/dev/null && yarn build && popd >/dev/null && yarnx"
export GPG_TTY=$(tty)

# bun completions
[ -s "/Users/zacksmith/.bun/_bun" ] && source "/Users/zacksmith/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(zoxide init zsh)"

