;; the versions in this manifest are defined by the accompanying channel
;; specification

(specifications->manifest
 (list
  "aspell"
  "aspell-dict-en"
  "aspell-dict-nl"
  "bash"
  "coreutils"
  "curl"
  "diffutils"
  "direnv"
  "emacs"
  "emacs-all-the-icons"
  "findutils"
  "font-adobe-source-code-pro"
  "fontconfig"
  "fzf"
  "gawk"
  "gcc-toolchain" ;; required by the ruff LSP server
  "git"
  "glibc-locales" ;; required to fix prompt issue in Oh My Zsh: https://github.com/ohmyzsh/ohmyzsh/issues/11332
  "grep"
  "gzip"
  "inetutils"  ;; provides "hostname"
  "less"
  "make"
  "man-db"  ;; provides "man"
  "ncurses"  ;; provides terminfo database, which describes capabilities of terminals
  "nss-certs"
  "openssh"
  "perl"  ;; turns out magit needs it if you want to modify a commit
  "procps"  ;; provides "ps"
  "ripgrep"
  "starship"
  "sed"
  "tar"
  "tree"
  "tmux"
  "tmux-plugin-resurrect"
  "tzdata"  ;; time zone database to be able to set the timezone to "Europe/Amsterdam"
  "util-linux"  ;; provides "more", literally ;)
  "vim"
  "xclip"
  "wget"
  "which"
  "zlib"
  "zsh"))
