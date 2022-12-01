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
