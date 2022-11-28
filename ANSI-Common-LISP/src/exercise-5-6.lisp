;;; > (intersperse '- '(a b e d))
;;; (A - B - C - D)

;; iteration
(defun ite-intersperse (elt lst)
  (let ((ls '()))
    (do ((item lst (cdr item))
         (n 0 (+ n 1)))
        ((null item) nil)
      (progn
        (if (> n 0) (push elt ls))
        (push (car item) ls)))
    (reverse ls)))
;; (defparameter ite (ite-intersperse '- '(a b c d)))

;; recursion
(defun rec-intersperse (elt lst)
  (cond
    ((null (cdr lst)) lst)
    (t (cons (car lst)
             (cons elt
                   (rec-intersperse elt (cdr lst)))))))
