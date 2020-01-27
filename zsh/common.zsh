export KUBE_EDITOR="nano"

export PATH=$PATH:$HOME/repos/persos/dotfiles/scripts

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

# this is for locally running Kubernetes demo
[[ $CMD_MODE_THEME == "demo" ]] && ZSH_THEME="fullscreen-demo"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
ENABLE_CORRECTION="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
#  git
  docker
  mvn
  kubectl
  npm
)

export PATH=$PATH:~/repos/persos/infrastructure-maison/scripts

source /usr/share/google-cloud-sdk/completion.zsh.inc
#source <(kubectl completion zsh)
source $HOME/.kubectl-completion-zsh.cache
source /usr/share/autojump/autojump.zsh

alias k=kubectl
alias g=gcloud
alias c=code
alias git='LANG=en_GB git'
alias w='watch kubectl get pods'
alias copy='xclip -sel c'
alias paste='xclip -o -sel c'

DEFAULT_USER=$USER
#POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir kubecontext vcs)
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs)
#POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history load ram time)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status)

# For docker-compose, see https://docs.docker.com/compose/completion/#bash
fpath=(~/.zsh/completion $fpath)
