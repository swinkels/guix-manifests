#!/usr/bin/env bash

set -e

CONTAINER_NAME=system-spike
CONTAINER_HOME=$HOME/tmp/guix-container-homes/$CONTAINER_NAME

GUIX_EXTRA=$HOME/.guix-extra

GUIX_CONTAINER_PROFILE_DIR=$GUIX_EXTRA/$CONTAINER_NAME
GUIX_CONTAINER_PROFILE=$GUIX_CONTAINER_PROFILE_DIR/guix

echo "Run Guix container '$CONTAINER_NAME' to spike a reproducible config of my Linux system"

if [[ ! -d $GUIX_CONTAINER_PROFILE ]]; then
    echo "Install Guix profile at $GUIX_CONTAINER_PROFILE"
    echo "----"
    mkdir --parents $GUIX_CONTAINER_PROFILE_DIR
    # The guix pull command is chatty, especially the hints surrounded by empty
    # lines. There doesn't seem to be anything we can do about that: setting the
    # verbosity to 0 doesn't change a thing and as all its output seems to go to
    # stderr, redirecting to /dev/null also doesn't help.
    guix pull --channels=channel-specs.scm --profile=$GUIX_CONTAINER_PROFILE
    echo "----"
else
    echo "Use Guix profile found at $GUIX_CONTAINER_PROFILE"
    # if you need to update the profile found, you will have to do that manually
fi;

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

echo "Start container"
$GUIX_CONTAINER_PROFILE/bin/guix shell \
    --container --emulate-fhs --network \
    --preserve='^COLORTERM$' \
    --preserve='^ENV$' \
    --preserve='^LANG$' \
    --preserve='^LC_TIME$' \
    --preserve='^SSH_AUTH_SOCK$' \
    --preserve='^TERM$' \
    --no-cwd --share=$CONTAINER_HOME=$HOME \
    --expose=$SSH_AUTH_SOCK \
    --share=provisioning=$HOME/provisioning \
    --manifest=manifest.scm


# Options --share and --expose both make directories and files on the host
# accessible in the container. --share allows read-write access in the container
# whereas --expose only allows read access.

# The host already runs an ssh-agent. To let the container have access to the
# keys it might have loaded, we expose SSH_AUTH_SOCK and the socket file that it
# points to.
