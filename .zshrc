# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"

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
plugins=(ant brew docker docker-compose git mosh mvn osx sbt scala sudo terraform tmux vagrant)

source $ZSH/oh-my-zsh.sh

# User configuration

# export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:$PATH
export PATH=$HOME/bin:/usr/local/bin:/opt/local/bin:$PATH:~/Library/Python/2.7/bin
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.

#export http_proxy=http://172.16.1.10:8080
#export https_proxy=http://172.16.1.10:8080

# robotics seminar environment
#export ROS_HOSTNAME=172.19.212.217
#export ROS_MASTER_URI=http://172.19.212.217:11311

#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
  export TERM='xterm-256color'
#else
	#export TERM='xterm-color'
#fi

case `uname` in
  Darwin)
    alias ls='gls -laGv --color=auto --group-directories-first'
    ;;
  Linux)
    alias ls='gls -laGv --color=auto --group-directories-first'
    ;;
esac

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

#alias sbt='java -server -XX:+UseNUMA -XX:+UseCondCardMark -XX:+UseAdaptiveSizePolicy -XX:MaxGCPauseMillis=10 -Xms4095m -Xmx8192m -XX:MaxPermSize=256M -Djline.terminal=jline.UnixTerminal -Dsbt.global.base=/home/aberey/.sbt -jar /home/aberey/sbt/sbt-launch-0.12.0.jar "$@"'
#alias sbtjrock='/home/aberey/jrockit-jdk1.6.0_31-R28.2.3-4.1.0/bin/java -XgcPrio:deterministic -XpauseTarget=16ms -XXnosystemgc -Xms4096m -Xmx8192m -XX:MaxPermSize=256M -Djline.terminal=jline.UnixTerminal -Dsbt.global.base=/home/aberey/.sbt -jar /home/aberey/sbt/sbt-launch-0.12.0.jar'
#alias sbtcms='java -server -XX:+UseNUMA -XX:+UseCondCardMark -XX:+UseConcMarkSweepGC -Xms4096m -Xmx8192m -XX:MaxPermSize=256M -Djline.terminal=jline.UnixTerminal -Dsbt.global.base=/home/aberey/.sbt -jar /home/aberey/sbt/sbt-launch-0.12.0.jar'
#alias sbtdbg='java -Xdebug-server -XX:+UseNUMA -XX:+UseCondCardMark -XX:+UseAdaptiveSizePolicy -XX:MaxGCPauseMillis=10 -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005 -Xms4096m -Xmx8192m -XX:MaxPermSize=256M -Djline.terminal=jline.UnixTerminal -Dsbt.global.base=/home/aberey/.sbt -jar /home/aberey/sbt/sbt-launch-0.12.0.jar'
#alias sbtyjp='java -agentpath:/home/aberey/yjp-12.0.2/bin/linux-x86-64/libyjpagent.so -Xdebug -server -XX:+UseNUMA -XX:+UseCondCardMark -XX:MaxGCPauseMillis=10 -XX:+UseAdaptiveSizePolicy -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005 -Xms4096m -Xmx8192m -XX:MaxPermSize=256M -Djline.terminal=jline.UnixTerminal -Dsbt.global.base=/home/aberey/.sbt -jar /home/aberey/sbt/sbt-launch-0.12.0.jar'
#alias sbtjhi='java -javaagent:$JHICCUP/jHiccup.jar="-i 1000 -l hiccuplog -c c.hiccuplog" -Xdebug -server -XX:+UseNUMA -XX:+UseCondCardMark -XX:+UseAdaptiveSizePolicy -XX:MaxGCPauseMillis=10 -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005 -Xms4096m -Xmx8192m -XX:MaxPermSize=256M -Djline.terminal=jline.UnixTerminal -Dsbt.global.base=/home/aberey/.sbt -jar /home/aberey/sbt/sbt-launch-0.12.0.jar'
#alias sbtjpr='java -agentpath:/home/aberey/jprofiler7/bin/linux-x64/libjprofilerti.so=port=8849,nowait -Xdebug -server -XX:+UseNUMA -XX:+UseCondCardMark -XX:+UseAdaptiveSizePolicy -XX:MaxGCPauseMillis=10 -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005 -Xms4096m -Xmx8192m -XX:MaxPermSize=256M -Djline.terminal=jline.UnixTerminal -Dsbt.global.base=/home/aberey/.sbt -jar /home/aberey/sbt/sbt-launch-0.12.0.jar'

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

alias zshrc='vim ~/.zshrc'
alias vimrc='vim ~/.vim/vimrc'
alias docker-gc='docker run --rm -v /var/run/docker.sock:/var/run/docker.sock -v /etc:/etc spotify/docker-gc'

export XDG_CONFIG_HOME=~/.config # for powerline configs to be picked up
if [ -f ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh ]; then
  . ~/Library/Python/2.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh -p ~/.config/powerline
fi
if [ -f /usr/share/powerline/bindings/zsh/powerline.zsh ]; then
  . /usr/share/powerline/bindings/zsh/powerline.zsh -p ~/.config/powerline
fi

export PATH=$PATH:/usr/local/opt/go/libexec/bin:/usr/local/Cellar/go/1.6.2/bin/
export GOPATH=/usr/local/opt/go

export PATH=$PATH:/usr/local/lib/spark/bin
export SPARK_HOME=/usr/local/lib/spark

export PATH=$PATH:/usr/local/lib/hadoop/bin
export HADOOP_HOME=/usr/local/lib/hadoop
export HADOOP_PREFIX=/usr/local/lib/hadoop

eval "$(direnv hook zsh)"

eval "$(docker-machine env default)"
export DOCKER_HOST_ADDR=$(docker-machine ip)

export ROS_HOSTNAME=172.19.212.217
export ROS_MASTER_URI=http://172.19.212.217:11311

if [ -f ~/.credentials ]; then
  source ~/.credentials
fi

export NVM_DIR="$HOME/.nvm"
if [ -f /usr/local/opt/nvm/nvm.sh ]; then
  . /usr/local/opt/nvm/nvm.sh
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/a14372/dev/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/a14372/dev/google-cloud-sdk/path.zsh.inc'; fi
# The next line enables shell command completion for gcloud.
if [ -f '/Users/a14372/dev/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/a14372/dev/google-cloud-sdk/completion.zsh.inc'; fi
export GOOGLE_APPLICATION_CREDENTIALS=~/.gcp/cyberagent-214-ganesha-043ccfecfeb7.json

