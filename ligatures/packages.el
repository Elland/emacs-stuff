;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;


(defun load-if-exists (file)
  (if (file-exists-p file)
      (progn
        (load file)
        (message (format "Loading file: %s" file)))
    (message (format "No %s file. So not loading one." file))))

(package-install 'company)
(add-hook 'after-init-hook 'global-company-mode)

(package-install 'diminish)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward)

;; don't forget to actualy try it out!
(package-install 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(defun toggle-transparency ()
  (interactive)
  (let ((param (cadr (frame-parameter nil 'alpha))))
    (if (and param (/= param 100))
        (set-frame-parameter nil 'alpha '(100 100))
      (set-frame-parameter nil 'alpha '(85 50)))))
(global-set-key (kbd "C-c t") 'toggle-transparency)

;; human readable numbers for dired lists
(setq dired-listing-switches "-alh")

(when (window-system)
	    (set-default-font "Fira Code"))
	  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
	                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
	                 (36 . ".\\(?:>\\)")
	                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
	                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
	                 (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
	                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
	                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
	                 (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
	                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
	                 (48 . ".\\(?:x[a-zA-Z]\\)")
	                 (58 . ".\\(?:::\\|[:=]\\)")
	                 (59 . ".\\(?:;;\\|;\\)")
	                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
	                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
	                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
	                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
	                 (91 . ".\\(?:]\\)")
	                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
	                 (94 . ".\\(?:=\\)")
	                 (119 . ".\\(?:ww\\)")
	                 (123 . ".\\(?:-\\)")
	                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
	                 (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
	                 )
	                 ))
	(dolist (char-regexp alist)
	  (set-char-table-range composition-function-table (car char-regexp)
	                        `([,(cdr char-regexp) 0 font-shape-gstring]))))
