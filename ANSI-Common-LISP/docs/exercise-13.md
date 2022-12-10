

# exercise-13

1.  [Test whether your compiler observes inline declarations.](#org8344ef4)
2.  [Rewrite the following function&#x2026;](#orgdec1025)
3.  [Add declarations to the following programs&#x2026;.](#orgbadfa6e)
4.  [Rewrite the breadth-first search&#x2026;](#orga433a6e)
5.  [Modify the binary search tree code in Section 4.7 to use pools.](#orga31f3c0)


<a id="org8344ef4"></a>

## Test whether your compiler observes inline declarations.

    (declaim (inline single?))
    
    (defun single? (lst)
      (and (consp lst) (null (cdr lst))))
    
    (defun foo (x)
      (single? (bar x)))
    
    (macroexpand-1 'foo)


<a id="orgdec1025"></a>

## Rewrite the following function&#x2026;

2.Rewrite the following function to be tail-recursive. How much faster is it when compiled?


<a id="orgbadfa6e"></a>

## Add declarations to the following programs&#x2026;.

3.Add declarations to the following programs. How much faster can you make them?

a)The date arithmetic code in Section 5.7.
b)The ray-tracer in Section 9.8.


<a id="orga433a6e"></a>

## Rewrite the breadth-first search&#x2026;

4.Rewrite the breadth-first search code in Section 3.15 so that it conses as little as possible.


<a id="orga31f3c0"></a>

## Modify the binary search tree code in Section 4.7 to use pools.

