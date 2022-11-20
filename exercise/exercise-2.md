

# ANSI Common LISP exercise 2

1.  [1](#org291446a)
2.  [2](#org2701fdd)
3.  [3](#orgc1656cb)
4.  [4](#orgfafad11)
5.  [5](#orgea0fb5b)
6.  [6](#orgde76a79)
7.  [7](#org365340d)
8.  [8](#orgc223956)
9.  [9](#org8304c03)


<a id="org291446a"></a>

## 1

    ;; a
    (+ (- 5 1) (+ 3 7)) ; 14

    ;; b
    (list 1 (+ 2 3)) ; '(1 5)

    ;; c
    (if (listp 1) (+ 1 2) (+ 3 4)) ; 7

    ;; d
    (list (and (listp 3) t) (+ 1 2)) ; '(nil 3)


<a id="org2701fdd"></a>

## 2

    (cons 'a (cons 'b (cons 'c nil))) ; '(a b c)


<a id="orgc1656cb"></a>

## 3

    (defun fourth-ele (lst)
      (if (listp lst)
          (car (cdr (cdr (cdr lst))))
          nil))


<a id="orgfafad11"></a>

## 4

    (defun return-greater-in-two (a b)
      (if (> a b)
          a
          b))


<a id="orgea0fb5b"></a>

## 5

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


<a id="orgde76a79"></a>

## 6

    ;; a)
    (car (car (cdr '(a (b c) d))))

    ;; b)
    (or 13 (/ 1 0))

    ;; c)
    (apply #'list 1 nil)


<a id="org365340d"></a>

## 7

    ;; list has a list element
    (defun contain-list (lst)
      (if (listp (car lst))
          t
          (if (not (null (cdr lst)))
              (contain-list (cdr lst))
              nil)))


<a id="orgc223956"></a>

## 8

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


<a id="org8304c03"></a>

## 9

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

