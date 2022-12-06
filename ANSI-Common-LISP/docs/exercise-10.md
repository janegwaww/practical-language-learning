

# exercise-10

1.  [If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;](#orgd74f6d2)
2.  [Define `if` in terms of `cond`.](#org8d38686)
3.  [Define a macro that takes&#x2026;](#org0386112)
4.  [Define `ntimes` (page 167) to&#x2026;](#orgdd49b5f)
5.  [Define a macro `n-of` that takes&#x2026;](#org79e8462)
6.  [Define a macro that takes&#x2026;](#orgf7dabb8)
7.  [What's wrong with the following definition of push?](#org84c9b60)
8.  [Define a macro that doubles its argument:](#org938beee)


<a id="orgd74f6d2"></a>

## If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;

1.If `x` is `a`, `y` is `b`, and `z` is `(c d)`, write backquoted expressions containing only variables that yield each of the following:

1.  ((C D) A Z)
    
        `(,z ,x z)
2.  (X B C D)
    
        `(x ,y ,@z)
3.  ((C D A) Z)
    
        `((,@z ,x) z)


<a id="org8d38686"></a>

## Define `if` in terms of `cond`.

    (defun new-if (test then else)
      (cond (test then)
            (t else)))


<a id="org0386112"></a>

## Define a macro that takes&#x2026;

3.Define a macro that takes a number n followed by one or more expressions, and returns the value of the nth expression:

    ;;> (let ((n 2))
    ;;     (nth-expr n (/ 1 0) (+ 1 2) (/ 1 0)))
    ;;===> 3

    (defmacro nth-expr (n &rest body)
      `(case ,n
         ,@(let ((key -1))
             (mapcar #'(lambda (obj)
                         `(,(incf key) ,obj))
                     body))))


<a id="orgdd49b5f"></a>

## Define `ntimes` (page 167) to&#x2026;

4.Define `ntimes` (page 167) to expand into a (local) recursive function instead of a `do`.

    (defmacro ntimes (n &rest body)
      (let ((g (gensym))
            (h (gensym)))
        `(let ((,h ,n))
           (do ((,g 0 (+ ,g 1)))
               ((>= ,g ,h))
             ,@body))))


<a id="org79e8462"></a>

## Define a macro `n-of` that takes&#x2026;

5.Define a macro `n-of` that takes a number `n` and an expression, and returns a list of `n` successive values returned by the expression:


<a id="orgf7dabb8"></a>

## Define a macro that takes&#x2026;

6.Define a macro that takes a list of variables and a body of code, and ensures that the variables revert to their original values after the body of code is evaluated.


<a id="org84c9b60"></a>

## What's wrong with the following definition of push?

    (defmacro push (obj lst)
      `(setf ,lst (cons ,obj ,lst)))

Give an example of a call where it would not do the same thing as the real push.


<a id="org938beee"></a>

## Define a macro that doubles its argument:

