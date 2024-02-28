

;; icon and frame name
(setq-default icon-title-format '(t "%b"))

;; title de la fenetre de Emacs
(setq frame-title-format "Emacs - %f")

;; le cadre fils doit heriter les proprietes de son parent
(set-frame-parameter nil 'alpha '(95 95))

(setq
 frame-inherited-parameters
 '(parent-id
   explicit-name
   display
   visibility
   icon-name
   outer-window-id
   window-id
   top
   left
   buried-buffer-list
   buffer-list
   unsplittable
   modeline
   width
   height
   name
   fullscreen
   background-mode
   display-type
   alpha
   scroll-bar-width
   cursor-type
   auto-lower
   auto-raise
   icon-type
   wait-for-wm
   title
   buffer-predicate
   tool-bar-lines
   menu-bar-lines
   scroll-bar-background
   scroll-bar-foreground
   right-fringe
   left-fringe
   line-spacing
   screen-gamma
   border-color
   cursor-color
   mouse-color
   background-color
   foreground-color
   vertical-scroll-bars
   horizontal-scroll-bars
   vertical-scroll-bars
   internal-border-width
   border-width
   font
   font-backend ))


(setq
 initial-frame-alist
 '(
   ;; (parent-id . )
   ;; (explicit-name)
   ;; (display . ":0.0")
   (visibility . t)
   (icon-name)
   ;; (outer-window-id . "33554595")
   ;; (window-id . "33554602")
   ;;(top . 177)
   ;;(left . 580)
   (buried-buffer-list nil)
   (buffer-list nil)
   (unsplittable)
   ;; (minibuffer . nil)
   ;; (modeline . t)
   (width . 100)
   (height . 35)
   ;; (name . " *Minibuf-1*")
   (environment)
   (sticky)
   (cursor-color . "royal blue")
   ;; (background-mode . dark)
   (display-type . color)
   (horizontal-scroll-bars . nil)
   (window-system . x)
   (alpha 95 95)
   (scroll-bar-width . 0)
   (cursor-type . box)
   (auto-lower)
   (auto-raise)
   (icon-type . t)
   (tool-bar-position . top)
   (fullscreen)
   ;; (wait-for-wm . t)
   (title)
   (buffer-predicate)
   (tool-bar-lines . 0)
   (menu-bar-lines . 0)
   (scroll-bar-background . "grey75")
   (scroll-bar-foreground)
   (right-fringe . 10)
   (left-fringe . 10)
   (line-spacing)
   (screen-gamma)
   (border-color . "black")
   (mouse-color . "red")
   ;; (background-color . "black")
   ;; (foreground-color . "white smoke")
   (vertical-scroll-bars)
   (internal-border-width . 0)
   (border-width . 0)
   (font-parameter)
   ;; (font . "")
   ;; (font-backend 'xft 'x)
   ) )



;;; undecorate, inspired from Juri Linkov

(add-hook 'after-make-frame-functions 'toggle-frame-maximized)
(add-hook 'after-make-frame-functions
          (lambda (frame)
            (modify-frame-parameters frame '((undecorated . t)))
            ;; Some OS resources change background to grey, revert it back to white:
            (modify-frame-parameters frame '((background-color . "white")))
            ;; For some OS window managers that don't put focus to new frames:
            (select-frame-set-input-focus frame)))

;; Apply ‘undecorated’ to new frames created by these commands:
(advice-add 'make-frame-on-monitor :around
            (lambda (orig-fun monitor &optional display parameters)
              (funcall orig-fun monitor display
                       (append '((undecorated . t)) parameters)))
            '((name . make-frame-on-monitor-undecorated)))

(advice-add 'make-frame-on-current-monitor :around
            (lambda (orig-fun &optional parameters)
              (funcall orig-fun (append '((undecorated . t)) parameters)))
            '((name . make-frame-on-current-monitor-undecorated)))

;; Undecorate the initial frame as well
(modify-frame-parameters nil '((undecorated . t)))

