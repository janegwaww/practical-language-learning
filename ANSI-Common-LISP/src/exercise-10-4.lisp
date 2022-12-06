(defmacro ntimes (n &rest body)
  (let ((g (gensym))
        (h (gensym)))
    `(let ((,h ,n))
       (do ((,g 0 (+ ,g 1)))
           ((>= ,g ,h))
         ,@body))))

(defmacro new-ntimes (n &rest body)
  (let ((g (gensym)))
    `(let ((,g ,n))
       (labels ((nt (i)
                  (if (<= i 0)
                      nil
                      (progn
                        ,@body
                        (nt (decf i))))))
         (nt ,g)))))
