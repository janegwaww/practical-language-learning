

# exercise 5

1.  [Translate the following expressions&#x2026;](#org392664a)
2.  [Rewrite mystery (page 29) to use `cond`.](#org2c7f834)
3.  [Define a function that returns the&#x2026;](#org372b25e)
4.  [Rewrite `num-month` (Figure 5.1) to use `case` instead of `svref`.](#orgde1ac86)
5.  [Define iterative and recursive versions&#x2026;](#org13996ee)
6.  [Define iterative and recursive versions&#x2026;](#orgbeb4713)
7.  [Define a function that takes&#x2026;](#orgcf218e5)
8.  [Define a single recursive function&#x2026;](#org1c2619d)
9.  [The program in Figure 3.12 continues&#x2026;](#org004a229)


<a id="org392664a"></a>

## Translate the following expressions&#x2026;

1.Translate the following expressions into equivalent expressions that don't use let or let\*, and don't cause the same expression to be evaluated twice.

    ;; a)
    (let ((x (car y)))
      (cons x x))
    ;; equivalent with a)
    ((lambda (x)
       (cons x x))
     (car y))
    
    ;; b)
    (let* ((w (car x))
           (y (+ w z)))
      (cons w y))
    ;; equilvalent with b)
    ((lambda (w)
       ((lambda (y)
         (cons w y))
        (+ w z)))
     (car x))


<a id="org2c7f834"></a>

## Rewrite mystery (page 29) to use `cond`.

    ;; origin(page29)
    (defun mystery (x y)
      (if (null y)
          nil
          (if (eql (car y) x)
              0
              (let ((z (mystery x (cdr y))))
                (and z (+ z 1))))))

    ;; rewrite with cond
    (defun mystery-cond (x y)
      (cond
        ((null y) nil)
        ((eql (car y) x) 0)
        (t (let ((z (mystery x (cdr y))))
          (and z (+ z 1))))))


<a id="org372b25e"></a>

## Define a function that returns the&#x2026;

3.Define a function that returns the square of its argument, and which does not compute the square if the argument is a positive integer less than or equal to 5.

    (defun square-over-5 (x)
      (cond
        ((and (> x 0) (<= x 5)) nil)
        (t (* x x))))


<a id="orgde1ac86"></a>

## Rewrite `num-month` (Figure 5.1) to use `case` instead of `svref`.

    (defun new-month-num (m y)
      (+ (case m
           (1 0) (2 31) (3 59) (4 90)
           (5 120) (6 151) (7 181) (8 212)
           (9 243) (10 273) (11 304) (12 334)
           (otherwise "unknown month"))
         (cond
           ((and (> m 2) (leap? y)) 1)
           (t 0))))


<a id="org13996ee"></a>

## Define iterative and recursive versions&#x2026;

5.Define iterative and recursive versions of a function that takes an object `x` and vector `v`, and returns a list of all the objects that immediately precede `x` in `v`:

    ;;> (precedes #\a "abracadabra")
    ;;(#\c #\d # \r)

    ;; iteration
    (defun ite-precedes (x v)
        (cond
          ((vectorp v)
           (let ((vr (reverse v))
                 (ls '()))
             (do ((n 0 (+ n 1)))
                 ((> n (- (length v) 2)) nil)
               (cond
                 ((eql (svref vr n) x)
                  (push (svref vr (+ n 1)) ls))))
             ls))
          (t "unknown type")))
    (defparameter vec #(e a b r a c a d a b r a))
    (ite-precedes 'a vec)

    ;; recursion
    (defun rec-precedes (x v)
        (let ((n (- (length v) 1)))
          (rec-precedes-item x v n)))
      (defun rec-precedes-item (x v n)
        (if (= n 0)
            nil
            (if (eql (svref v n) x)
                (cons (svref v (- n 1))
                      (rec-precedes-item x v (- n 1)))
                (rec-precedes-item x v (- n 1)))))
    (rec-precedes 'a vec)


<a id="orgbeb4713"></a>

## Define iterative and recursive versions&#x2026;

6.Define iterative and recursive versions of a function that takes an object and a list, and returns a new list in which the object appears between each pair of elements in the original list:

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


<a id="orgcf218e5"></a>

## Define a function that takes&#x2026;

7.Define a function that takes a list of numbers and returns true if the
difference between each successive pair of them is 1, using

(a) recursion
(b) `do`
(c) `mapc` and `return`


<a id="org1c2619d"></a>

## Define a single recursive function&#x2026;

8.Define a single recursive function that returns, as two values, the maximum and minimum elements of a vector.


<a id="org004a229"></a>

## The program in Figure 3.12 continues&#x2026;

9.The program in Figure 3.12 continues to search as the first complete
path works its way through the queue. In broad searches this would be
a problem.

(a) Using `catch` and `throw`, modify the program to return the first complete path as soon as it is discovered.
(b) Rewrite the program to do the same thing without using `catch` and `throw`.

