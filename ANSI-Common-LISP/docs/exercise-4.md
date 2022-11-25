

# exercise-4

1.  [Define a function to take a square array&#x2026;](#org98983d8)
2.  [Read the description of reduce on page 368, then use it to define:](#org630c0c2)
3.  [Define a structure to represent a tree&#x2026;](#org0c4d02d)
4.  [Define a function that takes a BST and&#x2026;](#org198f2dc)
5.  [Define `bst-adjoin`. This function&#x2026;](#org96c21c6)
6.  [The contents of any hash table can be&#x2026;](#orgf6ab7c6)


<a id="org98983d8"></a>

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


<a id="org630c0c2"></a>

## Read the description of reduce on page 368, then use it to define:

    ;; a) copy-list
    
    ;; b) reverse(for lists)


<a id="org0c4d02d"></a>

## Define a structure to represent a tree&#x2026;

Define a structure to represent a tree where each node contains some
data and has up to three children. Define

    ;; a) a function to copy such a tree (so that no node in the copy is eql to a node in the original)
    
    ;; b) a function that takes an object and such a tree, and returns true if the object is eql to the data field of one of the nodes


<a id="org198f2dc"></a>

## Define a function that takes a BST and&#x2026;

Define a function that takes a BST and returns a list of its elements
ordered from greatest to least.


<a id="org96c21c6"></a>

## Define `bst-adjoin`. This function&#x2026;

Define `bst-adjoin`. This function should take the same arguments as `bst-insert`, but should only insert the object if there is nothing `eql` to it in the tree.


<a id="orgf6ab7c6"></a>

## The contents of any hash table can be&#x2026;

he contents of any hash table can be described by an assoc-list whose elements are `(k . v)`, for each key-value pair in the hash table. Define a function that

    ;; (a) takes an assoc-list and returns a corresponding hash table
    
    ;; (b) takes a hash table and returns a corresponding assoc-list

