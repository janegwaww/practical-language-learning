

# exercise-10

1.  [If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;](#orgb13357b)
2.  [Define `if` in terms of `cond`.](#org93e83cb)
3.  [Define a macro that takes&#x2026;](#orgb09a244)
4.  [Define `ntimes` (page 167) to&#x2026;](#org6b9db38)
5.  [Define a macro `n-of` that takes&#x2026;](#org74ce634)
6.  [Define a macro that takes&#x2026;](#org0de3aca)
7.  [What's wrong with the following definition of push?](#org5f697a1)
8.  [Define a macro that doubles its argument:](#orgc63d658)


<a id="orgb13357b"></a>

## If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;

1.If `x` is `a`, `y` is `b`, and `z` is `(c d)`, write backquoted expressions containing only variables that yield each of the following:


<a id="org93e83cb"></a>

## Define `if` in terms of `cond`.


<a id="orgb09a244"></a>

## Define a macro that takes&#x2026;

3.Define a macro that takes a number n followed by one or more expressions, and returns the value of the nth expression:


<a id="org6b9db38"></a>

## Define `ntimes` (page 167) to&#x2026;

4.Define `ntimes` (page 167) to expand into a (local) recursive function instead of a `do`.


<a id="org74ce634"></a>

## Define a macro `n-of` that takes&#x2026;

5.Define a macro `n-of` that takes a number `n` and an expression, and returns a list of `n` successive values returned by the expression:


<a id="org0de3aca"></a>

## Define a macro that takes&#x2026;

6.Define a macro that takes a list of variables and a body of code, and ensures that the variables revert to their original values after the body of code is evaluated.


<a id="org5f697a1"></a>

## What's wrong with the following definition of push?

    (defmacro push (obj lst)
      `(setf ,lst (cons ,obj ,lst)))

Give an example of a call where it would not do the same thing as the real push.


<a id="orgc63d658"></a>

## Define a macro that doubles its argument:

