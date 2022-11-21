

# ANSI Common LISP exercise 2

1.  [1](#org512810c)
2.  [2](#orgdc3d38c)
3.  [3](#org398318a)
4.  [4](#orgdab3271)
5.  [5](#org0ef5ef6)
6.  [6](#org4ee5aac)
7.  [7](#orgba2cc21)
8.  [8](#orga214ba1)
9.  [9](#org890e51b)


<a id="org512810c"></a>

## 1

Describe what happens when the following expressions are evaluated:

    ;; a
    (+ (- 5 1) (+ 3 7)) ; 14

    ;; b
    (list 1 (+ 2 3)) ; '(1 5)

    ;; c
    (if (listp 1) (+ 1 2) (+ 3 4)) ; 7

    ;; d
    (list (and (listp 3) t) (+ 1 2)) ; '(nil 3)


<a id="orgdc3d38c"></a>

## 2

Give three distinct cons expressions that return (a b c).

    (cons 'a (cons 'b (cons 'c nil))) ; '(a b c)


<a id="org398318a"></a>

## 3

Using car and cdr, define a function to return the fourth element of a
list.

    (defun fourth-ele (lst)
      (if (listp lst)
          (car (cdr (cdr (cdr lst))))
          nil))


<a id="orgdab3271"></a>

## 4

Define a function that takes two arguments and returns the greater of
the two.

    (defun return-greater-in-two (a b)
      (if (> a b)
          a
          b))


<a id="org0ef5ef6"></a>

## 5

What do these functions do?

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


<a id="org4ee5aac"></a>

## 6

What could occur in place of the x in each of the following exchanges?

    ;; a)
    (car (car (cdr '(a (b c) d))))

    ;; b)
    (or 13 (/ 1 0))

    ;; c)
    (apply #'list 1 nil)


<a id="orgba2cc21"></a>

## 7

Using only operators introduced in this chapter, define a function that
takes a list as an argument and returns true if one of its elements is a
list.

    ;; list has a list element
    (defun contain-list (lst)
      (if (listp (car lst))
          t
          (if (not (null (cdr lst)))
              (contain-list (cdr lst))
              nil)))


<a id="orga214ba1"></a>

## 8

Give iterative and recursive definitions of a function that

    ;; a) takes a positive integer and prints that many dots.
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

    ;; b) takes a list and returns the number of times the symbol a occurs in it.
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


<a id="org890e51b"></a>

## 9

A friend is trying to write a function that returns the sum of all the
non-nil elements in a list. He has written two versions of this function,
and neither of them work. Explain what's wrong with each, and give a
correct version:

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

