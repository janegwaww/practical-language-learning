(defun print-list-string (filename)
  (with-open-file (stream filename :direction :input)
    (loop for line = (read-line stream nil)
          while line do (format t "~a~%" line))))

;; (print-list-string "./myfile")
