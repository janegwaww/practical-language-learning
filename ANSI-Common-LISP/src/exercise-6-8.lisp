;; not code
(defun frugal (arg)
  (if (member arg store)
      (svref store arg)
      (expensive arg)))
