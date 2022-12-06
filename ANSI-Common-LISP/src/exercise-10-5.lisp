;; > (let ((i 0) (n 4))
;;     (n-of n (incf i)))
;; ==>( 1 2 3 4)

(defun fun-n-of (n expr)
  (if (<= n 0)
      nil
      (cons (+ n expr) (fun-n-of (decf n) expr))))

(defmacro n-of (n expr)
  (let ((c (gensym))
        (e (gensym)))
    `(let ((,c ,n)
           (,e ,expr))
       (labels ((nof (i ex)
                  (if (<= i 0)
                      nil
                      (cons (+ i ,e)
                            (nof (decf i) ex)))))
         (nof ,c ,e)))))
