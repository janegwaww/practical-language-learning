;;;;Example: Binary Search Trees
;;; previesly on BST
;;; code from chapter-4

(defstruct (nod (:print-function
                 (lambda (n s d)
                   (format s "#<~A>" (nod-elt n)))))
  elt (l nil) (r nil))

(defun bst-insert (obj bst <)
  (if (null bst)
      (make-nod :elt obj)
      (let ((elt (nod-elt bst)))
        (if (eql obj elt)
            bst
            (if (funcall < obj elt)
                (make-nod
                 :elt elt
                 :l (bst-insert obj (nod-l bst) <)
                 :r (nod-r bst))
                (make-nod
                 :elt elt
                 :r (bst-insert obj (nod-r bst) <)
                 :l (nod-l bst)))))))

(defun bst-max (bst)
  (and bst
       (or (bst-max (nod-r bst)) bst)))

(defun bst-min (bst)
  (and bst
       (or (bst-min (nod-l bst)) bst)))

(defun bst-find (obj bst <)
  (if (null bst)
      nil
      (let ((elt (nod-elt bst)))
        (if (eql obj elt)
            bst
            (if (funcall < obj elt)
                (bst-find obj (nod-l bst) <)
                (bst-find obj (nod-r bst) <))))))

(defun bst-remove (obj bst <)
  (if (null bst)
      nil
      (let ((elt (nod-elt bst)))
        (if (eql obj elt)
            (percolate bst)
            (if (funcall < obj elt)
                (make-nod
                 :elt elt
                 :l (bst-remove obj (nod-l bst) <)
                 :r (nod-r bst))
                (make-nod
                 :elt elt
                 :r (bst-remove obj (nod-r bst) <)
                 :l (nod-l bst)))))))

(defun rperc (bst)
  (make-nod :elt (nod-elt (nod-r bst))
            :l (nod-l bst)
            :r (percolate (nod-r bst))))
(defun lperc (bst)
  (make-nod :elt (nod-elt (nod-l bst))
            :l (percolate (nod-l bst))
            :r (nod-r bst)))

(defun percolate (bst)
  (cond ((null (nod-l bst))
         (if (null (nod-r bst))
             nil
             (rperc bst)))
        ((null (nod-r bst)) (lperc bst))
        (t (if (zerop (random 2))
               (lperc bst)
               (rperc bst)))))

(defun bst-traverse (fn bst)
  (when bst
    (bst-traverse fn (nod-l bst))
    (funcall fn (nod-elt bst))
    (bst-traverse fn (nod-r bst))))

(defparameter nums
  (let ((num nil))
    (dolist (x '(5 8 4 2 1 9 6 7 3))
      (setf num (bst-insert x num #'<)))
    num))
