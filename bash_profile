if [ -f ~/dotfiles/bashrc ]; then
   source ~/dotfiles/bashrc
fi

if [ -f ~/.profile ]; then
   source ~/.profile
fi

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*

# added by Anaconda3 2.3.0 installer
export PATH="/Users/davidkarapetyan/anaconda/bin:$PATH"
