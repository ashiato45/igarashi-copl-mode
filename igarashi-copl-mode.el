

;; (defvar igarashi-copl-mode-map
;;   (let ((map (make-keymap)))
;;     (define-key map (kbd "C-c y") 'Igarashi-CoPL-copy-all)
;;     map)
;; "Igarashi")

(defun Igarashi-CoPL-copy-all ()
  "Put all into the yank-ring"
  (interactive)
  (beginning-of-buffer ())
  (set-mark-command ())
  (end-of-buffer ())
  )

(defconst igarashi-copl-syntax-keywords
  (list
   (cons
    (concat "\\(//.*\\|(\\*.*\\*)\\)")
    '((1 font-lock-comment-face)  )
    )

   (cons
    (concat "\\(evalto\\|==>\\|:\\|=>\\||-\\|/\\|changes\\|to\\|plus\\|times\\|is\\|less than\\|not less than\\|--->\\|-d->\\|-\\*->\\)\\s-")
    '((1 font-lock-keyword-face)))
   (cons
    (concat "\\(by\\)")
    '((1 font-lock-builtin-face)))
   (cons
    (concat "\\(\\?\\)")
    '((1 font-lock-builtin-face)))
   (cons
    (concat "\\(def\\)")
    '((1 font-lock-builtin-face))
    )
   
   (cons
    (concat "\\(\\$\\(env\\|e\\|v\\|d\\|t\\|s\\|S\\)\\([0-9]\\|_\\|'\\)*\\)")
    '((1 font-lock-variable-name-face)  )
    )
   
   
   ))


(define-derived-mode igarashi-copl-mode fundamental-mode "Igarashi-CoPL"
  "Major mode for Igarashi-CoPL"
  (progn
    (setq tab-width 4)
    ;; (setq indent-line-function 'indent-to-left-margin)
    (setq tab-stop-list (number-sequence 4 120 4))    
    ;; )
    
    (setq font-lock-defaults '(igarashi-copl-syntax-keywords))
  )
)

   

(add-to-list 'auto-mode-alist '("\\.igarashi\\'" . igarashi-copl-mode))

(provide 'igarashi-copl-mode)
