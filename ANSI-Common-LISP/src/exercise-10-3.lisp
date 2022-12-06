(defmacro nth-expr (n &rest body)
  `(case ,n
     ,@(let ((key -1))
         (mapcar #'(lambda (obj)
                     `(,(incf key) ,obj))
                 body))))
