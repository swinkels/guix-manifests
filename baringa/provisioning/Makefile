# This Makefile installs tools that are not managed by Guix but that you need in
# the development environment. It supports the installation of these tools in a
# clean container, but it's not intended to manage the lifetime of these tools.
# This means that if you need to update a tool that is already installed, you
# should do that manually.
#
# If you update a tool manually, also update the tool version in this Makefile
# for the next time you need to provision a clean container.
#
# **Note** You need to run `make` in a *running container*.


.PHONY: uv yadm

all: uv yadm

uv: ~/.local/bin/uv

~/.local/bin/uv:
	curl -LsSf https://astral.sh/uv/0.7.9/install.sh | sh
	uv python install 3.11 3.12 3.13
	uv python pin 3.11 --global
	uv tool install keyring@25.6.0 --with artifacts-keyring
	uv tool install nox@2025.5.1
	uv tool install poetry@2.1.3
	uv tool install python-lsp-server@1.12.2

yadm: ~/.local/bin/yadm ~/.local/share/yadm/repo.git/config

~/.local/bin/yadm:
	# Install yadm to manage dotfiles
	curl -fLo $@ https://raw.githubusercontent.com/yadm-dev/yadm/3.5.0/yadm
	chmod u+x $@

# The hostname inside a running Guix container is the one of the host machine
# and you cannot change it [^1]. This interferes with my usage of yadm, where I
# use the hostname to distinguish machine-specific dotfiles. To work around
# that, I tell yadm to use hostname "baringa".
#
# [^1]: You can do that in Guix system containers, but I don't know how to that
#       in non-system containers.

~/.local/share/yadm/repo.git/config:
	# Install personal dotfiles
	yadm clone git@github.com:swinkels/yadm-dotfiles.git
	yadm config local.hostname baringa
	yadm alt
