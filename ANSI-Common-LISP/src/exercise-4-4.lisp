;;; ordered bst

(defun order-bst (bst)
  (if (null bst)
      nil
      (let ((bmax (nod-elt (bst-max bst))))
        (cons bmax
              (order-bst (bst-remove bmax bst #'<))))))
;; (order-bst nums)
;; ==> (9 8 6 7 5 4 2 3 1)
