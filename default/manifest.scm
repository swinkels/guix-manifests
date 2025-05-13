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
         (commit "2e1ead7c8b449b58d571d8f16c1586b675c13ab4"))))

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
    (list "direnv"
          "ripgrep"
          "stow"
          "tmux"
          "tree"
          "vim"
          "zsh"))

   ;; Emacs
   (list
    (first (lookup-inferior-packages inferior "emacs" "29.4"))
    (specification->package "font-adobe-source-code-pro"))

   ;; email packages
   (specifications->packages (list "isync" "mu"))

   ;; Python
   (list
    (first (lookup-inferior-packages inferior "python" "3.11.11"))))))
