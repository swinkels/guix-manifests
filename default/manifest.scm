;; Manifest for my default Guix profile
;;
;; The use of inferiors builds upon the example at
;; https://guix.gnu.org/manual/en/html_node/Inferiors.html

(use-modules (guix inferior) (guix channels)
             (srfi srfi-1))   ;for 'first'

(define channels
  (list (channel
         (name 'guix)
         (url "https://git.savannah.gnu.org/git/guix.git")
         ;; commit date: May 9, 2025
         (commit "2e1ead7c8b449b58d571d8f16c1586b675c13ab4")
         (introduction
          (make-channel-introduction
           "9edb3f66fd807b096b48283debdcddccfea34bad"
           (openpgp-fingerprint
            "BBB0 2DDF 2CEA F6A8 0D1D  E643 A2A0 6DF2 A33A 54FA"))))))

(define inferior
  ;; An inferior representing the above revision. We used it to pin Emacs to
  ;; 29.4 although now we've just use the Emacs version that the main channel
  ;; provides. It's still there because we might use it again to pin Emacs.
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
          "aspell-dict-nl"
          "direnv"
          "fzf"
          "ncdu"
          "plantuml"
          "ripgrep"
          "starship"
          "stow"
          "tmux"
          "tmux-plugin-resurrect"
          "tree"
          "vim"
          "xclip"
          "zsh"))

   ;; Emacs
   (specifications->packages (list "emacs" "emacs-vterm" "font-adobe-source-code-pro"))
   ;; (list
   ;;  (first (lookup-inferior-packages inferior "emacs" "29.4"))
   ;;  (specification->package "font-adobe-source-code-pro"))

   ;; email packages
   (specifications->packages (list "isync" "mu")))))
