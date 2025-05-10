;; doom-mori-theme.el --- A gruvbox-inspired forest theme -*- lexical-binding: t; no-byte-compile:  t; -*-

;;
;;; Commentary:
;;
;; A gruvbox-inspired forest theme
;;
;;
;;; Code:

(require 'doom-themes)

;;
;;; Variables:

(defgroup doom-mori-theme nil
  "Options for the `doom-mori' theme."
  :group 'doom-themes)

(defcustom doom-mori-brighter-modeline nil
  "If non-nil, more vivid colors will be used to style the mode-line."
  :group 'doom-mori-theme
  :type 'boolean)

(defcustom doom-mori-brighter-comments nil
  "If non-nil, comments will be highlighted in more vivid colors."
  :group 'doom-mori-theme
  :type 'boolean)

(defcustom doom-mori-comment-bg doom-mori-brighter-comments
  "If non-nil, comments will have a subtle highlight to enhance their legibility."
  :group 'doom-mori-theme
  :type 'boolean)

(defcustom doom-mori-padded-modeline doom-themes-padded-modeline
  "If non-nil, adds a 4px padding to the mode-line.
Can be an integer to determine the exact padding."
  :group 'doom-mori-theme
  :type '(choice integer boolean))


;;
;;; Theme Definition:

(def-doom-theme doom-mori
    "A gruvbox-inspired forest theme"
  :family 'doom-mori
  :background-mode 'dark
  ;; name        default   256           16
  ((bg         '("#191e16" "black"       "black"  ))

   (fg         '("#cedcbf" "#cedcbf"     "brightwhite"  ))
   ;; These are off-color variants of bg/fg, used primarily for `solaire-mode',
   ;; but can also be useful as a basis for subtle highlights (e.g. for hl-line
   ;; or region), especially when paired with the `doom-darken', `doom-lighten',
   ;; and `doom-blend' helper functions.
   (bg-alt     '("#2a3228" "black"       "black"))
   (fg-alt     '("#a1b49d" "#a1b49d"     "white"))

   ;; These should represent a spectrum from bg to fg, where base0 is a starker
   ;; bg and base8 is a starker fg. For example, if bg is light grey and fg is
   ;; dark grey, base0 should be white and base8 should be black.
   (base0      '("#2a3228" "black"       "black"))
   (base1      '("#3b4639" "#1e1e1e"     "brightblack"))
   (base2      '("#4c5a4b" "#2e2e2e"     "brightblack"))
   (base3      '("#5e6f5d" "#262626"     "brightblack"))
   (base4      '("#70836f" "#3f3f3f"     "brightblack"))
   (base5      '("#819681" "#525252"     "brightblack"))
   (base6      '("#a1b49d" "#6b6b6b"     "brightblack"))
   (base7      '("#bcd5ad" "#979797"     "brightblack"))
   (base8      '("#cedcbf" "#dfdfdf"     "white"))



   (grey       base4)
   (red        '("#d29154" "#d29154" "red"          ))
   (orange     '("#da8548" "#dd8844" "brightred"    ))
   (green      '("#97b073" "#97b073" "green"        ))
   (teal       '("#4db5bd" "#44b9b1" "brightgreen"  ))
   (yellow     '("#cdd13e" "#cdd13e" "yellow"       ))
   (blue       '("#60bcb1" "#60bcb1" "brightblue"   ))
   (dark-blue  '("#2257A0" "#2257A0" "blue"         ))
   (magenta    '("#c678dd" "#c678dd" "brightmagenta"))
   (violet     '("#a9a1e1" "#a9a1e1" "magenta"      ))
   (cyan       '("#7EBB8A" "#7EBB8A" "brightcyan"   ))
   (dark-cyan  '("#5699AF" "#5699AF" "cyan"         ))

   ;; These are the "universal syntax classes" that doom-themes establishes.
   ;; These *must* be included in every doom themes, or your theme will throw an
   ;; error, as they are used in the base theme defined in doom-themes-base.
   (highlight      blue)
   (vertical-bar   (doom-darken green 0.1))
   (selection      cyan)
   (builtin        green)
   (comments       (if doom-mori-brighter-comments dark-cyan base5))
   (doc-comments   (doom-lighten (if doom-mori-brighter-comments dark-cyan base5) 0.25))
   (constants      cyan)
   (functions      red)
   (keywords       red)
   (methods        cyan)
   (operators      green)
   (type           yellow)
   (strings        green)
   (variables      green)
   (numbers        orange)
   (region         `(,(doom-lighten (car bg-alt) 0.15) ,@(doom-lighten (cdr base1) 0.35)))
   (error          red)
   (warning        yellow)
   (success        green)
   (vc-modified    orange)
   (vc-added       green)
   (vc-deleted     red)
   ;; These are extra color variables used only in this theme; i.e. they aren't
   ;; mandatory for derived themes.
   (modeline-fg              fg)
   (modeline-fg-alt          base5)
   (modeline-bg              (if doom-mori-brighter-modeline
                                 (doom-darken blue 0.45)
                               (doom-darken bg-alt 0.1)))
   (modeline-bg-alt          (if doom-mori-brighter-modeline
                                 (doom-darken blue 0.475)
                               `(,(doom-darken (car bg-alt) 0.15) ,@(cdr bg))))
   (modeline-bg-inactive     `(,(car bg-alt) ,@(cdr base1)))
   (modeline-bg-inactive-alt `(,(doom-darken (car bg-alt) 0.1) ,@(cdr bg)))

   (-modeline-pad
    (when doom-mori-padded-modeline
      (if (integerp doom-mori-padded-modeline) doom-one-padded-modeline 4)))

   (org-quote `(,(doom-lighten (car bg) 0.05) fg)))






  ;;;; Base theme face overrides
  (((line-number &override) :foreground base4)
   ((line-number-current-line &override) :foreground fg)
   ((font-lock-comment-face &override)
    :background (if doom-mori-comment-bg (doom-lighten bg 0.05) 'unspecified))
   (mode-line
    :background modeline-bg :foreground modeline-fg
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg)))
   (mode-line-inactive
    :background modeline-bg-inactive :foreground modeline-fg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive)))
   (mode-line-emphasis :foreground (if doom-mori-brighter-modeline base8 highlight))

   ;;;; css-mode <built-in> / scss-mode
   (css-proprietary-property :foreground orange)
   (css-property             :foreground green)
   (css-selector             :foreground blue)
   ;;;; doom-modeline
   (doom-modeline-bar :background (if doom-mori-brighter-modeline modeline-bg highlight))
   (doom-modeline-buffer-file :inherit 'mode-line-buffer-id :weight 'bold)
   (doom-modeline-buffer-path :inherit 'mode-line-emphasis :weight 'bold)
   (doom-modeline-buffer-project-root :foreground green :weight 'bold)
   ;;;; elscreen
   (elscreen-tab-other-screen-face :background "#353a42" :foreground "#1e2022")
   ;;;; ivy
   (ivy-current-match :background dark-blue :distant-foreground base0 :weight 'normal)
   ;;;; LaTeX-mode
   (font-latex-math-face :foreground green)
   ;;;; markdown-mode
   (markdown-markup-face :foreground base5)
   (markdown-header-face :inherit 'bold :foreground red)
   ((markdown-code-face &override) :background (doom-lighten base3 0.05))
   ;;;; rjsx-mode
   (rjsx-tag :foreground red)
   (rjsx-attr :foreground orange)
   ;;;; solaire-mode
   (solaire-mode-line-face
    :inherit 'mode-line
    :background modeline-bg-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-alt)))
   (solaire-mode-line-inactive-face
    :inherit 'mode-line-inactive
    :background modeline-bg-inactive-alt
    :box (if -modeline-pad `(:line-width ,-modeline-pad :color ,modeline-bg-inactive-alt)))


   ;;;; outline <built-in>
   ((outline-1 &override) :foreground red)
   ((outline-2 &override) :foreground green)
   ((outline-3 &override) :foreground cyan)
   ((outline-4 &override) :foreground (doom-lighten yellow 0.2))
   ((outline-5 &override) :foreground (doom-lighten blue 0.25))
   ((outline-6 &override) :foreground (doom-lighten green 0.4))
   ((outline-7 &override) :foreground (doom-lighten red 0.5))
   ((outline-8 &override) :foreground (doom-lighten cyan 0.6))
   ;;;; org <built-in>
   ((org-code &override) :foreground orange)
   (org-date :foreground green)
   (org-document-info :foreground red)
   (org-document-title :foreground red)
   (org-drawer :foreground (doom-lighten cyan 0.4))
   (org-ellipsis :underline nil :foreground orange)
   (org-formula :foreground green)
   (org-meta-line :foreground comments)
   (org-list-dt :foreground cyan)
                                        ; (org-list-dt :foreground yellow)
   ((org-quote &override) :inherit 'italic :foreground base7 :background org-quote)
   (org-table :foreground cyan)
   (org-tag :foreground (doom-darken comments 0.15) :weight 'normal)
   (org-todo :foreground blue :bold 'inherit)
   (org-verbatim :foreground yellow)
   ((org-block &override) :background base2)
   ((org-block-background &override) :background base2)
   ((org-block-begin-line &override) :background base2)

   ;; Rainbow delimiters
   (rainbow-delimiters-depth-1-face :foreground cyan)
   (rainbow-delimiters-depth-2-face :foreground yellow)
   (rainbow-delimiters-depth-3-face :foreground red)
   (rainbow-delimiters-depth-4-face :foreground green)

   ;; Markdown
   ((markdown-url-face &override) :foreground green)

   ;; Magit
   ;; ((magit-filename &override) :foreground green)
   ;; (magit-section-heading             :foreground cyan :weight 'bold)
   ;; (magit-branch-current              :underline green :inherit 'magit-branch-local)
   ;; (magit-diff-hunk-heading           :background base3 :foreground fg-alt)
   ;; (magit-diff-hunk-heading-highlight :background bg-alt :foreground fg)
   ;; (magit-diff-context                :foreground base3 :foreground fg-alt)
   ;; (magit-diff-modified :foreground green)
   ((git-commit-comment-file &override) :foreground green)
   ((git-commit-comment-branch-local &override) :foreground blue)
   )


  ;;;; base theme variable overrides-
  ())

;;; doom-mori-theme.el ends here
