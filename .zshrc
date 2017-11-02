# Path to your oh-my-zsh installation.
export ZSH=/Users/wangzengdi/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

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
ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump xcode ruby gem vim python)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH=/usr/local/share/npm/bin:$PATH

export M2_HOME=/Users/wangzengdi/apache-maven-3.5.0
export PATH=$PATH:$M2_HOME/bin

# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export TERM=xterm-256color

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias fuck='eval $(thefuck $(fc -ln -1 | tail -n 1)); fc -R'
export NVM_DIR=~/.nvm
alias cls='clear'
alias clls='clear && ls'
alias ll='ls -l'
alias la='ls -a'
alias lla='ls -lah'
alias v='vim'
alias javac="javac -J-Dfile.encoding=utf8"
alias grep="grep --color=auto"
alias -s html=v   # 在命令行直接输入后缀为 html 的文件名，会在 TextMate 中打开
alias -s rb=v     # 在命令行直接输入 ruby 文件，会在 TextMate 中打开
alias -s js=v
alias -s py=v       # 在命令行直接输入 python 文件，会用 vm 中打开，以下类似
alias -s c=v
alias -s java=v
alias -s txt=v
alias -s gz='tar -xzvf'
alias -s tgz='tar -xzvf'
alias -s zip='unzip'
alias -s bz2='tar -xjvf'

# adi's alias
alias gpo='git push origin'
alias dirhide='defaults write com.apple.finder AppleShowAllFiles -boolean false ; killall Finder'
alias dirshow='defaults write com.apple.finder AppleShowAllFiles -boolean true ; killall Finder'
alias c='cat'
alias emacs="/usr/local/Cellar/emacs-plus/25.3/Emacs.app/Contents/MacOS/Emacs -nw"
alias thrift-parser="node /Users/wangzengdi/JavaScript/Github/thrift-parser/bin/thrift-parser.js"
alias jumper='ssh wangzengdi@jumper.sankuai.com'
alias groot='cd $(git rev-parse --show-toplevel)'
ggrep() {
  git grep -n $1 -- './*' ':(exclude)lib/*'
}

gmve() {
  OLD_EMAIL=$1 NEW_EMAIL=$2 git filter-branch --commit-filter '
    if [ "$GIT_AUTHOR_EMAIL" = "$OLD_EMAIL" ];
    then
      GIT_AUTHOR_EMAIL="$NEW_EMAIL";
      git commit-tree "$@";
    else
      git commit-tree "$@";
    fi' HEAD
  git update-ref -d refs/original/refs/heads/$(git symbolic-ref --short HEAD)
}

em() {
  emacsclient -t $1 || (emacs --daemon && emacsclient -t $1)
}
function exists { which $1 &> /dev/null }

function light() {
    cat $2 | highlight -O rtf --syntax $1 --font Inconsolata --style solarized-dark --font-size 24 | pbcopy
}

source /usr/local/opt/nvm/nvm.sh


[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if exists percol; then
    function percol_select_history() {
        local tac
        exists gtac && tac="gtac" || { exists tac && tac="tac" || { tac="tail -r" } }
        BUFFER=$(fc -l -n 1 | eval $tac | percol --query "$LBUFFER")
        CURSOR=$#BUFFER         # move cursor
        zle -R -c               # refresh
    }

    zle -N percol_select_history
    bindkey '^R' percol_select_history
fi
