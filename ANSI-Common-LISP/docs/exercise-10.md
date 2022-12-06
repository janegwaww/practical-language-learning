

# exercise-10

1.  [If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;](#orgec0d121)
2.  [Define `if` in terms of `cond`.](#org6cfb9aa)
3.  [Define a macro that takes&#x2026;](#orgba5108f)
4.  [Define `ntimes` (page 167) to&#x2026;](#orgf89b6dc)
5.  [Define a macro `n-of` that takes&#x2026;](#org6b13000)
6.  [Define a macro that takes&#x2026;](#orgfbc4305)
7.  [What's wrong with the following definition of push?](#org6212b02)
8.  [Define a macro that doubles its argument:](#org9a6f48b)


<a id="orgec0d121"></a>

## If `x` is `a`, `y` is `b`, and `z` is `(c d)`,&#x2026;

1.If `x` is `a`, `y` is `b`, and `z` is `(c d)`, write backquoted expressions containing only variables that yield each of the following:

1.  ((C D) A Z)
    
        `(,z ,x z)
2.  (X B C D)
    
        `(x ,y ,@z)
3.  ((C D A) Z)
    
        `((,@z ,x) z)


<a id="org6cfb9aa"></a>

## Define `if` in terms of `cond`.

    (defun new-if (test then else)
      (cond (test then)
            (t else)))


<a id="orgba5108f"></a>

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


<a id="orgf89b6dc"></a>

## Define `ntimes` (page 167) to&#x2026;

4.Define `ntimes` (page 167) to expand into a (local) recursive function instead of a `do`.

    (defmacro ntimes (n &rest body)
      (let ((g (gensym))
            (h (gensym)))
        `(let ((,h ,n))
           (do ((,g 0 (+ ,g 1)))
               ((>= ,g ,h))
             ,@body))))
    
    (defmacro new-ntimes (n &rest body)
      (let ((g (gensym)))
        `(let ((,g ,n))
           (labels ((nt (i)
                      (if (<= i 0)
                          nil
                          (progn
                            ,@body
                            (nt (decf i))))))
             (nt ,g)))))


<a id="org6b13000"></a>

## Define a macro `n-of` that takes&#x2026;

5.Define a macro `n-of` that takes a number `n` and an expression, and returns a list of `n` successive values returned by the expression:

    ;; > (let ((i 0) (n 4))
    ;;     (n-of n (incf i)))
    ;; ==>( 1 2 3 4)
    
    (defun fun-n-of (n expr)
      (if (<= n 0)
          nil
          (cons (+ n expr) (fun-n-of (decf n) expr))))
    
    (defmacro n-of (n expr)
      (let ((c (gensym))
            (e (gensym)))
        `(let ((,c ,n)
               (,e ,expr))
           (labels ((nof (i ex)
                      (if (<= i 0)
                          nil
                          (cons (+ i ,e)
                                (nof (decf i) ex)))))
             (nof ,c ,e)))))


<a id="orgfbc4305"></a>

## TODO Define a macro that takes&#x2026;

6.Define a macro that takes a list of variables and a body of code, and ensures that the variables revert to their original values after the body of code is evaluated.

    (defmacro rev-ori (lst body)
      ())


<a id="org6212b02"></a>

## What's wrong with the following definition of push?

    (defmacro push (obj lst)
      `(setf ,lst (cons ,obj ,lst)))

Give an example of a call where it would not do the same thing as the real push.

    (defmacro new-push (obj lst)
      (let ((o (gensym)))
        `(let ((,o ,obj))
           (setf ,lst (cons ,o ,lst)))))


<a id="org9a6f48b"></a>

## Define a macro that doubles its argument:

    > (let ((x 1)))
        (double x)
        x)
    2

    (defmacro double (x)
      (let ((n (gensym)))
        `(let ((,n ,x))
           (* ,n 2))))

