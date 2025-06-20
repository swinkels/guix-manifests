;; the versions in this manifest are defined by the accompanying channel
;; specification

(specifications->manifest
 (list
  "bash"
  "coreutils"
  "curl"
  "diffutils"
  "direnv"
  "dotnet"  ;; required to authenticate against Azure Artifacts Feeds
  "emacs"
  "emacs-all-the-icons"
  "findutils"
  "font-adobe-source-code-pro"
  "fontconfig"
  "fzf"
  "gawk"
  "gcc-toolchain" ;; required by the ruff LSP server
  "git"
  "grep"
  "gzip"
  "inetutils"  ;; provides "hostname"
  "less"
  "man-db"  ;; provides "man"
  "ncurses"  ;; provides terminfo database, which describes capabilities of terminals
  "nss-certs"
  "procps"  ;; provides "ps"
  "ripgrep"
  "sed"
  "tar"
  "tree"
  "tmux"
  "tmux-plugin-resurrect"
  "util-linux"  ;; provides "more", literally ;)
  "vim"
  "xclip"
  "wget"
  "which"
  "zlib"
  "zsh"))
