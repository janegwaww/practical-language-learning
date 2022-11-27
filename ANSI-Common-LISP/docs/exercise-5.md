

# exercise 5

1.  [Translate the following expressions&#x2026;](#org5f7b1a1)
2.  [Rewrite mystery (page 29) to use `cond`.](#org3321f4f)
3.  [Define a function that returns the&#x2026;](#orge886987)
4.  [Rewrite `num-month` (Figure 5.1) to use `case` instead of `svref`.](#org77c764a)
5.  [Define iterative and recursive versions&#x2026;](#org4830d0d)
6.  [Define iterative and recursive versions&#x2026;](#org22267cf)
7.  [Define a function that takes&#x2026;](#org77975aa)
8.  [Define a single recursive function&#x2026;](#org514971c)
9.  [The program in Figure 3.12 continues&#x2026;](#org7f97677)


<a id="org5f7b1a1"></a>

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


<a id="org3321f4f"></a>

## Rewrite mystery (page 29) to use `cond`.


<a id="orge886987"></a>

## Define a function that returns the&#x2026;

3.Define a function that returns the square of its argument, and which does not compute the square if the argument is a positive integer less than or equal to 5.


<a id="org77c764a"></a>

## Rewrite `num-month` (Figure 5.1) to use `case` instead of `svref`.


<a id="org4830d0d"></a>

## Define iterative and recursive versions&#x2026;

5.Define iterative and recursive versions of a function that takes an object `x` and vector `v`, and returns a list of all the objects that immediately precede `x` in `v`:

    ;;> (precedes #\a "abracadabra")
    ;;(#\c #\d # \ r)


<a id="org22267cf"></a>

## Define iterative and recursive versions&#x2026;

6.Define iterative and recursive versions of a function that takes an object and a list, and returns a new list in which the object appears between each pair of elements in the original list:

    ;; > (intersperse '- '(a b e d))
    ;; (A - B - C - D)


<a id="org77975aa"></a>

## Define a function that takes&#x2026;

7.Define a function that takes a list of numbers and returns true if the
difference between each successive pair of them is 1, using

(a) recursion
(b) `do`
(c) `mapc` and `return`


<a id="org514971c"></a>

## Define a single recursive function&#x2026;

8.Define a single recursive function that returns, as two values, the maximum and minimum elements of a vector.


<a id="org7f97677"></a>

## The program in Figure 3.12 continues&#x2026;

9.The program in Figure 3.12 continues to search as the first complete
path works its way through the queue. In broad searches this would be
a problem.

(a) Using `catch` and `throw`, modify the program to return the first complete path as soon as it is discovered.
(b) Rewrite the program to do the same thing without using `catch` and `throw`.

