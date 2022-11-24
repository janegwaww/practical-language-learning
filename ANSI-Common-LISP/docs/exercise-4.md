
# Table of Contents

1.  [exercise-4](#orgfa039a6)
    1.  [Define a function to take a square array](#orga081bed)
    2.  [Read the description of reduce on page 368, then use it to define:](#org46d781c)
    3.  [Define a structure to represent a tree](#org650b2ea)
    4.  [Define a function that takes a BST and&#x2026;](#org3b0f990)
    5.  [Define `bst-adjoin`. This function&#x2026;](#orga355b37)
    6.  [The contents of any hash table can be&#x2026;](#org5f8988d)



<a id="orgfa039a6"></a>

# exercise-4

1.  [Define a function to take a square array](#orga081bed)
2.  [Read the description of reduce on page 368, then use it to define:](#org46d781c)
3.  [Define a structure to represent a tree](#org650b2ea)
4.  [Define a function that takes a BST and&#x2026;](#org3b0f990)
5.  [Define `bst-adjoin`. This function&#x2026;](#orga355b37)
6.  [The contents of any hash table can be&#x2026;](#org5f8988d)


<a id="orga081bed"></a>

## Define a function to take a square array

Define a function to take a square array (an array whose dimensions
are (n n)) and rotate it 90° clockwise:

    ;;>  (quarter-turn #2A((a b) (c d)))
    ;;#2A((C A) (D B))

You'll need array-dimensions (page 361).


<a id="org46d781c"></a>

## Read the description of reduce on page 368, then use it to define:

    ;; a) copy-list
    
    ;; b) reverse(for lists)


<a id="org650b2ea"></a>

## Define a structure to represent a tree

Define a structure to represent a tree where each node contains some
data and has up to three children. Define

    ;; a) a function to copy such a tree (so that no node in the copy is eql to a node in the original)
    
    ;; b) a function that takes an object and such a tree, and returns true if the object is eql to the data field of one of the nodes


<a id="org3b0f990"></a>

## Define a function that takes a BST and&#x2026;

Define a function that takes a BST and returns a list of its elements
ordered from greatest to least.


<a id="orga355b37"></a>

## Define `bst-adjoin`. This function&#x2026;

Define `bst-adjoin`. This function should take the same arguments as `bst-insert`, but should only insert the object if there is nothing `eql` to it in the tree.


<a id="org5f8988d"></a>

## The contents of any hash table can be&#x2026;

he contents of any hash table can be described by an assoc-list whose elements are `(k . v)`, for each key-value pair in the hash table. Define a function that

    ;; (a) takes an assoc-list and returns a corresponding hash table
    
    ;; (b) takes a hash table and returns a corresponding assoc-list

