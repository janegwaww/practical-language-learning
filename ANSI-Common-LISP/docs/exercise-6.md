

# exercise-6

1.  [Define a version of tokens&#x2026;](#org227079d)
2.  [Define a version of `bin-searc`&#x2026;](#org266ce59)
3.  [Define a function that takes&#x2026;](#orga6c0b74)
4.  [Modify `most` (page 105) to return,&#x2026;](#org4f3813b)
5.  [Define `remove-if` (no keywords) in terms of `filter` (page 105).](#org2e27eec)
6.  [Define a function that takes&#x2026;](#orge8519f3)
7.  [Define a function that takes one&#x2026;](#org1eaca37)
8.  [Suppose `expensive` is a function&#x2026;](#org3f1fe19)
9.  [Define a function like `apply`,&#x2026;](#orga3bf266)


<a id="org227079d"></a>

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


<a id="org266ce59"></a>

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
                    (finder (obj vec start (- mid 1))
                            (if (> obj obj2)
                                (finder obj vec (+ mid 1) end)
                                obj))))))))


<a id="orga6c0b74"></a>

## Define a function that takes&#x2026;

3.Define a function that takes any number of arguments and returns the
number of arguments passed to it.

    (defun num-of-args (&rest body)
      (length body))


<a id="org4f3813b"></a>

## Modify `most` (page 105) to return,&#x2026;

4.Modify `most` (page 105) to return, as two values, the two highest-scoring elements of a list.


<a id="org2e27eec"></a>

## Define `remove-if` (no keywords) in terms of `filter` (page 105).


<a id="orge8519f3"></a>

## Define a function that takes&#x2026;

6.Define a function that takes one argument, a number, and returns the greatest argument passed to it so far.


<a id="org1eaca37"></a>

## Define a function that takes one&#x2026;

7.Define a function that takes one argument, a number, and returns true if it is greater than the argument passed to the function the last time it was called. The function should return `nil` the first time it is called.


<a id="org3f1fe19"></a>

## Suppose `expensive` is a function&#x2026;

8.uppose `expensive` is a function of one argument, an integer between 0 and 100 inclusive, that returns the result of a time-consuming com-putation. Define a function `frugal` that returns the same answer, but only calls `expensive` when given an argument it has not seen before.


<a id="orga3bf266"></a>

## Define a function like `apply`,&#x2026;

9.Define a function like `apply`, but where any number printed out before
it returns will be printed, by default, in octal(base 8)

