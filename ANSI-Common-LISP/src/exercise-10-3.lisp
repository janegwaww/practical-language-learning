(defmacro nth-expr (n &rest body)
  (let ((nt (gensym)))
    `(let ((,nt ,(1- n)))
       ,(nth n body))))
