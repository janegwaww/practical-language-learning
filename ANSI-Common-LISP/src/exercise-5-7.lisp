;; (a) recursion
(defun rec-pair-succ (lst)
  t)

;; (b) ~do~
(defun do-pair-succ (lst)
  t)

;; (c) ~mapc~ and ~return~
(defun mapc-pair-succ (lst)
  (block nil
    (mapc
     #'(lambda (x y)
         (if (/= 1 (- y x))
             (return nil)))
     lst lst)))
