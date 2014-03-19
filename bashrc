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
#alias vims="/usr/local/bin/vim --servername VIM"
#alias vim="/usr/local/bin/vim --servername VIM --remote-send"
alias vi="/usr/local/bin/vim"
alias eclimd="/Applications/eclipse/eclimd"
set -o vi
shopt -s extglob
export PATH=/opt/local/bin:/opt/local/sbin:/opt/local/lib/postgresql93/bin:/usr/local/bin:/usr/local/sbin:/Applications/MacVim:/Applications/LilyPond.app/Contents/Resources/bin:$PATH
export ANDROID_HOME=/usr/local/android-sdk-macosx
export PATH=${PATH}:$ANDROID_HOME/tools:$ANDROID_HOME/platform-tools
export PATH="/usr/local/heroku/bin:$PATH"
export MANPATH=/opt/local/share/man:$MANPATH
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LYEDITOR="vim --remote-tab-silent +:%(line)s:norm%(char)s %(file)s"
export PAGER=`which less`
export EDITOR="vim"
export JAVA_OPTS="-Xmx2g"
export TWITTER_KEY="CiMQIowDoAPp720AVC2nw"
export TWITTER_SECRET="bYv3MJ3s2jkmotB1gVARSxMFyBf38PnSD0B3FMcFoA"
if [ -f ~/.git-prompt.sh ]
then
    . ~/.git-prompt.sh
fi

if [ -f /usr/local/etc/bash_completion.d ]
then
    . /usr/local/etc/bash_completion.d
fi



PS1='\[\033[32m\]\u@\h:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
PS1='\[\033[32m\]\u:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

man() {
    env LESS_TERMCAP_mb=$(printf "\e[1;31m") \
        LESS_TERMCAP_md=$(printf "\e[1;31m") \
        LESS_TERMCAP_me=$(printf "\e[0m") \
        LESS_TERMCAP_se=$(printf "\e[0m") \
        LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
        LESS_TERMCAP_ue=$(printf "\e[0m") \
        LESS_TERMCAP_us=$(printf "\e[1;32m") \
        man "$@"
}
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" 
# Load RVM into a shell session *as a function*

### Added by the Heroku Toolbelt

