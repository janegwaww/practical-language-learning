

# exercise-6

1.  [Define a version of tokens&#x2026;](#orgfd33e3f)
2.  [Define a version of `bin-searc`&#x2026;](#org3ada75a)
3.  [Define a function that takes&#x2026;](#org70273b0)
4.  [Modify `most` (page 105) to return,&#x2026;](#org26cb60f)
5.  [Define `remove-if` (no keywords) in terms of `filter` (page 105).](#org25a477c)
6.  [Define a function that takes&#x2026;](#org3fa71ab)
7.  [Define a function that takes one&#x2026;](#org8218b6c)
8.  [Suppose `expensive` is a function&#x2026;](#org14cd0cb)
9.  [Define a function like `apply`,&#x2026;](#org537cdf8)


<a id="orgfd33e3f"></a>

## Define a version of tokens&#x2026;

1.Define a version of `tokens` (page 67) that takes `:test` and `:start` arguments defaulting to `#'constituent` and 0 respectively.

    (defun constituent (c)
      (and (graphic-char-p c)
           (not (char= c #\ ))))
    
    (defun tokens (str &key (test #'constituent) (start 0))
      (let ((p1 (position-if test str :start start)))
        (if p1
            (let ((p2 (position-if #'(lambda (c)
                                       (not (funcall test c)))
                                   str
                                   :start p1)))
              (cons (subseq str p1 p2)
                    (if p2
                        (tokens str test p2)
                        nil)))
            nil)))


<a id="org3ada75a"></a>

## Define a version of `bin-searc`&#x2026;

2.Define a version of `bin-search` (page 60) that takes `:key`, `:test`, `:start`, and `:end` arguments with the usual meanings and defaults.

    (defun bin-search
        (vec &key (key 0) (test #'finder) (start 0) (end (- (length vec) 1)))
      (funcall #'finder key vec start end))
    
    (defun finder (obj vec start end)
      (let ((range (- end start)))
        (if (zerop range)
            (if (eql obj (aref vec start))
                obj
                nil)
            (let ((mid (+ start (round (/ range 2)))))
              (let ((obj2 (aref vec mid)))
                (if (< obj obj2)
                    (finder obj vec start (- mid 1))
                    (if (> obj obj2)
                        (finder obj vec (+ mid 1) end)
                        obj)))))))
    
    (finder 3 #(0 1 2 3 4 5 6 7 8 9) 0 8)
    (bin-search #(0 1 2 3 4 5 6 7 8 9) :key 3)


<a id="org70273b0"></a>

## Define a function that takes&#x2026;

3.Define a function that takes any number of arguments and returns the
number of arguments passed to it.

    (defun num-of-args (&rest body)
      (length body))


<a id="org26cb60f"></a>

## Modify `most` (page 105) to return,&#x2026;

4.Modify `most` (page 105) to return, as two values, the two highest-scoring elements of a list.

    (defun new-most (fn lst)
      (if (null lst)
          (values nil nil)
          (let* ((wins (car lst))
                 (max (funcall fn wins)))
            (dolist (obj (cdr lst))
              (let ((score (funcall fn obj)))
                (when (> score max)
                  (setf wins obj max score))))
            (values wins max))))
    (new-most #'length '((a b) (a b c) (a)))


<a id="org25a477c"></a>

## Define `remove-if` (no keywords) in terms of `filter` (page 105).

    (defun new-filter (fn 1st)
      (let ((ace nil))
        (dolist (x 1st)
          (let ((val (funcall fn x)))
            (if val (push val ace))))
        (nreverse ace)))
    
      (defun new-remove-if (test lst)
          (new-filter #'(lambda (x) (not (funcall test x)))
                      lst))


<a id="org3fa71ab"></a>

## Define a function that takes&#x2026;

6.Define a function that takes one argument, a number, and returns the greatest argument passed to it so far.

    (let ((mx))
      (defun greatest-so-far (num)
        (if (and mx (> mx num))
            mx
            (setf mx num))))


<a id="org8218b6c"></a>

## Define a function that takes one&#x2026;

7.Define a function that takes one argument, a number, and returns true if it is greater than the argument passed to the function the last time it was called. The function should return `nil` the first time it is called.

    (let ((pre 0))
      (defun greater-than-last (num)
        (prog1 (and pre (> num pre))
          (setf pre num))))


<a id="org14cd0cb"></a>

## Suppose `expensive` is a function&#x2026;

8.uppose `expensive` is a function of one argument, an integer between 0 and 100 inclusive, that returns the result of a time-consuming com-putation. Define a function `frugal` that returns the same answer, but only calls `expensive` when given an argument it has not seen before.

    ;; not code
    (defun frugal (arg)
      (if (member arg store)
          (svref store arg)
          (expensive arg)))


<a id="org537cdf8"></a>

## Define a function like `apply`,&#x2026;

9.Define a function like `apply`, but where any number printed out before
it returns will be printed, by default, in octal(base 8)

    (defun print-octal (num)
      (let ((*print-base* 8))
        (princ num)))

