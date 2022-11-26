(defun bst-adjoin (obj bst <)
  (if (null bst)
      (make-nod :elt obj)
      (let ((elt (nod-elt bst))
            (ext (bst-find obj bst <)))
        (if (eql obj elt)
            bst
            (if (eql obj (nod-elt ext))
                bst
                (if (funcall < obj elt)
                    (make-nod
                     :elt elt
                     :l (bst-insert obj (nod-l bst) <)
                     :r (nod-r bst))
                    (make-nod
                     :elt elt
                     :l (nod-l bst)
                     :r (bst-insert obj (nod-r bst) <))))))))
