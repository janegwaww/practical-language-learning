;;; solution origin: https://stackoverflow.com/questions/9043805/test-if-two-lines-intersect-javascript-function

(defun intersect-line (l1 l2 r1 r2)
  (intersects
   (car l1) (cdr l1) (car l2) (cdr l2)
   (car r1) (cdr r1) (car r2) (cdr r2)))

(defun intersects (a b c d p q r s)
  (let* ((det (- (* (- c a) (- s q))
                 (* (- r p) (- d b))))
         (gamma (/ (+ (* (- s q) (- r a))
                      (* (- p r) (- s b)))
                   det))
         (lambdap (/ (+ (* (- b d) (- r a))
                        (* (- c a) (- s b)))
                     det)))
    (cond ((= det 0) nil)
          ((and (and (> lambdap 0) (< lambdap 1))
                (and (> gamma 0) (< gamma 1)))
           (cons (+ a (* lambdap (- c a)))
                 (+ b (* lambdap (- d  b)))))
          (t nil))))
