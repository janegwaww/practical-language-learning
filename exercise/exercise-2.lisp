;;;; exercise 1

;;; 1

;; a
(+ (- 5 1) (+ 3 7)) ; 14

;; b
(list 1 (+ 2 3)) ; '(1 5)

;; c
(if (listp 1) (+ 1 2) (+ 3 4)) ; 7

;; d
(list (and (listp 3) t) (+ 1 2)) ; '(nil 3)

;;; 2

(cons 'a (cons 'b (cons 'c nil))) ; '(a b c)

;;; 3

(defun fourth-ele (lst)
  (if (listp lst)
      (car (cdr (cdr (cdr lst))))
      nil))

;;; 4

(defun return-greater-in-two (a b)
  (if (> a b)
      a
      b))

;;; 5

;; a) list must contain nil element
(defun enigma (x)
  (and (not (null x))
       (or (null (car x))
           (enigma (cdr x)))))

;; b) return first element equal x in list y
(defun mystery (x y)
  (if (null y)
      nil
      (if (eql (car y) x)
          0
          (let ((z (mystery x (cdr y))))
            (and z (+ z 1))))))

;;; 6

;; a)
(car (car (cdr '(a (b c) d))))

;; b)
(or 13 (/ 1 0))

;; c)
(apply #'list 1 nil)

;;; 7

;; list has a list element
(defun contain-list (lst)
  (if (listp (car lst))
      t
      (if (not (null (cdr lst)))
          (contain-list (cdr lst))
          nil)))

;;; 8

;; a)
(defun rec-dots (n)
  (if (< n 1)
      nil
      (progn
        (format t ".")
        (rec-dots (- n 1)))))
(defun ite-dots (n)
  (do ((i 0 (+ i 1)))
      ((>= i n) 'done)
    (format t ".")))

;; b)
(defun rec-count-a (lst n)
  (if (null lst)
      n
      (if (eql (car lst) 'a)
          (rec-count-a (cdr lst) (+ n 1))
          (rec-count-a (cdr lst) n))))
(defun ite-count-a (lst)
  (let ((n 0))
    (dolist (obj lst)
      (if (eql obj 'a)
          (setf n (+ n 1))))
    n))

;;; 9

;; a) remove operator not change origin list
(defun summit (lst)
  (apply #'+ (remove nil lst)))

;; b) endless loop
(defun summit (lst)
  (let ((x (car lst)))
    (if (null lst)
        0
        (if (null x)
            (summit (cdr lst))
            (+ x (summit (cdr lst)))))))
