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
plugins=(git npm thefuck yarn)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

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
alias ls="exa -lah"
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
  brew update && brew upgrade --greedy && brew upgrade --cask && brew cleanup
}

dash() {
  open "dash://$1:$2"
}

export PATH=$PATH:~/flutter/bin

cloc-git() {
  git clone --depth 1 "$1" temp-linecount-repo &&
  printf "('temp-linecount-repo' will be deleted automatically)\n\n\n" &&
  cloc temp-linecount-repo &&
  rm -rf temp-linecount-repo
}

# fnm
export PATH=$HOME/.fnm:$PATH
eval `fnm env`

export PATH="/usr/local/sbin:$PATH"

# fnm
export PATH=$HOME/.fnm:$PATH
eval "`fnm env`"
export PATH=/Users/zacksmith/.fnm/current/bin:$PATH
export FNM_MULTISHELL_PATH=/Users/zacksmith/.fnm/current
export FNM_DIR=/Users/zacksmith/.fnm/
export FNM_NODE_DIST_MIRROR=https://nodejs.org/dist
export FNM_LOGLEVEL=all

      autoload -U add-zsh-hook
      _fnm_autoload_hook () {
        if [[ -f .node-version && -r .node-version ]]; then
          echo "fnm: Found .node-version"
          fnm use
        elif [[ -f .nvmrc && -r .nvmrc ]]; then
          echo "fnm: Found .nvmrc"
          fnm use
          export NODE_VERSION=$(node -v)
        fi
      }

      add-zsh-hook chpwd _fnm_autoload_hook \
        && _fnm_autoload_hook
    

# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/zacksmith/projects/vslr/lunchbot/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/zachsmit/projects/vslr/lunchbot/node_modules/tabtab/.completions/slss.zsh

#export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
#export ANDROID_HOME=$HOME/Library/Android/sdk
#export PATH=$PATH:$ANDROID_HOME/emulator
#export PATH=$PATH:$ANDROID_HOME/tools
#export PATH=$PATH:$ANDROID_HOME/tools/bin
#export PATH=$PATH:$ANDROID_HOME/platform-tools

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/__tabtab.zsh ]] && . ~/.config/tabtab/__tabtab.zsh || true

eval "$(thefuck --alias --enable-experimental-instant)"
alias dockernuke="docker system prune -a --volumes --force"

eval "$(starship init zsh)"
