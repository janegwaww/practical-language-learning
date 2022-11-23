(defun longest-path (start end net)
  (find-longest (bfs end (list (list start)) net)))

(defun find-longest (lst)
  (find-longest-item (car lst) (cdr lst)))

(defun find-longest-item (item lst)
  (if (null lst)
      item
      (if (>= (length item) (length (car lst)))
          (find-longest-item item (cdr lst))
          (find-longest-item (car lst) (cdr lst)))))

(defun bfs (end queue net)
  (if (null queue)
      nil
      (let ((path (car queue)))
        (let ((node (car path)))
          (if (eql node end)
              (cons (reverse path)
                    (bfs end
                         (append (cdr queue)
                                 (new-paths path node net))
                         net))
              (bfs end
                   (append (cdr queue)
                           (new-paths path node net))
                   net))))))

(defun new-paths (path node net)
  (mapcar #'(lambda (n)
              (cons n path))
          (cdr (assoc node net))))
