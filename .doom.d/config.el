;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-Iosvkem)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type `relative)

;; Disable the threshold for how many files the LSP will watch.
(setq lsp-file-watch-threshold nil)

;; Set the directory Projectile will search for projects.
(setq projectile-project-search-path '("~/repos/"))

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

;; Set a custom template for the default org-roam capture.
(setq org-roam-capture-templates
            '(("d" "default" plain (function org-roam-capture--get-point)
               "%?"
               :file-name "${slug}"
               :head "#+title: ${title}\n#+roam_alias:\n#+roam_tags:\n#+created: %u\n\n* ${title}\n"
               :unnarrowed t)))

;; Set custom keymap to open the calendar view.
(map! :desc "Open calendar view" :leader "o c" '=calendar)
;; Load the org-gcal config, this file has client secret in it.
(load! "gcal.el")

;; Rust mode function for running a cargo command, useful for running cargo alias'.
(defun rustic-cargo-command()
  "Run 'cargo <command>' for the current project. Where <command> is prompted for."
  (interactive)
  (rustic-run-cargo-command (concat "cargo " (read-string "cargo "))))

;; Rust mode custom keymaps.
(map! (:when (featurep! :lang rust)
       (:map rustic-mode-map :desc "cargo add" :localleader "a" 'rustic-cargo-add)
       (:map rustic-mode-map :desc "cargo ..." :localleader "c" 'rustic-cargo-command)
       ))

;; Enable format-on-save for Rust mode.
(add-hook 'rustic-mode-hook 'format-all-mode)

;; When exit insert mode, don't move the cursor back one character.
(setq evil-move-cursor-back nil)
