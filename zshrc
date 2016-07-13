if [[ `uname` == 'Darwin' ]]
then
	# Path to your oh-my-zsh installation.
	export ZSH=/Users/davidkarapetyan/.oh-my-zsh

	# Set name of the theme to load.
	# Look in ~/.oh-my-zsh/themes/
	# Optionally, if you set this to "random", it'll load a random theme each
	# time that oh-my-zsh is loaded.
	ZSH_THEME="maran"

	# Uncomment the following line to use case-sensitive completion.
	# CASE_SENSITIVE="true"

	# Uncomment the following line to disable bi-weekly auto-update checks.
	# DISABLE_AUTO_UPDATE="true"

	# Uncomment the following line to change how often to auto-update (in days).
	# export UPDATE_ZSH_DAYS=13

	# Uncomment the following line to disable colors in ls.
	# DISABLE_LS_COLORS="true"

	# Uncomment the following line to disable auto-setting terminal title.
	# DISABLE_AUTO_TITLE="true"

	# Uncomment the following line to enable command auto-correction.
	# ENABLE_CORRECTION="true"

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
	plugins=(git)

	# User configuration

	export PATH="$HOME/anaconda/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
	export MANPATH="/usr/local/man:$MANPATH"

	source $ZSH/oh-my-zsh.sh

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
	# export SSH_KEY_PATH="~/.ssh/dsa_id"

	# Set personal aliases, overriding those provided by oh-my-zsh libs,
	# plugins, and themes. Aliases can be placed here, though oh-my-zsh
	# users are encouraged to define aliases within the ZSH_CUSTOM folder.
	# For a full list of active aliases, run `alias`.
	#
	# Example aliases
	# alias zshconfig="mate ~/.zshrc"
	# alias ohmyzsh="mate ~/.oh-my-zsh"
	alias c="clear"
	# alias pip="pip3"
	# alias ds="ssh -Y -C -c blowfish-cbc,arcfour datascience.local"
	#alias ds="ssh -C -c blowfish-cbc,arcfour datascience.local"
	alias ds="ssh datascience.local"
	alias mon="mongo admin --host 52.21.246.131 --port 27017 -u Analytics -p "L3x1^gt0n""
	alias mdump="mongodump --authenticationDatabase admin --host 52.21.246.131 --port 27017 -u Analytics -p "L3x1^gt0n""
	alias mrestore="mongorestore --authenticationDatabase admin --host 52.21.246.131 --port 27017 -u Analytics -p "L3x1^gt0n""
	alias cl="ssh -Y -C -c blowfish-cbc,arcfour 192.168.98.20"
	alias router='ssh root@74.71.232.72'
	#alias cl="ssh -Y 192.168.98.20"
 	launchctl setenv WUND_URL http://api.wunderground.com/api/53b91a5eddd63026/
	launchctl setenv DB_HOST 52.21.246.131
	launchctl setenv DB_PORT 27017
	launchctl setenv DB_SOURCE admin
	launchctl setenv DB_USERNAME analytics
	launchctl setenv DB_PASSWORD l3xi^gt0n
  

elif [[ `uname` == "Linux" ]]
then
	# Path to your oh-my-zsh installation.
	export ZSH=/home/davidkarapetyan/.oh-my-zsh

	# Set name of the theme to load.
	# Look in ~/.oh-my-zsh/themes/
	# Optionally, if you set this to "random", it'll load a random theme each
	# time that oh-my-zsh is loaded.
	ZSH_THEME="maran"

	# Uncomment the following line to use case-sensitive completion.
	# CASE_SENSITIVE="true"

	# Uncomment the following line to use hyphen-insensitive completion. Case
	# sensitive completion must be off. _ and - will be interchangeable.
	# HYPHEN_INSENSITIVE="true"

	# Uncomment the following line to disable bi-weekly auto-update checks.
	# DISABLE_AUTO_UPDATE="true"

	# Uncomment the following line to change how often to auto-update (in days).
	export UPDATE_ZSH_DAYS=30

	# Uncomment the following line to disable colors in ls.
	# DISABLE_LS_COLORS="true"

	# Uncomment the following line to disable auto-setting terminal title.
	# DISABLE_AUTO_TITLE="true"

	# Uncomment the following line to enable command auto-correction.
	# ENABLE_CORRECTION="true"

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
	plugins=(git)

	# User configuration

	export HOME="/home/davidkarapetyan"
	export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
	export PATH="/home/davidkarapetyan/anaconda2/bin:$PATH"

	#export PYTHONPATH="/home/davidkarapetyan/Documents/workspace/larkin:$PYTHONPATH"
	export MANPATH="/usr/local/man:$MANPATH"

	source $ZSH/oh-my-zsh.sh

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
	# export SSH_KEY_PATH="~/.ssh/dsa_id"

	# Set personal aliases, overriding those provided by oh-my-zsh libs,
	# plugins, and themes. Aliases can be placed here, though oh-my-zsh
	# users are encouraged to define aliases within the ZSH_CUSTOM folder.
	# For a full list of active aliases, run `alias`.
	#
	# Example aliases
	# alias zshconfig="mate ~/.zshrc"
	# alias ohmyzsh="mate ~/.oh-my-zsh"
	alias pi = "ssh pi@74.71.229.106"
	alias c="clear"
	alias mon="mongo admin -u Analytics -p "L3x1^gt0n""
	alias pil="pip install -e $HOME/Documents/workspace/larkin --force-reinstall"
	alias pul="pip uninstall larkin"
	export MAILTO="dkarapetyan@prescriptivedata.io"
	alias qtc='jupyter qtconsole --ConsoleWidget.font_family=Consolas --ConsoleWidget.font_size=11 --style monokai'
	export WUND_URL="http://api.wunderground.com/api/53b91a5eddd63026/"
	export DB_HOST=52.21.246.131
	export DB_PORT=27017
	export DB_SOURCE="admin"
	export DB_USERNAME="analytics"
	export DB_PASSWORD="l3xi^gt0n"

fi
