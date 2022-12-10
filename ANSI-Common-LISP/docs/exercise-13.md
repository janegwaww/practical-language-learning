

# exercise-13

1.  [Test whether your compiler observes inline declarations.](#orge2f24f1)
2.  [Rewrite the following function&#x2026;](#orgb842a28)
3.  [Add declarations to the following programs&#x2026;.](#org240f2ce)
4.  [Rewrite the breadth-first search&#x2026;](#org5790066)
5.  [Modify the binary search tree code in Section 4.7 to use pools.](#org90651ad)


<a id="orge2f24f1"></a>

## Test whether your compiler observes inline declarations.

    (declaim (inline single?))
    
    (defun single? (lst)
      (and (consp lst) (null (cdr lst))))
    
    (defun foo (x)
      (single? (bar x)))
    
    (macroexpand-1 'foo)


<a id="orgb842a28"></a>

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


<a id="org240f2ce"></a>

## Add declarations to the following programs&#x2026;.

3.Add declarations to the following programs. How much faster can you make them?

a)The date arithmetic code in Section 5.7.([section-5-7 Example: Date Arithmetic](section-5-7.md))

    ()

b)The ray-tracer in Section 9.8.([section-9-8 Example: Ray-Tracing](section-9-8.md))

    ()


<a id="org5790066"></a>

## Rewrite the breadth-first search&#x2026;

4.Rewrite the breadth-first search code in Section 3.15 so that it conses as little as possible.


<a id="org90651ad"></a>

## Modify the binary search tree code in Section 4.7 to use pools.

[section-4-7 Example: Binary Search Trees](section-4-7.md)

    ()

