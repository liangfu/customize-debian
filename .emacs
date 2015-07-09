;;User information
(setq user-full-name "Liangfu Chen")
(setq user-mail-address "liangfu.chen@nlpr.ia.ac.cn")
;; (setq user-organization "Institute of Automation, Chinese Academy of Sciences")
(setq user-organization "Brainnetome Center \& NLPR at Institute of Automation, CAS")

;;Directories to find header and source files
(setq ff-search-directories
      '("." "../src" "../include"))

;;; Bind the toggle function to a global key
(global-set-key (kbd "C-c o") 'ff-find-other-file)

;;Diable back up files option
(setq make-backup-files nil)

;;Display time options
(setq display-time t
	  display-time-24hr-format t)
(display-time)

;;Using [F5] to refresh file list
(defun refresh-file ()
  (interactive)
  (revert-buffer t t t))
(global-set-key [f5] 'refresh-file)
(global-set-key [f9] 'compile)

;;Switching between windows
(global-set-key [M-left] 'windmove-left) 
(global-set-key [M-right] 'windmove-right) 
(global-set-key [M-up] 'windmove-up) 
(global-set-key [M-down] 'windmove-down)

;;Treat 'y' or <CR> as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)
(define-key query-replace-map [return] 'act)

(setq cc-other-file-alist
      '(("\\.cpp$" (".h" ".hpp"))
        ("\\.h$" (".cpp" ".c" ".m" ".mm"))
        ("\\.hpp$" (".cpp" ".c"))
        ("\\.m$" (".h"))
        ("\\.mm$" (".h"))
        ))
;; (setq cc-other-file-alist
;;       '(("\\.c"   (".h"))
;;        ("\\.cpp"   (".h"))
;;        ("\\.h"   (".c"".cpp"))))

;;Using aspectj-mode
;;(require 'aspectj-mode)

;;Using ropemacs
;(require 'pymacs)
;(pymacs-load "ropemacs" "rope-")

;;Using line-num mode
;; (require 'linum)
;; (global-linum-mode 1)
;; (setq linum-format (lambda (line) (propertize (format (let ((w (length (number-to-string (count-lines (point-min) (point-max)))))) 
;; 														(concat "%" (number-to-string w) "d ")) line) 'face 'linum)))

;;Using xcscope in emacs
(require 'xcscope)

(require 'apache-mode)

;;Using xcscope in emacs
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

;; using matlab-mode
(autoload 'matlab-mode "matlab" "Enter MATLAB mode." t)
(if (eq system-type 'darwin)
  ; something for OS X if true
	(setq auto-mode-alist (cons '("\\.m\\'" . objc-mode) auto-mode-alist))
  ; optional something if not
	(setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
)
;; (setq auto-mode-alist (cons '("\\.m\\'" . matlab-mode) auto-mode-alist))
(autoload 'matlab-shell "matlab" "Interactive MATLAB mode." t)
(setq matlab-indent-function-body t)  ; if you want function bodies indented
(setq matlab-verify-on-save-flag nil) ; turn off auto-verify on save
(defun my-matlab-mode-hook ()
  (setq indent-tabs-mode nil)
  (setq default-tab-width 2)
  (setq tab-width 2)
  (setq tab-stop-list '(2 4 6 8 10 12))
)
(add-hook 'matlab-mode-hook 'my-matlab-mode-hook)
;; (defun my-matlab-shell-mode-hook ()
;;   '())
;; (add-hook 'matlab-shell-mode-hook 'my-matlab-shell-mode-hook)
;; (add-to-list 'load-path "/etc/emacs23/site-start.d/")
;; (load-library "matlab-load")
;; (require 'matlab-load)

;;Setting Doxymacs mode
(require 'doxymacs)
(add-hook 'c-mode-common-hook 'doxymacs-mode)

;; (require 'w3m-load)
;; (require 'mime-w3m)

;;Customized syntax highlighting colors
;(set-foreground-color "#ffffff")
;(set-background-color "#000000")
;(set-cursor-color "#ffffff")
;(custom-set-variables '(load-home-init-file t t))

;;Setting AUCTex mode
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)
(setq TeX-PDF-mode t)

;; (fset 'remove-linenums
;;    "\C-@\C-[[1;5C\C-w\C-[OB")
;; (global-set-key (kbd "C-x C-a") 'remove-linenums)

;;Keyboard scroll one line at a time
;;(setq scroll-step 1)

;;Show column number
(column-number-mode t)

;;Setting Language Environment
;;(set-language-environment 'UTF-8)
;; (set-language-environment 'euc-kr)
;; (modify-coding-system-alist 'file "\\.tex\\'" 'euc-kr)
(setq indent-tabs-mode nil)
(setq default-tab-width 2)
(setq tab-width 2)
(setq tab-stop-list '(2 4 6 8 10 12 14 16 20 24 28 32 36 40 44 48 52 56 60 64 68 72 76 80))

;; Add .fx to c-mode
;; Add .h to c++-mode
(add-to-list 'auto-mode-alist '("\\.fx\\'" . c++-mode))		;; HLSL shader source code
(add-to-list 'auto-mode-alist '("\\.cl\\'" . c++-mode))		;; OpenCL source code
(add-to-list 'auto-mode-alist '("\\.cu\\'" . c++-mode))		;; CUDA source code
(add-to-list 'auto-mode-alist '("\\.glsl\\'" . c++-mode))	;; OpenGL shader source code
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
;; (add-to-list 'auto-mode-alist '("\\.m\\'" . octave-mode))
(add-to-list 'auto-mode-alist '("\\SConstruct\\'" . python-mode))
(add-to-list 'auto-mode-alist '("\\SConscript\\'" . python-mode))

(if (file-exists-p "SConscript") 
	(setq compile-command "scons -u") 
  (if (file-exists-p "SConstruct") 
	  (setq compile-command "scons"))
)

;;Setting startup screen mode
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(TeX-output-view-style (quote (("^dvi$" ("^landscape$" "^pstricks$\\|^pst-\\|^psfrag$") "%(o?)dvips -t landscape %d -o && gv %f") ("^dvi$" "^pstricks$\\|^pst-\\|^psfrag$" "%(o?)dvips %d -o && gv %f") ("^dvi$" ("^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "^landscape$") "%(o?)xdvi %dS -paper a4r -s 0 %d") ("^dvi$" "^\\(?:a4\\(?:dutch\\|paper\\|wide\\)\\|sem-a4\\)$" "%(o?)xdvi %dS -paper a4 %d") ("^dvi$" ("^\\(?:a5\\(?:comb\\|paper\\)\\)$" "^landscape$") "%(o?)xdvi %dS -paper a5r -s 0 %d") ("^dvi$" "^\\(?:a5\\(?:comb\\|paper\\)\\)$" "%(o?)xdvi %dS -paper a5 %d") ("^dvi$" "^b5paper$" "%(o?)xdvi %dS -paper b5 %d") ("^dvi$" "^letterpaper$" "%(o?)xdvi %dS -paper us %d") ("^dvi$" "^legalpaper$" "%(o?)xdvi %dS -paper legal %d") ("^dvi$" "^executivepaper$" "%(o?)xdvi %dS -paper 7.25x10.5in %d") ("^dvi$" "." "%(o?)xdvi %dS %d") ("^pdf$" "." "evince %o") ("^html?$" "." "netscape %o"))))
 '(TeX-view-program-selection (quote (((output-dvi style-pstricks) "dvips and gv") (output-dvi "xdvi") (output-pdf "Evince") (output-html "xdg-open"))))
 '(column-number-mode t)
 '(display-time-mode t)
 '(inhibit-startup-screen t)
 '(tool-bar-mode nil))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

;; This is the logic, and can be used in a program.  The other
;; functions use this interactively in various ways.
(defun wc-non-interactive (start end)
  "Count the number of words in the current region."
  (save-excursion
    (save-restriction
      (narrow-to-region start end)
      (goto-char (point-min))
      (count-matches "\\sw+"))))
;;;###autoload
(defun count-words-region (start end)
  "Display number of words in the region."
  (interactive "r")
  (message (concat "The current region contains "
				      (number-to-string
					       (wc-non-interactive start end))
					     " words.")))
(global-set-key (kbd "M-#") 'count-words-region)

;;-------------------------------------------------------
;; C/C++ mode fix
(defun c++-mode-fix ()
  (setq tab-width 4)
;  (define-key c++-mode-map "\C-m" 'reindent-then-newline-and-indent)
  (define-key c++-mode-map "\C-ce" 'c-comment-edit)
  (setq c++-auto-hungry-initial-state 'none)
  (setq c++-delete-function 'backward-delete-char)
  (setq c++-tab-always-indent t)
  (setq c-indent-level 2)
  (setq c-continued-statement-offset 2)
  (setq c++-empty-arglist-indent 2)
	(if (file-exists-p "CMakeCache.txt")
		(set (make-local-variable 'compile-command)
				 (let ((file (file-name-nondirectory buffer-file-name)))
					 "make VERBOSE=1")
				 )
		)
  ;; (unless (file-exists-p "Makefile")
  ;;   (set (make-local-variable 'compile-command)
  ;; 		 ;(let ((file (file-name-nondirectory buffer-file-name)))
  ;; 		 ;(let ((file (file-name-sans-extension buffer-file-name)))
  ;; 		 (let ((file (file-name-sans-extension file-name-nodirectory buffer-file-name)))
  ;;          (concat "g++ -Wall" file))
  ;; 		 )
  ;; 	)
  ;; (unless (file-exists-p "SConstruct")
  ;;   (set (make-local-variable 'compile-command)
  ;; 		 ;(let ((file (file-name-nondirectory buffer-file-name)))
  ;; 		 ;(let ((file (file-name-sans-extension buffer-file-name)))
  ;; 		 (let ((file (file-name-sans-extension file-name-nodirectory buffer-file-name)))
  ;;          (concat "scons" file))
  ;; 		 )
  ;; 	)
  
)
(add-hook 'c++-mode-hook 'c++-mode-fix)

;;Using `google-c-style' in emacs
;; (require 'google-c-style)
;; (add-hook 'c-mode-common-hook 'google-set-c-style)
;; (add-hook 'c-mode-common-hook 'google-make-newline-indent)

(defun c-mode-common-fix ()
  (setq tab-width 2)
  (setq c-auto-hungry-initial-state 'none)
  (setq c-tab-always-indent t)
  (setq c-indent-level 2)
  (setq c-basic-offset 2)
  (c-set-offset 'substatement-open 0)
  (setq c-continued-statement-offset 2)
  (setq c-brace-offset -2)
  (setq c-label-offset -2)
  (setq indent-tabs-mode t))
(add-hook 'c-mode-common-hook 'c-mode-common-fix)

(add-hook 'java-mode-hook (lambda ()
														(setq c-basic-offset 2
																	tab-width 2
																	indent-tabs-mode nil)))

;;-------------------------------------------------------
;; Python support
(setq-default python-indent 2)
(setq-default py-indent-offset 2)
(defun python-mode-fix ()
  (setq ;; py-smart-indentation nil
        ;; py-indent-offset 2
        tab-width 2
        indent-tabs-mode nil
        current-language-environment "UTF-8"
        )
  ;; (unless (file-exists-p "Makefile")
  ;;   (set (make-local-variable 'compile-command)
  ;;        (let ((file (file-name-nondirectory buffer-file-name)))
  ;;          (concat "python " file))))
  )
(add-hook 'python-mode-hook 'python-mode-fix)

(defun python-reinstate-current-directory ()
  "When running Python, add the current directory ('') to the head of sys.path.
For reasons unexplained, run-python passes arguments to the
interpreter that explicitly remove '' from sys.path. This means
that, for example, using `python-send-buffer' in a buffer
visiting a module's code will fail to find other modules in the
same directory.

Adding this function to `inferior-python-mode-hook' reinstates
the current directory in Python's search path."
  (python-send-string "sys.path[0:0] = ['']"))

(add-hook 'inferior-python-mode-hook 'python-reinstate-current-directory)

(setq js-indent-level 2)

(eval-after-load 'autoinsert
	;; ((header-file-name (concat (downcase name) ".h"))
	;;  (header-include-string (upcase (concat name "_HH_INCLUDED")))
	;;  (def-file-name    (concat (downcase name) ".cc")))
  '(define-auto-insert
     '("\\.\\([Cc]\\|cc\\|cxx\\|cpp\\|java\\)\\'" . "C/C++ source")
     '("Short description: "
       "/** -*- c++ -*- \n" 
			 " *\n" 
       " * \\file   " (file-name-nondirectory (buffer-file-name)) "\n"
       " * \\date   " (current-time-string) "\n *\n"
       " * \\copyright \n" 
			 " * Copyright (c) " (substring (current-time-string) -4) " "user-full-name " <" user-mail-address ">.\n"  
			 " * All rights reserved.\n"
			 " * \n"
			 " * Redistribution and use in source and binary forms are permitted\n"
			 " * provided that the above copyright notice and this paragraph are\n"
			 " * duplicated in all such forms and that any documentation,\n"
			 " * advertising materials, and other materials related to such\n"
			 " * distribution and use acknowledge that the software was developed\n"
			 " * by the " user-organization ". The \n"
			 " * name of the " user-organization " \n"
			 " * may not be used to endorse or promote products derived\n"
			 " * from this software without specific prior written permission.\n"
			 " * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR\n"
			 " * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED\n"
			 " * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.\n"
			 " * \n"
       " * \\brief  " str "\n"
       " */\n \n")))
(eval-after-load 'autoinsert
  '(define-auto-insert
     '("\\.\\([Hh]\\|h\\|hpp\\)\\'" . "C/C++ header")
     '("Short description: "
       "/** -*- mode: c++ -*- \n" 
			 " *\n" 
       " * \\file   " (file-name-nondirectory (buffer-file-name)) "\n"
       " * \\date   " (current-time-string) "\n *\n"
       " * \\copyright \n" 
			 " * Copyright (c) " (substring (current-time-string) -4) " "user-full-name " <" user-mail-address ">.\n"  
			 " * All rights reserved.\n"
			 " * \n"
			 " * Redistribution and use in source and binary forms are permitted\n"
			 " * provided that the above copyright notice and this paragraph are\n"
			 " * duplicated in all such forms and that any documentation,\n"
			 " * advertising materials, and other materials related to such\n"
			 " * distribution and use acknowledge that the software was developed\n"
			 " * by the " user-organization ". The \n"
			 " * name of the " user-organization " \n"
			 " * may not be used to endorse or promote products derived\n"
			 " * from this software without specific prior written permission.\n"
			 " * THIS SOFTWARE IS PROVIDED ``AS IS'' AND WITHOUT ANY EXPRESS OR\n"
			 " * IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED\n"
			 " * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.\n"
			 " * \n"
       " * \\brief  " str "\n"
       " */\n"
			 (let* ((nopath (file-name-nondirectory (buffer-file-name)))
							(upcase-nopath (upcase (replace-regexp-in-string "[^0-9a-zA-Z]" "_" nopath)) )
							(header-include-string (concat "__" (upcase upcase-nopath) "__")))
				 (concat "#ifndef " header-include-string "\n"
								 "#define " header-include-string  "\n\n\n"
								 "#endif // " header-include-string ""))
			 "\n")))
(global-set-key (kbd "\C-c d u") 'auto-insert)

