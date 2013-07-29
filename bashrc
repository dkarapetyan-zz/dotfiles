alias be="bundle exec"
alias bi="bundle install"
alias c="clear"
alias tm="tmux attach"
alias lm="latexmk -pvc -pdf"
alias lmc="latexmk -C"
alias rp="cd /Users/davidkarapetyan/code/ruby/rails_projects"
alias rdeb="ruby -r debug"
alias vims="vim --servername VIM"
alias timidity="open -a QuickTime\ Player.app"
alias val="valgrind --dsymutil=yes --suppressions=/Users/davidkarapetyan/.suppressions --leak-check=full --show-reachable=yes" 
alias vim='vim --servername vim'
alias vi='vim --servername vim'
set -o vi
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:/usr/local/sbin:/Applications/MATLAB_R2010a.app/bin/maci:/Applications/LilyPond.app/Contents/Resources/bin:/usr/local/texlive/2011/bin/universal-darwin:/Developer/usr/bin:/$HOME/.vim/bundle/pyclewn/bin
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
export LYEDITOR="vim --remote-tab-silent +:%(line)s:norm%(char)s %(file)s"
export PAGER=`which less`
export EDITOR="mvim -v"
if [ -f ~/.git-prompt.sh ]
then
  source ~/.git-prompt.sh
fi

if [ -f /usr/local/etc/bash_completion.d ]
then
  . /usr/local/etc/bash_completion.d
fi

    

PS1='\[\033[32m\]\u@\h:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
PS1='\[\033[32m\]\u:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '


[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
