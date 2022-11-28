

# exercise 5

1.  [Translate the following expressions&#x2026;](#org63b4db4)
2.  [Rewrite mystery (page 29) to use `cond`.](#org42bbaeb)
3.  [Define a function that returns the&#x2026;](#orgb986b21)
4.  [Rewrite `num-month` (Figure 5.1) to use `case` instead of `svref`.](#org442a50c)
5.  [Define iterative and recursive versions&#x2026;](#org4ada175)
6.  [Define iterative and recursive versions&#x2026;](#org5d888a9)
7.  [Define a function that takes&#x2026;](#org093f821)
8.  [Define a single recursive function&#x2026;](#orga9e4ca6)
9.  [The program in Figure 3.12 continues&#x2026;](#org4fc5744)


<a id="org63b4db4"></a>

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


<a id="org42bbaeb"></a>

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


<a id="orgb986b21"></a>

## Define a function that returns the&#x2026;

3.Define a function that returns the square of its argument, and which does not compute the square if the argument is a positive integer less than or equal to 5.


<a id="org442a50c"></a>

## Rewrite `num-month` (Figure 5.1) to use `case` instead of `svref`.


<a id="org4ada175"></a>

## Define iterative and recursive versions&#x2026;

5.Define iterative and recursive versions of a function that takes an object `x` and vector `v`, and returns a list of all the objects that immediately precede `x` in `v`:

    ;;> (precedes #\a "abracadabra")
    ;;(#\c #\d # \ r)


<a id="org5d888a9"></a>

## Define iterative and recursive versions&#x2026;

6.Define iterative and recursive versions of a function that takes an object and a list, and returns a new list in which the object appears between each pair of elements in the original list:

    ;; > (intersperse '- '(a b e d))
    ;; (A - B - C - D)


<a id="org093f821"></a>

## Define a function that takes&#x2026;

7.Define a function that takes a list of numbers and returns true if the
difference between each successive pair of them is 1, using

(a) recursion
(b) `do`
(c) `mapc` and `return`


<a id="orga9e4ca6"></a>

## Define a single recursive function&#x2026;

8.Define a single recursive function that returns, as two values, the maximum and minimum elements of a vector.


<a id="org4fc5744"></a>

## The program in Figure 3.12 continues&#x2026;

9.The program in Figure 3.12 continues to search as the first complete
path works its way through the queue. In broad searches this would be
a problem.

(a) Using `catch` and `throw`, modify the program to return the first complete path as soon as it is discovered.
(b) Rewrite the program to do the same thing without using `catch` and `throw`.

