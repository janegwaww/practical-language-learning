

# exercise-10

1.  [If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;](#org994e7f0)
2.  [Define `if` in terms of `cond`.](#orgb71e238)
3.  [Define a macro that takes&#x2026;](#orgb6002b4)
4.  [Define `ntimes` (page 167) to&#x2026;](#org8976d80)
5.  [Define a macro `n-of` that takes&#x2026;](#org55eb952)
6.  [Define a macro that takes&#x2026;](#org581464e)
7.  [What's wrong with the following definition of push?](#orgd1214ee)
8.  [Define a macro that doubles its argument:](#org42d856a)


<a id="org994e7f0"></a>

## If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;

1.If `x` is `a`, `y` is `b`, and `z` is `(c d)`, write backquoted expressions containing only variables that yield each of the following:

1.  ((C D) A Z)
    
        `(,z ,x z)
2.  (X B C D)
    
        `(x ,y ,@z)
3.  ((C D A) Z)
    
        `((,@z ,x) z)


<a id="orgb71e238"></a>

## Define `if` in terms of `cond`.

    (defun new-if (test then else)
      (cond (test then)
            (t else)))


<a id="orgb6002b4"></a>

## Define a macro that takes&#x2026;

3.Define a macro that takes a number n followed by one or more expressions, and returns the value of the nth expression:


<a id="org8976d80"></a>

## Define `ntimes` (page 167) to&#x2026;

4.Define `ntimes` (page 167) to expand into a (local) recursive function instead of a `do`.


<a id="org55eb952"></a>

## Define a macro `n-of` that takes&#x2026;

5.Define a macro `n-of` that takes a number `n` and an expression, and returns a list of `n` successive values returned by the expression:


<a id="org581464e"></a>

## Define a macro that takes&#x2026;

6.Define a macro that takes a list of variables and a body of code, and ensures that the variables revert to their original values after the body of code is evaluated.


<a id="orgd1214ee"></a>

## What's wrong with the following definition of push?

    (defmacro push (obj lst)
      `(setf ,lst (cons ,obj ,lst)))

Give an example of a call where it would not do the same thing as the real push.


<a id="org42d856a"></a>

## Define a macro that doubles its argument:

