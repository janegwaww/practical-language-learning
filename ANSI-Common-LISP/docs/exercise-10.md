

# exercise-10

1.  [If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;](#orgf09ab5e)
2.  [Define `if` in terms of `cond`.](#orgba8b08e)
3.  [Define a macro that takes&#x2026;](#org37b23fb)
4.  [Define `ntimes` (page 167) to&#x2026;](#orgc5e3bcf)
5.  [Define a macro `n-of` that takes&#x2026;](#org87e96c4)
6.  [Define a macro that takes&#x2026;](#org840a308)
7.  [What's wrong with the following definition of push?](#org1275fb0)
8.  [Define a macro that doubles its argument:](#org977561b)


<a id="orgf09ab5e"></a>

## If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;

1.If `x` is `a`, `y` is `b`, and `z` is `(c d)`, write backquoted expressions containing only variables that yield each of the following:

1.  ((C D) A Z)
    
        `(,z ,x z)
2.  (X B C D)
    
        `(x ,y ,@z)
3.  ((C D A) Z)
    
        `((,@z ,x) z)


<a id="orgba8b08e"></a>

## Define `if` in terms of `cond`.


<a id="org37b23fb"></a>

## Define a macro that takes&#x2026;

3.Define a macro that takes a number n followed by one or more expressions, and returns the value of the nth expression:


<a id="orgc5e3bcf"></a>

## Define `ntimes` (page 167) to&#x2026;

4.Define `ntimes` (page 167) to expand into a (local) recursive function instead of a `do`.


<a id="org87e96c4"></a>

## Define a macro `n-of` that takes&#x2026;

5.Define a macro `n-of` that takes a number `n` and an expression, and returns a list of `n` successive values returned by the expression:


<a id="org840a308"></a>

## Define a macro that takes&#x2026;

6.Define a macro that takes a list of variables and a body of code, and ensures that the variables revert to their original values after the body of code is evaluated.


<a id="org1275fb0"></a>

## What's wrong with the following definition of push?

    (defmacro push (obj lst)
      `(setf ,lst (cons ,obj ,lst)))

Give an example of a call where it would not do the same thing as the real push.


<a id="org977561b"></a>

## Define a macro that doubles its argument:

