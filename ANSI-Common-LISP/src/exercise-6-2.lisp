(defun bin-search
    (vec &key (key 0) (test #'finder) (start 0) (end (- (length vec) 1)))
  (funcall #'finder key vec start end))

(defun finder (obj vec start end)
  (let ((range (- end start)))
    (if (zerop range)
        (if (eql obj (aref vec start))
            obj
            nil)
        (let ((mid (+ start (round (/ range 2)))))
          (let ((obj2 (aref vec mid)))
            (if (< obj obj2)
                (finder obj vec start (- mid 1))
                (if (> obj obj2)
                    (finder obj vec (+ mid 1) end)
                    obj)))))))

(finder 3 #(0 1 2 3 4 5 6 7 8 9) 0 8)
(bin-search #(0 1 2 3 4 5 6 7 8 9) :key 3)
