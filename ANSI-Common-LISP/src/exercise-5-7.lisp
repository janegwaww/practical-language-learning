;; (a) recursion
(defun rec-pair-succ (lst)
  (let ((o (car lst)))
    (dolist (x (cdr lst) t)
      (if (= 1 (abs (- o x)))
          (setf o x)
          (return-from rec-pair-succ nil)))))

;; (b) ~do~
(defun do-pair-succ (lst)
  (do* ((elt (cdr lst) (cdr elt))
        (o (car lst) (car elt)))
       ((null lst) t)
    (if (/= (abs (- o (car elt))) 1)
        (return-from do-pair-succ nil))))

;; (c) ~mapc~ and ~return~
(defun mapc-pair-succ (lst)
  (block nil
    (mapc
     #'(lambda (x y)
         (if (/= 1 (abs (- y x)))
             (return nil)))
     lst (cdr lst))))
