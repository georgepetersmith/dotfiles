;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(safe-local-variable-values
   '((eval unless (bound-and-true-p my/czarnikow-prodigy-loaded)
      (when (require 'prodigy nil t)
       (load
        (expand-file-name "prodigy-services.el"
                          (locate-dominating-file default-directory
                                                  ".dir-locals.el")))
       (setq-default my/czarnikow-prodigy-loaded t))))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
