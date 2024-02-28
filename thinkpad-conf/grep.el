


(setq grep-program "grep")

(defvar grep-exclude
  "--exclude-dir=[.]git --exclude-dir=[.]svn --exclude-dir=[.]backup")

(setq grep-command
      (concat "grep " grep-exclude " -I --no-messages --color -nH -e "))



