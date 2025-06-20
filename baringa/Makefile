CONTAINER_HOME := ${HOME}/tmp/guix-container-homes/baringa

.PHONY: all sync-files

all: sync-files

sync-files:
	# rsync configuration files to the container
	rsync -Cavz --files-from=rsync-files-from.txt . $(CONTAINER_HOME)
