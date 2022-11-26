

# exercise-4

1.  [Define a function to take a square array&#x2026;](#org843520a)
2.  [Read the description of reduce on page 368, then use it to define:](#org6e656ac)
3.  [Define a structure to represent a tree&#x2026;](#orga84227f)
4.  [Define a function that takes a BST and&#x2026;](#org1c7ff8f)
5.  [Define `bst-adjoin`. This function&#x2026;](#org6dcb0c5)
6.  [The contents of any hash table can be&#x2026;](#org484c2b1)


<a id="org843520a"></a>

## Define a function to take a square array&#x2026;

Define a function to take a square array (an array whose dimensions
are (n n)) and rotate it 90° clockwise:

    ;;>  (quarter-turn #2A((a b) (c d)))
    ;;#2A((C A) (D B))

You'll need array-dimensions (page 361).

    (defun quarter-turn (arr)
      (if (arrayp arr)
          (let* ((dim (array-dimensions arr))
                 (rarr (make-array dim))
                 (row (- (first dim) 1))
                 (col (- (second dim) 1)))
            (if (and (consp dim) (= row col))
                (do ((i 0 (+ i 1)))
                    ((> i row) rarr)
                  (do ((j 0 (+ j 1)))
                      ((> j col))
                    (setf (aref rarr j (- row i)) (aref arr i j))))
                arr))
          arr))
    
    (quarter-turn #2A((a b) (c d)))


<a id="org6e656ac"></a>

## Read the description of reduce on page 368, then use it to define:

    ;; a) copy-list
    (defun new-copy-list (lst)
      (and (listp lst)
           (reduce
            #'(lambda (k v)
                (if (listp k)
                    (append k (list v))
                    (list k v))
                )
            lst)
           ))
    
    ;; b) reverse(for lists)
    (defun new-reverse (lst)
      (and (listp lst)
           (reduce #'(lambda (k v)
                       (if (listp k)
                           (append (list v) k)
                           (list v k)))
                   lst)))


<a id="orga84227f"></a>

## Define a structure to represent a tree&#x2026;

Define a structure to represent a tree where each node contains some
data and has up to three children. Define

    ;; define tree structure
    (defstruct (node
                (:print-function
                 (lambda (n s d)
                   (format s "#<~a> (~a ~a ~a)"
                           (node-elt n)
                           (node-l n)
                           (node-m n)
                           (node-r n)))))
      elt (l nil) (m nil) (r nil))
    
    ;; a) a function to copy such a tree (so that no node in the copy is eql to a node in the original)
    (defun copy-tre (tre)
      (copy-node tre))
    
    ;; b) a function that takes an object and such a tree, and returns true if the object is eql to the data field of one of the nodes
    (defun tre-member (obj tre)
      (if (null tre)
          nil
          (let ((elt (node-elt tre)))
            (if (eql obj elt)
                t
                (or
                 (tre-member obj (node-l tre))
                 (tre-member obj (node-m tre))
                 (tre-member obj (node-r tre)))))))


<a id="org1c7ff8f"></a>

## Define a function that takes a BST and&#x2026;

Define a function that takes a BST and returns a list of its elements
ordered from greatest to least.

    ;;; previesly on BST
    ;;; code from chapter-4
    
    (defstruct (nod (:print-function
                     (lambda (n s d)
                       (format s "#<~A>" (nod-elt n)))))
      elt (l nil) (r nil))
    
    (defun bst-max (bst)
      (and bst
           (or (bst-max (nod-r bst)) bst)))
    
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
    
    (defparameter nums
      (let ((num nil))
        (dolist (x '(5 8 4 2 1 9 6 7 3))
          (setf num (bst-insert x num #'<)))
        num))
    
    ;;; ordered bst
    
    (defun order-bst (bst)
      (if (null bst)
          nil
          (let ((bmax (nod-elt (bst-max bst))))
            (cons bmax
                  (order-bst (bst-remove bmax bst #'<))))))
    ;; (order-bst nums)
    ;; ==> (9 8 6 7 5 4 2 3 1)


<a id="org6dcb0c5"></a>

## Define `bst-adjoin`. This function&#x2026;

Define `bst-adjoin`. This function should take the same arguments as `bst-insert`, but should only insert the object if there is nothing `eql` to it in the tree.


<a id="org484c2b1"></a>

## The contents of any hash table can be&#x2026;

he contents of any hash table can be described by an assoc-list whose elements are `(k . v)`, for each key-value pair in the hash table. Define a function that

    ;; (a) takes an assoc-list and returns a corresponding hash table
    
    ;; (b) takes a hash table and returns a corresponding assoc-list

