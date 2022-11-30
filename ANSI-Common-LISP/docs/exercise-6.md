

# exercise-6

1.  [Define a version of tokens&#x2026;](#orgc227a0d)
2.  [Define a version of `bin-searc`&#x2026;](#org7704f57)
3.  [Define a function that takes&#x2026;](#orgb90120f)
4.  [Modify `most` (page 105) to return,&#x2026;](#orgcec33fc)
5.  [Define `remove-if` (no keywords) in terms of `filter` (page 105).](#org1e9286c)
6.  [Define a function that takes&#x2026;](#orgd12867c)
7.  [Define a function that takes one&#x2026;](#org516fa33)
8.  [Suppose `expensive` is a function&#x2026;](#orgd4a6956)
9.  [Define a function like `apply`,&#x2026;](#org9f83bd7)


<a id="orgc227a0d"></a>

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


<a id="org7704f57"></a>

## Define a version of `bin-searc`&#x2026;

2.Define a version of `bin-search` (page 60) that takes `:key`, `:test`, `:start`, and `:end` arguments with the usual meanings and defaults.


<a id="orgb90120f"></a>

## Define a function that takes&#x2026;

3.Define a function that takes any number of arguments and returns the
number of arguments passed to it.


<a id="orgcec33fc"></a>

## Modify `most` (page 105) to return,&#x2026;

4.Modify `most` (page 105) to return, as two values, the two highest-scoring elements of a list.


<a id="org1e9286c"></a>

## Define `remove-if` (no keywords) in terms of `filter` (page 105).


<a id="orgd12867c"></a>

## Define a function that takes&#x2026;

6.Define a function that takes one argument, a number, and returns the greatest argument passed to it so far.


<a id="org516fa33"></a>

## Define a function that takes one&#x2026;

7.Define a function that takes one argument, a number, and returns true if it is greater than the argument passed to the function the last time it was called. The function should return `nil` the first time it is called.


<a id="orgd4a6956"></a>

## Suppose `expensive` is a function&#x2026;

8.uppose `expensive` is a function of one argument, an integer between 0 and 100 inclusive, that returns the result of a time-consuming com-putation. Define a function `frugal` that returns the same answer, but only calls `expensive` when given an argument it has not seen before.


<a id="org9f83bd7"></a>

## Define a function like `apply`,&#x2026;

9.Define a function like `apply`, but where any number printed out before
it returns will be printed, by default, in octal(base 8)

