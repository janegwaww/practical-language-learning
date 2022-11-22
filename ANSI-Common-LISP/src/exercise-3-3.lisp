;;; compre

(defun compre (lst)
  (if (consp lst)
      (compr (car lst) 1 (cdr lst))
      lst))

;; return compressed list
(defun compr (elt n lst)
  (if (null lst)
      (list (cons elt n))
      (let ((next (car lst)))
        (if (eql next elt)
            (compr elt (+ n 1) (cdr lst))
            (if (member elt (cdr lst))
                (compr elt n (append (cdr lst) (list next)))
                (cons (cons elt n)
                      (compr next 1 (cdr lst))))))))

;;; sort

;; item largest in list
(defun new-compare (item lst)
  (if (null lst)
      t
      (if (>= (cdr item) (cdar lst))
          (new-compare item (cdr lst)))))

;; return largest item
(defun biggest (lst)
  (if (null (cdr lst))
      (car lst)
      (if (new-compare (car lst) (cdr lst))
          (car lst)
          (biggest (cdr lst)))))

;; return list except largest item
(defun rest-big (lst)
  (if (= (cdr (car lst)) (cdr (biggest lst)))
      (cdr lst)
      (rest-big (append (cdr lst) (list (car lst))))))

;; sorting
(defun new-sort (lst)
  (if (null (cdr lst))
      lst
      (let ((item (car lst))
            (big (biggest lst)))
        (if (= (cdr item) (cdr big))
            (cons item (new-sort (cdr lst)))
            (new-sort (cons big (rest-big lst)))))))

;;; main

;; > (occurrences ' ( a b a d a c d e a )
;; ((A . 4) (C . 2) (D . 2) (B . 1))
(defun occurrences (lst)
  (new-sort (compre lst)))
