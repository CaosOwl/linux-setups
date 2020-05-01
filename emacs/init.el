(require 'package)
(setq package-enable-at-startup nil)
(add-to-list 'package-archives          
             '("melpa" . "https://melpa.org/packages/"))
(add-to-list 'package-archives          
             '("melpa stable" . "https://stable.melpa.org/packages/"))


(package-initialize)


;; Bootstrap 'use-package'
(unless (package-installed-p 'use-package)
        (package-refresh-contents)
        (package-install 'use-package))

;;load org setup
(require 'org)
(org-babel-load-file (expand-file-name "~/.emacs.d/myinit.org"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (company-reftex atom-dark-theme atom-one-dark-theme company-auctex yasnippet-snippets which-key wgrep-ag vlf use-package try sr-speedbar solarized-theme pyenv-mode py-autopep8 org-ref org-pdfview org-bullets org-ac multiple-cursors modus-vivendi-theme modus-operandi-theme material-theme magit jedi ivy-rich gnuplot git-timemachine git-gutter flylisp flycheck ess-smart-underscore elpy ein doom-themes diredfl dired-subtree dired-narrow dired-git-info counsel company-jedi company-irony company-anaconda color-theme-modern blackboard-theme better-defaults auctex))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
