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
