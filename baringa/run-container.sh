#!/usr/bin/env bash

set -e

echo "Run Guix container for Baringa development"

# I use the same user(name) on my host machine as in the dev(elopment)
# container. That means that $HOME on the host is equal to $HOME in the dev
# container.

# When you start a Guix container and you don't specify a command to run, it
# places you in an interactive, non-login Bash session. On startup, this session
# automatically evaluates the (container) file $HOME/.shrc to drop me in a Zsh
# instead (after it has updated the path).
#
# Because it's a non-login Bash shell, it will not evalutate $HOME/.profile but
# it will read the file pointed to by $ENV. We set it here and let Guix pass it
# on to the container. Thanks to https://unix.stackexchange.com/a/340840/632947

export ENV=$HOME/.shrc

CONTAINER_HOME=$HOME/tmp/guix-container-homes/baringa
if [[ ! -d $CONTAINER_HOME ]]; then
    echo "Create container home directory at $CONTAINER_HOME"
    mkdir -p $CONTAINER_HOME
fi;

WORKSPACE=$HOME/repos/baringa
echo "Share $WORKSPACE as ~/workspace directory"

EMACS_SPACEMACS_DIR=$HOME/repos/swinkels/emacs-spacemacs/emacs-29.4-spacemacs-20241225

echo "Start guix shell..."
$HOME/.guix-extra/baringa/guix/bin/guix shell \
    --container --emulate-fhs --network \
    --preserve='^COLORTERM$' \
    --preserve='^ENV$' \
    --preserve='^LANG$' \
    --preserve='^TERM$' \
    --no-cwd --share=$CONTAINER_HOME=$HOME \
    --expose=$HOME/.ssh \
    --expose=$HOME/.oh-my-zsh \
    --share=$EMACS_SPACEMACS_DIR/.emacs.d=$HOME/.emacs.d \
    --share=$EMACS_SPACEMACS_DIR/.spacemacs.d=$HOME/.spacemacs.d \
    --share=provisioning=$HOME/provisioning \
    --share=$WORKSPACE=$HOME/workspace \
    --manifest=manifest.scm

# Options --share and --expose both make directories and files on the host
# accessible in the container. --share allows read-write access in the container
# whereas --expose only allows read access.
