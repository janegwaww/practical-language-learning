(let ((pre 0))
  (defun greater-than-last (num)
    (prog1 (and pre (> num pre))
      (setf pre num))))
