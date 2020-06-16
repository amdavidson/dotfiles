
DOCKERMACOS=/Applications/Docker.app/Contents/Resources/etc
if [ -d $DOCKERMACOS ]; then 
    source $DOCKERMACOS/docker.zsh-completion
    source $DOCKERMACOS/docker-machine.zsh-completion
    source $DOCKERMACOS/docker-compose.zsh-completion
fi
