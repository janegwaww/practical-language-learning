(defun add-x (x y)
  (+ x y))

(defun mul (x &optional (y x))
  (* x y))

(defun primep (number)
  (when (> number 1)
    (loop for fac from 2 to (isqrt number) never (zerop (mod number fac)))))

(defun next-prime (number)
  (loop for n from number when (primep n) return n))
(next-prime )

(do ((p (next-prime 0) (next-prime (1+ p))))
    ((> p 19))
  (format t "~d" p))

(defmacro do-primes (var-and-range &rest body)
  (let ((var (first var-and-range))
        (start (second var-and-range))
        (end (third var-and-range)))
    `(do ((,var (next-prime ,start) (next-prime (1+ ,var))))
         ((> ,var ,end))
       ,@body)))

(defun sum (n)
  (let ((s 0))
    (dotimes (i n s)
      (incf s i))))

(defun addn (n)
  #'(lambda (x)
      (+ x n)))

(defun askem (string)
  (format t "~A" string)
  (read))
