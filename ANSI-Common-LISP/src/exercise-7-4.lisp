(defun array-column (arr)
  (let ((dim (array-dimensions arr)))
    (do ((i (- (first dim) 1) (- i 1)))
        ((< i 0))
      (do ((j (- (second dim) 1) (- j 1)))
          ((< j 0))
        (format t "~10,2,0,'*,' F~%" (aref arr i j))))))

;; (array-column #2a((1 2) (3 4)))
