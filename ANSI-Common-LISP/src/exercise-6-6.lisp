(let ((mx))
  (defun greatest-so-far (num)
    (if (and mx (> mx num))
        mx
        (setf mx num))))
