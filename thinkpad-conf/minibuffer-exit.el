

(remove-hook 'minibuffer-exit-hook 'minibuffer-exit)

(and (boundp 'mini-saved-cursor-color)
     (pop-cursor-color mini-saved-cursor-color))

