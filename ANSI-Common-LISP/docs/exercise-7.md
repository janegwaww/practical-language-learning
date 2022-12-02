

# exercise-7

1.  [Define a function that takes&#x2026;](#orge53ed3f)
2.  [Define a function that takes&#x2026;](#orgc02833b)
3.  [Suppose that in some format&#x2026;](#orge81477b)
4.  [Define a function that takes&#x2026;](#org51840b4)
5.  [Modify `stream-subst` to allow&#x2026;](#org60ba940)
6.  [Modify `stream-subst` so that&#x2026;](#orgfe9a6ee)


<a id="orge53ed3f"></a>

## Define a function that takes&#x2026;

1.Define a function that takes a filename and returns a list of strings representing each line in the file.

    (defun print-list-string (filename)
      (with-open-file (stream filename :direction :input)
        (loop for line = (read-line stream nil)
              while line do (format t "~a~%" line))))
    
    ;; (print-list-string "./myfile")


<a id="orgc02833b"></a>

## Define a function that takes&#x2026;

2.Define a function that takes a filename and returns a list of the expres-sions in the file.

    (defun print-list-exp (filename)
      (with-open-file (stream filename :direction :input)
        (loop for s = (read stream nil)
              while s do (format t "~a~%" s))))
    ;; (print-list-exp "./myfile-s")


<a id="orge81477b"></a>

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


<a id="org51840b4"></a>

## Define a function that takes&#x2026;

4.Define a function that takes a two-dimensional array of floats and displays it in neat columns. Each element should be printed with two digits after the decimal point, in a field 10 characters wide. (Assume all will fit.) You will need `array-dimensions` (page 361).

    (defun array-column (arr)
      (let ((dim (array-dimensions arr)))
        (do ((i (- (first dim) 1) (- i 1)))
            ((< i 0))
          (do ((j (- (second dim) 1) (- j 1)))
              ((< j 0))
            (format t "~10,2,0,'*,' F~%" (aref arr i j))))))
    
    ;; (array-column #2a((1 2) (3 4)))


<a id="org60ba940"></a>

## Modify `stream-subst` to allow&#x2026;

5.Modify `stream-subst` to allow wildcards in the pattern. If the character + occurs in `old`, it should match any input character.(`stream-subst` in [7.4 Example: String Substitution](chapter-7-4.md))

    (defun stream-subst (old new in out)
      (let* ((pos 0)
             (len (length old))
             (buf (new-buf len))
             (from-buf nil))
        (do ((c (read-char in nil :eof)
                (or (setf from-buf (buf-next buf))
                    (read-char in nil :eof))))
            ((eql c :eof))
          (cond ((or (char= c #\*) (char= c (char old pos))) (incf pos)
                 (cond ((= pos len)   ;3
                        (princ new out)
                        (setf pos 0)
                        (buf-clear buf))
                       ((not from-buf)  ;2
                        (buf-insert c buf))))
                ((zerop pos)   ;1
                 (princ c out)
                 (when from-buf
                   (buf-pop buf)
                   (buf-reset buf)))
                (t    ;4
                 (unless from-buf
                   (buf-insert c buf))
                 (princ (buf-pop buf) out)
                 (buf-reset buf)
                 (setf pos 0))))
        (buf-flush buf out)))


<a id="orgfe9a6ee"></a>

## Modify `stream-subst` so that&#x2026;

6.Modify `stream-subst` so that the pattern can include an element that matches any digit character, an element that matches any alphanumeric character, or an element that matches any character. The pattern must also be able to match any specific input character. (Hint: `old` can no longer be a string.)(`stream-subst` in [7.4 Example: String Substitution](chapter-7-4.md))

    (defun stream-subst (old new in out)
      (let* ((pos 0)
             (len (length old))
             (buf (new-buf len))
             (from-buf nil))
        (do ((c (read-char in nil :eof)
                (or (setf from-buf (buf-next buf))
                    (read-char in nil :eof))))
            ((eql c :eof))
          (cond ((compare-char c (char old pos))
                 (incf pos)
                 (cond ((= pos len)   ;3
                        (princ new out)
                        (setf pos 0)
                        (buf-clear buf))
                       ((not from-buf)  ;2
                        (buf-insert c buf))))
                ((zerop pos)   ;1
                 (princ c out)
                 (when from-buf
                   (buf-pop buf)
                   (buf-reset buf)))
                (t    ;4
                 (unless from-buf
                   (buf-insert c buf))
                 (princ (buf-pop buf) out)
                 (buf-reset buf)
                 (setf pos 0))))
        (buf-flush buf out)))
    
    (defun compare-char (ch old &key fn)
      (or
       (char= ch old)
       (and (char= old #\%)
            (numberp ch))
       (and (char= old #\$)
            (alpha-char-p ch))
       (char= ch #\*)
       (and fn (fn ch old))))

