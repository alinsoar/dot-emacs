
(defconst CONFIG-ROOT-DIR
  (file-name-directory #$)		; load-file-name
  "this is the root of the configuration directory, where the
   current file (emacs-init.el) is located")

(defvar COLOR-THEME "daylight"
  "valid values of `active-theme` interpreted by load-config to
   load a theme are:

    *** t means that load-config denies loading the particular
        theme for each mode, but loads only the global theme from
        default.el.

    *** nil means to avoid loading any theme, and not to load
        default.el at all.

    *** a string S means to load the theme-S, where the S is
        appended after the word `theme` and a dash. So each theme
        MUST begin with the string `theme` followed by some
        string S. ")

(message "Config directory: %s" CONFIG-ROOT-DIR)

(defvar main-files
  (directory-files
   (concat CONFIG-ROOT-DIR "main")
   t
   "^[[:alpha:]]"))

(mapc 'load-file main-files)

(check-dot-emacs-validity)              ; check ~/.emacs

(apply 'load-lib library-files)

(load-config 'global)
(load-config 'global-keybinding)
(load-config 'frame)

(and COLOR-THEME
     (load-theme-config-file-p)
     (load-theme 'default)
     (with-current-buffer "*Messages*"
       (load-theme 'messages-buffer))
     (check-missing-modes)
     )

