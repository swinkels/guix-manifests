;; Manifest for my default Guix profile
;;
;; The use of inferiors builds upon the example at
;; https://guix.gnu.org/manual/en/html_node/Inferiors.html

(use-modules (guix inferior) (guix channels)
             (srfi srfi-1))   ;for 'first'

(define channels
  (list (channel
         (name 'guix)
         (url "https://git.guix.gnu.org/guix.git")
         ;; commit date: March 15, 2025
         (commit "204568d027e25d3f2c09ad4c335e503ae3ed8c52"))))

(define inferior
  ;; An inferior representing the above revision. We use it to pin Emacs (to
  ;; 29.4) and Python (to 3.11.11).
  (inferior-for-channels channels))

(packages->manifest
 (concatenate
  (list

   ;; Guix packages as recommended at
   ;; https://guix.gnu.org/manual/en/html_node/Application-Setup.html
   (specifications->packages (list "fontconfig" "glibc-locales" "nss-certs"))

   ;; base packages
   (specifications->packages
    (list "aspell"
          "aspell-dict-en"
          "direnv"
          "fzf"
          "git"
          "git-lfs"
          "ncurses"  ;; provides terminfo database, which describes capabilities of terminals
          "pandoc"
          "plantuml"
          "ripgrep"
          "stow"
          "tmux"
          "tmux-plugin-resurrect"
          "tree"
          "vim"
          "xclip"
          "zsh"))

   ;; Emacs
   (list
    (first (lookup-inferior-packages inferior "emacs" "29.4"))
    (specification->package "font-adobe-source-code-pro"))

   ;; packages to be able to build API documentation
   (specifications->packages
    (list
     "texlive-bin"
     "texlive-latex"
     "texlive-latex-bin"
     "texlive-amsmath"
     "texlive-amscls"
     "texlive-amsfonts"
     "texlive-anyfontsize"
     "texlive-tools"
     "texlive-xcolor"
     "texlive-preview"
     "texlive-dvisvgm"
     "texlive-dvisvgm-bin"
     "texlive-dvips"))

  )))
