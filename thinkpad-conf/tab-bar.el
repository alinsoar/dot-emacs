;;; -*- lexical-binding: t; buffer-read-only:nil -*-

;;; GLOBAL CONFIGURATION for tab-bar

(defvar new/ws/buf "*scratch*")

(setq tab-bar-tab-name-function (lambda () "scratch")
      tab-bar-new-tab-choice new/ws/buf
      tab-bar-tab-hints nil
      tab-bar-show t
      tab-bar-separator "  "
      tab-bar-close-button-show nil
      tab-bar-new-button-show nil
      tab-bar-format
      '(
         tab-bar-format-history
         tab-bar-format-tabs
         tab-bar-separator
         tab-bar-format-add-tab
         ))

;; (add-hook 'tab-bar-tab-post-open-functions
;;           'set-new-tab-name
;;           90
;;           nil )

