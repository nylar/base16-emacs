(package-initialize)

(require 's)

(defun take-screenshot (base-name)
  (shell-command (concat "scrot -u " base-name ".png")))

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(let* ((base-dir    (expand-file-name (concat default-directory "..")))
       (build-dir   (concat (file-name-as-directory base-dir) "build"))
       (samples-dir (concat (file-name-as-directory base-dir) "samples"))
       (source-file (concat (file-name-as-directory base-dir) "base16-theme.el"))
       (theme-files (directory-files build-dir)))

  (find-file source-file)

  (add-to-list 'load-path              base-dir)
  (add-to-list 'custom-theme-load-path build-dir)

  (dolist (item theme-files)
    (message "%s" item)
    (when (s-ends-with? "-theme.el" item)
      (let ((theme-name (s-chop-suffix "-theme.el" item)))
        (load-theme (intern theme-name) t)
        (redisplay)
        (sleep-for 0.1)
        (take-screenshot (concat (file-name-as-directory samples-dir) theme-name))
        (disable-theme (intern theme-name))))))

(kill-emacs)
