

# exercise-7

1.  [Define a function that takes&#x2026;](#org4469a74)
2.  [Define a function that takes&#x2026;](#orgaf6349c)
3.  [Suppose that in some format&#x2026;](#org48dc1b9)
4.  [Define a function that takes&#x2026;](#org3d3fdbb)
5.  [Modify `stream-subst` to allow&#x2026;](#orga9158f1)
6.  [Modify `stream-subst` so that&#x2026;](#org73cd31c)


<a id="org4469a74"></a>

## Define a function that takes&#x2026;

1.Define a function that takes a filename and returns a list of strings representing each line in the file.

    (defun print-list-string (filename)
      (with-open-file (stream filename :direction :input)
        (loop for line = (read-line stream nil)
              while line do (format t "~a~%" line))))
    
    ;; (print-list-string "./myfile")


<a id="orgaf6349c"></a>

## Define a function that takes&#x2026;

2.Define a function that takes a filename and returns a list of the expres-sions in the file.

    (defun print-list-exp (filename)
      (with-open-file (stream filename :direction :input)
        (loop for s = (read stream nil)
              while s do (format t "~a~%" s))))
    ;; (print-list-exp "./myfile-s")


<a id="org48dc1b9"></a>

## Suppose that in some format&#x2026;

3.Suppose that in some format for text files, comments are indicated by `a%` character. Everything from this character to the end of the line is ignored. Define a function that takes two filenames, and writes to the second file a copy of the first, minus comments.

    (defun remove-comments (fname1 fname2)
      (with-open-file (in fname1 :direction :input)
        (with-open-file (out fname2 :direction :output
                                    :if-exists :supersede)
          (do ((line (read-line in nil 'eof)
                     (read-line in nil 'eof)))
              ((eql line 'eof))
            (if (not (eql 'a% (read-from-string line)))
                (format out "~a~%" line))))))
    
    (remove-comments "./myfile-c" "./myfile-c-c")


<a id="org3d3fdbb"></a>

## Define a function that takes&#x2026;

4.Define a function that takes a two-dimensional array of floats and displays it in neat columns. Each element should be printed with two digits after the decimal point, in a field 10 characters wide. (Assume all will fit.) You will need `array-dimensions` (page 361).


<a id="orga9158f1"></a>

## Modify `stream-subst` to allow&#x2026;

5.Modify `stream-subst` to allow wildcards in the pattern. If the character + occurs in `old`, it should match any input character.


<a id="org73cd31c"></a>

## Modify `stream-subst` so that&#x2026;

6.Modify `stream-subst` so that the pattern can include an element that matches any digit character, an element that matches any alphanumeric character, or an element that matches any character. The pattern must also be able to match any specific input character. (Hint: `old` can no longer be a string.)

