

# exercise-10

1.  [If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;](#org8b80ab6)
2.  [Define `if` in terms of `cond`.](#orgb9c71b7)
3.  [Define a macro that takes&#x2026;](#org3502ef1)
4.  [Define `ntimes` (page 167) to&#x2026;](#org8df6fe6)
5.  [Define a macro `n-of` that takes&#x2026;](#orga1809f4)
6.  [Define a macro that takes&#x2026;](#orgf9eda17)
7.  [What's wrong with the following definition of push?](#org25b48ef)
8.  [Define a macro that doubles its argument:](#org1d3c9d7)


<a id="org8b80ab6"></a>

## If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;

1.If `x` is `a`, `y` is `b`, and `z` is `(c d)`, write backquoted expressions containing only variables that yield each of the following:

1.  ((C D) A Z)
    
        `(,z ,x z)
2.  (X B C D)
    
        `(x ,y ,@z)
3.  ((C D A) Z)
    
        `((,@z ,x) z)


<a id="orgb9c71b7"></a>

## Define `if` in terms of `cond`.

    (defun new-if (test then else)
      (cond (test then)
            (t else)))


<a id="org3502ef1"></a>

## Define a macro that takes&#x2026;

3.Define a macro that takes a number n followed by one or more expressions, and returns the value of the nth expression:

    ;;> (let ((n 2))
    ;;     (nth-expr n (/ 1 0) (+ 1 2) (/ 1 0)))
    ;;===> 3

    (defmacro nth-expr (n &rest body)
      (let ((nt (gensym)))
        `(let ((,nt ,(1- n)))
           (nth ,nt ,body))))


<a id="org8df6fe6"></a>

## Define `ntimes` (page 167) to&#x2026;

4.Define `ntimes` (page 167) to expand into a (local) recursive function instead of a `do`.


<a id="orga1809f4"></a>

## Define a macro `n-of` that takes&#x2026;

5.Define a macro `n-of` that takes a number `n` and an expression, and returns a list of `n` successive values returned by the expression:


<a id="orgf9eda17"></a>

## Define a macro that takes&#x2026;

6.Define a macro that takes a list of variables and a body of code, and ensures that the variables revert to their original values after the body of code is evaluated.


<a id="org25b48ef"></a>

## What's wrong with the following definition of push?

    (defmacro push (obj lst)
      `(setf ,lst (cons ,obj ,lst)))

Give an example of a call where it would not do the same thing as the real push.


<a id="org1d3c9d7"></a>

## Define a macro that doubles its argument:

