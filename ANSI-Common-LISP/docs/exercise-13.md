

# exercise-13

1.  [Test whether your compiler observes inline declarations.](#orgfecc125)
2.  [Rewrite the following function&#x2026;](#org59f09a6)
3.  [Add declarations to the following programs&#x2026;.](#org124cc66)
4.  [Rewrite the breadth-first search&#x2026;](#org033a067)
5.  [Modify the binary search tree code in Section 4.7 to use pools.](#org7156f25)


<a id="orgfecc125"></a>

## Test whether your compiler observes inline declarations.

    (declaim (inline single?))
    
    (defun single? (lst)
      (and (consp lst) (null (cdr lst))))
    
    (defun foo (x)
      (single? (bar x)))
    
    (macroexpand-1 'foo)


<a id="org59f09a6"></a>

## Rewrite the following function&#x2026;

2.Rewrite the following function to be tail-recursive. How much faster is it when compiled?

    (defun foo (x)
      (if (zerop x)
          0
          (+ 1 (foo (1- x)))))

    (defun new-foo (x)
      (labels ((tail (l a)
                 (if (zerop l)
                     a
                     (tail (1- l) (1+ a)))))
        (tail x 0)))
    (time (new-foo 10000))
    (time (foo 10000))


<a id="org124cc66"></a>

## Add declarations to the following programs&#x2026;.

3.Add declarations to the following programs. How much faster can you make them?

a)The date arithmetic code in Section 5.7.
b)The ray-tracer in Section 9.8.


<a id="org033a067"></a>

## Rewrite the breadth-first search&#x2026;

4.Rewrite the breadth-first search code in Section 3.15 so that it conses as little as possible.


<a id="org7156f25"></a>

## Modify the binary search tree code in Section 4.7 to use pools.

