;;; a) recursion

(defun rec-pos+ (lst)
  (rec-pos-mid 0 lst))

(defun rec-pos-mid (n lst)
  (if (null lst)
      nil
      (cons (+ (car lst) n) (rec-pos-mid (+ n 1) (cdr lst)))))

;;; b) iteration

(defun ite-pos+ (lst)
  (let ((r '()))
    (do ((elt lst (cdr elt))
         (n 0 (+ n 1)))
        ((null elt) nil)
      (push (+ (car elt) n) r))
    (reverse r)))

;;; c) mapcar

(defun map-pos+ (lst)
  (let ((n 0))
    (mapcar #'(lambda (x) (and
                           (setf n (+ n 1))
                           (+ x (- n 1))
                           ))
            lst)))
