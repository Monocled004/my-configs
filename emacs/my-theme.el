;;; package --- Summary
;;; Commentary:
;;; Code:

(require 'autothemer)

(autothemer-deftheme my "my-dark theme"

  ;; Specify the color classes used by the theme
  ((((class color) (min-colors #xFFFFFF)))

   ;; Specify the color palette, color columns correspond to each of the classes above.
   (my-bg            "#000000")
   (my-bg1           "#1b3358")
   (my-bg2           "#473E66")
   (my-cursor        "#BD83B8")
   (my-fg            "#F5D7DB")
   (my-fg1           "#F1916D")
   (act1             "#222226")
   (act2             "#5d4d7a")
   (base             "#b2b2b2")
   (base-dim         "#686868")
   (bg1              "#101010")
   (bg2              "#212026")
   (bg3              "#100a14")
   (bg4              "#0a0814")
   (bg-alt           "#42444a")
   (border           "#5d4d7a")
   (cblk             "#cbc1d5")
   (cblk-bg          "#2f2b33")
   (cblk-ln          "#827591")
   (cblk-ln-bg       "#373040")
   (cursor           "#e3dedd")
   (const            "#a45bad")
   (comment          "#2aa1ae")
   (comment-light    "#2aa1ae")
   (comment-bg       "#292e34")
   (comp             "#c56ec3")
   (err              "#e0211d")
   (func           "#bc6ec5")
   (head1          "#4f97d7")
   (head1-bg       "#293239")
   (head2          "#2d9574")
   (head2-bg       "#293235")
   (head3          "#67b11d")
   (head3-bg       "#293235")
   (head4          "#b1951d")
   (head4-bg       "#32322c")
   (highlight      "#444155")
   (highlight-dim  "#3b314d")
   (keyword        "#4f97d7")
   (lnum           "#44505c")
   (mat            "#86dc2f")
   (meta           "#9f8766")
   (str            "#2d9574")
   (suc            "#86dc2f")
   (ttip           "#9a9aba")
   (ttip-sl        "#5e5079")
   (ttip-bg        "#34323e")
   (type           "#ce537a")
   (var            "#7590db")
   (war            "#dc752f")
   ;; colors
   (aqua           "#2d9574")
   (aqua-bg        "#293235")
   (green          "#67b11d")
   (green-bg       "#293235")
   (green-bg-s     "#29422d")
   (cyan           "#28def0")
   (red            "#f2241f")
   (red-bg         "#3c2a2c")
   (red-bg-s       "#512e31")
   (blue           "#4f97d7")
   (blue-bg        "#293239")
   (blue-bg-s      "#2d4252")
   (magenta        "#a31db1")
   (yellow         "#b1951d")
   (yellow-bg      "#32322c"))

    ;; Specifications for Emacs faces.
    ;; Simpler than deftheme, just specify a face name and
    ;; a plist of face definitions (nested for :underline, :box etc.)
  (
;;;;; basics
   (cursor                       (:background cursor))
   (default                      (:background bg1 :foreground base))
   (default-italic               (:italic t))
   (error                        (:foreground err))
   (eval-sexp-fu-flash           (:background suc :foreground bg1))
   (eval-sexp-fu-flash-error     (:background err :foreground bg1))
   (font-lock-builtin-face       (:foreground keyword))
   (font-lock-comment-face       (:foreground comment :background comment-bg :slant 'italic))
   (font-lock-constant-face      (:foreground const))
   (font-lock-doc-face           (:foreground meta))
   (font-lock-function-name-face (:foreground func :bold t))
   (font-lock-keyword-face       (:bold t :foreground keyword :slant 'italic))
   (font-lock-negation-char-face (:foreground const))
   (font-lock-preprocessor-face  (:foreground func))
   (font-lock-reference-face     (:foreground const))
   (font-lock-string-face        (:foreground str))
   (font-lock-type-face          (:foreground type :bold t))
   (font-lock-variable-name-face (:foreground var))
   (font-lock-warning-face       (:foreground war :background bg1))
   (fringe                       (:background bg1 :foreground base))
   (header-line                  (:background bg2))
   (highlight                    (:foreground base :background highlight))
   (hl-line                      (:background bg2 :extend t))
   (isearch                      (:foreground bg1 :background mat))
   (lazy-highlight               (:background green-bg-s :weight 'normal))
   (link                         (:foreground comment :underline t))
   (link-visited                 (:foreground comp :underline t))
   (match                        (:background highlight :foreground mat))
   (minibuffer-prompt            (:bold t :foreground keyword))
   (page-break-lines             (:foreground act2))
   (region                       (:background highlight :extend t))
   (secondary-selection          (:background bg3))
   (shadow                       (:foreground base-dim))
   (success                      (:foreground suc))
   (tooltip                      (:background ttip-sl :foreground base :bold nil :italic nil :underline nil))
   (vertical-border              (:foreground border))
   (warning                      (:foreground war))
   (widget-button-pressed        (:foreground green))

;;;;;custom-buttom
   (custom-button                (:background act1 :foreground base :box (:color border :line-width 2)))
   (custom-button-mouse          (:inherit 'custom-button))
   (custom-button-pressed        (:background act1 :foreground base))
   
;;;;;menu-bar
   (menu                         (:foreground base :background act1 :height 250 :box (:color border)))
   
;;;;; mode-line
   (mode-line               (:foreground base :background act1 :height 150 :box (:color border :line-width 1)))
   (mode-line-buffer-id          (:bold t :foreground base :background act2))
   (mode-line-inactive           (:foreground base :background bg1  :box (:color border :line-width 1)))
   (mode-line-d-mode         (:bold t :foreground base :background act2))
   (echo-area                    (:background 'white :height 180))
   (mode-line                (:foreground base :background act2 :box (:line-width 1 :style 'released-button)))

;;;;; tabbar
   (tab-bar                      (:background act1 :foreground base :height 200 :box (:color border)))
   (tab-bar-tab-group-current    (:background act2 :foreground base :height 100 :box (:color border)))
   (tab-bar-tab-group-inactive   (:background act1 :foreground base :height 100 :box (:color border)))
   (tab-bar-tab-inactive         (:background act1 :foreground base :height 100 :box (:color border)))
   (tab-bar-tab-ungrouped        (:background act1 :foreground base :height 100 :box (:color border)))
   (tab-bar-button                (:inherit 'tabbar-default))
   (tab-bar-button-highlight      (:inherit 'tabbar-default))
   (tab-bar-default               (:background bg1 :foreground head1 :height 0.9))
   (tab-bar-highlight             (:underline t))
   (tab-bar-selected              (:inherit 'tabbar-default :foreground func :weight 'bold))
   (tab-bar-selected-modified     (:inherit 'tabbar-default :foreground red :weight 'bold))
   (tab-bar-separator             (:inherit 'tabbar-default))
   (tab-bar-unselected            (:inherit 'tabbar-default :background bg1 :slant 'italic :weight 'light))
   (tab-bar-unselected-modified   (:inherit 'tabbar-unselected :background bg1 :foreground red))

;;;;; tabline
   (tab-line                      (:inherit 'tab-bar))
   (tab-line-tab-current          (:bold t :foreground base :background act2))
   (tab-line-tab-inactive         (:inherit 'mode-line))

;;;;;toolbar
   (tool-bar                     (:background act1 :foreground base :height 250 :box (:color border)))

;;;;;scroll-bar
   (scroll-bar                   (:background act2 :foreground base :box (:color border)))

;;;;;window-divider
   (window-divider               (:foreground act2))
   (window-divider-first-pixel   (:inherit 'window-divider))
   (window-divider-last-pixel    (:inherit 'window-divider))
  )
)
    ;; Forms after the face specifications are evaluated.
    ;; (palette vars can be used, read below for details.)
(provide-theme 'my)

;;; my-theme.el ends here
