

# exercise-9

1.  [Define a function that takes&#x2026;](#org6b700d4)
2.  [Define a function that takes&#x2026;](#orgfce2278)
3.  [A faraway planet is inhabited&#x2026;](#org0d6b3bb)
4.  [Define a function that takes 8&#x2026;](#orgd3c5e45)
5.  [Suppose `f` is a function of one&#x2026;](#org61c427f)
6.  [*Horner's method* is a trick for&#x2026;](#org6873bda)
7.  [How many bits would you estimate&#x2026;](#org75cde1d)
8.  [How many distinct types of float does your implementation provide?](#org679ad7f)


<a id="org6b700d4"></a>

## Define a function that takes&#x2026;

1.Define a function that takes a list of reals and returns true iff they are in nondecreasing order.

    (defun non-decrease (lst)
      (if (null (cdr lst))
          t
          (and (<= (car lst) (cadr lst)) (non-decrease (cdr lst)))))


<a id="orgfce2278"></a>

## Define a function that takes&#x2026;

2.Define a function that takes an integer number of cents and returns four values showing how to make that number out of 25-, 10-, 5- and 1-cent pieces, using the smallest total number of coins.

    (defun total-cents (cents)
      (total-centss cents '(25 10 5 1)))
    (defun total-centss (cents lst)
      (if (null lst)
          nil
          (multiple-value-bind (x y) (floor cents (car lst))
            (cons x (total-centss y (cdr lst))))))


<a id="org0d6b3bb"></a>

## TODO A faraway planet is inhabited&#x2026;

3.A faraway planet is inhabited by two kinds of beings, wigglies and wobblies. Wigglies and wobblies are equally good at singing. Every year there is a great competition to chooses the ten best singers. Here are the results for the past ten years:

<table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">


<colgroup>
<col  class="org-left" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />

<col  class="org-right" />
</colgroup>
<tbody>
<tr>
<td class="org-left">YEAR</td>
<td class="org-right">1</td>
<td class="org-right">2</td>
<td class="org-right">3</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
<td class="org-right">6</td>
<td class="org-right">7</td>
<td class="org-right">8</td>
<td class="org-right">9</td>
<td class="org-right">10</td>
</tr>


<tr>
<td class="org-left">WIGGLIES</td>
<td class="org-right">6</td>
<td class="org-right">5</td>
<td class="org-right">6</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
<td class="org-right">5</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
<td class="org-right">6</td>
<td class="org-right">5</td>
</tr>


<tr>
<td class="org-left">WOBBLIES</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
<td class="org-right">4</td>
<td class="org-right">6</td>
<td class="org-right">5</td>
<td class="org-right">5</td>
<td class="org-right">6</td>
<td class="org-right">5</td>
<td class="org-right">4</td>
<td class="org-right">5</td>
</tr>
</tbody>
</table>

Write a program to simulate such a contest. Do your results suggest that the committee is, in fact, choosing the ten best singers each year?


<a id="orgd3c5e45"></a>

## Define a function that takes 8&#x2026;

4.Define a function that takes 8 reals representing the endpoints of two segments in 2-space, and returns either `nil` if the segments do not intersect, or two values representing the x- and y-coordinates of the intersection if they do.

    ;;; solution origin: https://stackoverflow.com/questions/9043805/test-if-two-lines-intersect-javascript-function
    
    (defun intersect-line (l1 l2 r1 r2)
      (intersects
       (car l1) (cdr l1) (car l2) (cdr l2)
       (car r1) (cdr r1) (car r2) (cdr r2)))
    
    (defun intersects (a b c d p q r s)
      (let* ((det (- (* (- c a) (- s q))
                     (* (- r p) (- d b))))
             (gamma (/ (+ (* (- s q) (- r a))
                          (* (- p r) (- s b)))
                       det))
             (lambdap (/ (+ (* (- b d) (- r a))
                            (* (- c a) (- s b)))
                         det)))
        (cond ((= det 0) nil)
              ((and (and (> lambdap 0) (< lambdap 1))
                    (and (> gamma 0) (< gamma 1)))
               (cons (+ a (* lambdap (- c a)))
                     (+ b (* lambdap (- d  b)))))
              (t nil))))
    
    ;; (intersect-line '(1 . 4) '(3 . 2) '(2 . 2) '(4 . 4))


<a id="org61c427f"></a>

## TODO Suppose `f` is a function of one&#x2026;

5.Suppose `f` is a function of one (real) argument, and that `min` and `max` are nonzero reals with different signs such that `f` has a root (returns zero) for one argument i such that `min` < i < `max`. Define a function that takes four arguments, `f`, `min`, `max`, and `epsilon`, and returns an approximation of i accurate to within plus or minus `epsilon`.

    (defun approximat-root (fn min max eps)
      ())
    
    ;; (approximat-root #'+ -2 2 .5)


<a id="org6873bda"></a>

## TODO *Horner's method* is a trick for&#x2026;

6 *Horner's method* is a trick for evaluating polynomials efficiently. To find `ax^3+bx^2+cx+d` you evaluate `x(x(ax+b)+c)+d`. Define a function that takes one or more arguments—the value of x followed by `n` reals representing the coefficients of an (n - l)th-degree polynomial—and calculates the value of the polynomial by *Horner's method*.


<a id="org75cde1d"></a>

## How many bits would you estimate&#x2026;

7.How many bits would you estimate your implementation uses to represent fixnums?

    (values most-positive-fixnum most-negative-fixnum)


<a id="org679ad7f"></a>

## How many distinct types of float does your implementation provide?

Four types: short-float, single-float, double-float, long-float

