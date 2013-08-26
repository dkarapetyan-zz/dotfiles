# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="apple"
#ZSH_THEME_GIT_PROMPT_PREFIX=" on %{$fg[magenta]%}"
#ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}"
#ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[green]%}!"
#ZSH_THEME_GIT_PROMPT_UNTRACKED="%{$fg[green]%}?"
#ZSH_THEME_GIT_PROMPT_CLEAN=""


 
# -------------------------------------------------------------------
# Git aliases
# -------------------------------------------------------------------
 
alias ga='git add -A'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'
alias gta='git tag -a -m'
alias gf='git reflog'
 
# leverage an alias from the ~/.gitconfig
alias gh='git hist'
alias glg1='git lg1'
alias glg2='git lg2'
alias glg='git lg'
 
# -------------------------------------------------------------------
# Capistrano aliases
# -------------------------------------------------------------------
 
 
# -------------------------------------------------------------------
# OTHER aliases
# -------------------------------------------------------------------
 
alias c='clear'
alias be="bundle exec"
alias bi="bundle install"
alias c="clear"
alias tmux="tmux -2"
alias tm="tmux attach"
alias lm="latexmk -pvc -pdf"
alias lmc="latexmk -C"
alias rp="cd /Users/davidkarapetyan/code/ruby/rails_projects"
alias rdeb="ruby -r debug"
alias timidity="open -a QuickTime\ Player.app"
alias val="valgrind --dsymutil=yes --suppressions=/Users/davidkarapetyan/.suppressions --leak-check=full --show-reachable=yes" 
alias vi="/usr/local/bin/./vim"
alias eclimd="/Applications/eclipse/./eclimd"
# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
 #DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
 DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
 DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colored-man vi-mode)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:/usr/local/sbin:/Applications/MATLAB_R2010a.app/bin/maci:/Applications/LilyPond.app/Contents/Resources/bin:/usr/local/texlive/2011/bin/universal-darwin:/Developer/usr/bin:/$HOME/.cabal/bin

export LYEDITOR="vim --remote-tab-silent +:%(line)s:norm%(char)s %(file)s"

[[ -s "~/.rvm/scripts/rvm" ]] && . "~/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

#if vim compiled with clientserver
cs=`command vim --version | grep "clientserver"`
if [ "$cs" ]
then
  #Only use one instance of vim
  function vim()
  {
    if [ "$@" ]
    then
      command vim --servername vim --remote-silent $@
    else
      pss=`ps`
      temp=`echo $pss | grep -w "vim"`
      if [ "$temp"  ]
      then
        echo "vim already open"
      else
        command vim --servername vim
      fi
    fi
  }
else
  command vim $@
fi
