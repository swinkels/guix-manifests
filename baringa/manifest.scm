;; the versions in this manifest are defined by the accompanying channel
;; specification

(specifications->manifest
 (list
  "bash"
  "coreutils"
  "curl"
  "direnv"
  "dotnet"  ;; required to authenticate against Azure Artifacts Feeds
  "emacs"
  "emacs-all-the-icons"
  "font-adobe-source-code-pro"
  "fontconfig"
  "fzf"
  "gawk"
  "git"
  "grep"
  "gzip"
  "inetutils"  ;; provides "hostname"
  "less"
  "man-db"  ;; provides "man"
  "ncurses"  ;; provides terminfo database, which describes capabilities of terminals
  "nss-certs"
  "procps"  ;; provides "ps"
  "python"
  "python:tk"
  "python-lsp-server"
  "python-nox"
  "ripgrep"
  "sed"
  "tar"
  "tree"
  "tmux"
  "tmux-plugin-resurrect"
  "util-linux"  ;; provides "more", literally ;)
  "vim"
  "wget"
  "which"
  "zlib"
  "zsh"))
