

# exercise-7

1.  [Define a function that takes&#x2026;](#org468b676)
2.  [Define a function that takes&#x2026;](#org422f930)
3.  [Suppose that in some format&#x2026;](#org1b23979)
4.  [Define a function that takes&#x2026;](#org5cbdbf6)
5.  [Modify `stream-subst` to allow&#x2026;](#org698f44a)
6.  [Modify `stream-subst` so that&#x2026;](#org132e2ea)


<a id="org468b676"></a>

## Define a function that takes&#x2026;

1.Define a function that takes a filename and returns a list of strings representing each line in the file.

    (defun print-list-string (filename)
      (with-open-file (stream filename :direction :input)
        (loop for line = (read-line stream nil)
              while line do (format t "~a~%" line))))
    
    ;; (print-list-string "./myfile")


<a id="org422f930"></a>

## Define a function that takes&#x2026;

2.Define a function that takes a filename and returns a list of the expres-sions in the file.


<a id="org1b23979"></a>

## Suppose that in some format&#x2026;

3.Suppose that in some format for text files, comments are indicated by `a%` character. Everything from this character to the end of the line is ignored. Define a function that takes two filenames, and writes to the second file a copy of the first, minus comments.


<a id="org5cbdbf6"></a>

## Define a function that takes&#x2026;

4.Define a function that takes a two-dimensional array of floats and displays it in neat columns. Each element should be printed with two digits after the decimal point, in a field 10 characters wide. (Assume all will fit.) You will need `array-dimensions` (page 361).


<a id="org698f44a"></a>

## Modify `stream-subst` to allow&#x2026;

5.Modify `stream-subst` to allow wildcards in the pattern. If the character + occurs in `old`, it should match any input character.


<a id="org132e2ea"></a>

## Modify `stream-subst` so that&#x2026;

6.Modify `stream-subst` so that the pattern can include an element that matches any digit character, an element that matches any alphanumeric character, or an element that matches any character. The pattern must also be able to match any specific input character. (Hint: `old` can no longer be a string.)

