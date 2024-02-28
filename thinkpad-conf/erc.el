

;; (require 'erc)
;; (require 'erc-services)
;; (require 'erc-log)
;; (require 'erc-notify)
;; (require 'erc-spelling)

(erc-autojoin-mode 1)
(erc-services-mode 1)
(erc-truncate-mode 1)
(setq erc-autojoin-timing 'ident)

(setq erc-autojoin-channels-alist
    '(( "freenode.net"
        "#emacs"
        "#scheme"
        
        )))


(s! erc-nick "alinsoar"
    erc-password "Luminy@1789"  
    erc-hide-list '( "332" "353" "JOIN" "KICK" "NICK" "PART" "QUIT" "MODE" )
    erc-nickserv-passwords '((freenode (("alinsoar" . "Luminy@1789")))) 
    
    )

;; (s!
;;  erc-mode-values
;; `(
;; (erc-server "irc.freenode.net" )
;; (erc-user-full-name "alinsoar" )
;; (erc-nick-uniquifier "_")
;; (erc-try-new-nick-p t )
;; (erc-fill-column 100 )
;; (erc-hide-timestamps t )
(erc-nickserv-passwords ((freenode (("alinsoar" . "password")))) )
(erc-prompt-for-nickserv-password nil )
;; (erc-save-buffer-on-part t )
;; (erc-nick "alinsoar" )
;; (erc-prompt-for-password nil )
;; (erc-header-line-format "%n on %S")
;; (erc-header-line-face-method t)
;; (erc-prompt "# ")
;; (erc-show-my-nick t)
;; (erc-max-buffer-size 10e10)
;; (erc-save-queries-on-quit nil)
;; ;; (erc-log-channels-directory ,(concat config-root-dir "erc-logs/"))
;; (erc-log-channels-directory "~/.erc-logs/")
;; (erc-generate-log-file-name-function erc-generate-log-file-name-with-date)
;; (erc-save-buffer-on-part nil)
;; (erc-log-write-after-insert t)
;; (erc-log-write-after-send t)
;; (erc-log-insert-log-on-open nil)
;; ))


(erc-log-mode)

(defun my-erc-remove-trailing-whitespace (proc parsed)
  "Remove trailing whitespace from the current message.
Some IM clients use an OTR plug-in that sends some annoying
trailing space to the screen, so we want to mop that up."
  (let ((msg (erc-response.contents parsed)))
    (when (stringp msg)
      (setf (erc-response.contents parsed)
            (erc-replace-regexp-in-string "[[:space:]]+\\'" "" msg))
      nil)))
(add-hook 'erc-server-PRIVMSG-functions 'my-erc-remove-trailing-whitespace)

(goto-address-mode)
