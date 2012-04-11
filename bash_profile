alias c="clear"
alias tm="tmux attach"
alias lm='latexmk -pvc -pdf'
alias lmc='latexmk -C'
#alias gvimdiff="mvim -f"
#export MATROOT=/Applications/MATLAB_R2010b.app
#if [ -e $MATROOT ] ; then
    #export PATH=$MATROOT/bin/maci64:$PATH
    #export DYLD_LIBRARY_PATH=$MATROOT/bin/maci64:$MATROOT/sys/os/maci64:/System/Library/Frameworks/JavaVM.framework/JavaVM:/System/Library/Frameworks/JavaVM.framework/Libraries
#fi
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/opt/local/bin:/usr/local/git/bin:/usr/local/sbin:/Applications/LilyPond.app/Contents/Resources/bin:/Applications/MacVim:/Users/davidkarapetyan/bin:/Applications/MATLAB_R2010a.app/bin/maci:/usr/local/texlive/2011/bin/universal-darwin:/Developer/usr/bin
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced
#export EDITOR='vim -f -c "au VimLeave * !open -a Terminal"'
export LYEDITOR="vim --remote-tab-silent +:%(line)s:norm%(char)s %(file)s"
export PAGER=`which less`

if [ -f /usr/local/Cellar/git/1.7.3.5/etc/bash_completion.d/git-completion.bash ]
then
  . /usr/local/Cellar/git/1.7.3.5/etc/bash_completion.d/git-completion.bash 
    fi

PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[36m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
