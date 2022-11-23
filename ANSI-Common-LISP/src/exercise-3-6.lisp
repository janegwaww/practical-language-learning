;;; a) cons

(defun new-cons (l r)
  (lambda (x)
    (if (= x 1)
        r
        l)))

;; car
(defun new-car (fn)
  (funcall fn 1))

;; cdr
(defun new-cdr (fn)
  (funcall fn 2))

;;; b) list

(defun new-list (&rest params)
  (if (consp params)
      (get-list params)
      params))

(defun get-list (lst)
  (if (null lst)
      nil
      (new-cons (car lst)
                (get-list (cdr lst)))))

;;; c) length

(defun new-length (lst)
  (if (null lst)
      0
      (+ 1 (new-length (new-car lst)))))

;;; d) member

(defun new-member (elt lst)
  (if (null lst)
      nil
      (if (eql elt (new-cdr lst))
          t
          (new-member elt (new-car lst )))))
