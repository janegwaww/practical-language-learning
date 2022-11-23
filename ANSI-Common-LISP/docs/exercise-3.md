

# exercises 3

1.  [Show the following lists in box notation:](#org4f07b1a)
2.  [Write a version of union that preserves the order of the elements in the original lists:](#org4805236)
3.  [Define a function that takes a list and&#x2026;](#org1b0d1b2)
4.  [Why does `(member ' ( a ) ' ( ( a ) ( b ) ) )` return nil?](#org1dbb457)
5.  [Suppose the function `pos+` takes a list and&#x2026;](#org30e24d8)
6.  [After years of deliberation,&#x2026;](#org59c5f1e)
7.  [Modify the program in Figure 3.6 to&#x2026;](#org7d81872)
8.  [Define a function that takes a list and prints it in dot notation:](#org8dccd6d)
9.  [Write a program to find the&#x2026;](#org2146079)


<a id="org4f07b1a"></a>

## Show the following lists in box notation:

1.  `(a b (c d))`
    
    <del>-----</del>&#x2013;&#x2014;+      \\ <del>----</del>-&#x2014;+     \\ <del>----</del>&#x2013;&#x2014;+
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <tbody>
    <tr>
    <td class="org-left">a</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">--&#x2013;&#x2014;X</td>
    <td class="org-left">b</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">-&#x2013;&#x2014;X</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">nil</td>
    </tr>
    </tbody>
    </table>
    
    <del>-----</del>&#x2013;&#x2014;+      / <del>----</del>-&#x2014;+     / <del>--</del>-<del>-----</del>
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <tbody>
    <tr>
    </tr>
    </tbody>
    </table>
    
    <del>--</del>-<del>----</del>     \\ <del>----</del>-&#x2014;+
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <tbody>
    <tr>
    <td class="org-left">c</td>
    <td class="org-left">+-&#x2013;&#x2014;X</td>
    <td class="org-left">d</td>
    <td class="org-left">nil</td>
    </tr>
    </tbody>
    </table>
    
    <del>----</del>-&#x2014;+     / <del>----</del>-&#x2014;+

2.  `(a (b (c (d))))`
    
    <del>-----</del>-&#x2014;+    \\ <del>----</del>-&#x2014;+    \\ <del>----</del>-&#x2014;+    \\ <del>----</del>-&#x2014;+       <del>----</del>-&#x2014;+       <del>----</del>-&#x2014;+      <del>----</del>-&#x2014;+
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <tbody>
    <tr>
    <td class="org-left">a</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#x2013;&#x2014;X</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">nil</td>
    <td class="org-left">+&#x2013;X</td>
    <td class="org-left">b</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#x2013;&#x2014;X</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">nil</td>
    <td class="org-left"><del>---</del>  c</td>
    <td class="org-left"><del>-------</del></td>
    <td class="org-left">nil</td>
    <td class="org-left"><del>--</del> d</td>
    <td class="org-left">nil</td>
    </tr>
    </tbody>
    </table>
    
    <del>-----</del>-&#x2014;+    / <del>--</del>-<del>----</del>  | / <del>----</del>-&#x2014;+    / <del>--</del>-<del>----</del>   |   <del>----</del>-&#x2014;+       <del>--</del>-<del>----</del>   |  <del>----</del>-&#x2014;+
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <tbody>
    <tr>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">&#xa0;</td>
    </tr>
    </tbody>
    </table>
    
    <del>---------</del>                       <del>----------</del>                        <del>----------</del>
3.  `(((a b) c) d)`
    
    <del>----</del>-&#x2014;+       \\ <del>----</del>-&#x2014;+  /     <del>----</del>-&#x2014;+   \\ <del>----</del>-&#x2014;+  /    <del>----</del>-&#x2014;+     \\  <del>----</del>-&#x2014;+
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <tbody>
    <tr>
    <td class="org-left">a</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">---&#x2013;&#x2014;X</td>
    <td class="org-left">b</td>
    <td class="org-left">nil</td>
    <td class="org-left">-X-&#x2013;&#x2014;+</td>
    <td class="org-left">+-&#x2014;X</td>
    <td class="org-left">c</td>
    <td class="org-left">nil</td>
    <td class="org-left">-X&#x2013;&#x2014;+</td>
    <td class="org-left">+-&#x2013;&#x2014;X</td>
    <td class="org-left">d</td>
    <td class="org-left">nil</td>
    </tr>
    </tbody>
    </table>
    
    <del>----</del>-&#x2014;+       / <del>----</del>-&#x2014;+  \\     <del>----</del>-&#x2014;+   / <del>----</del>-&#x2014;+  \\    <del>----</del>-&#x2014;+     /  <del>----</del>-&#x2014;+

4.  `(a (b . c) . d)`
    
    <del>----</del>-&#x2014;+     \\ <del>---</del>-&#x2014;+
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <colgroup>
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    
    <col  class="org-left" />
    </colgroup>
    <tbody>
    <tr>
    <td class="org-left">a</td>
    <td class="org-left">+-&#x2013;&#x2014;X</td>
    <td class="org-left">&#xa0;</td>
    <td class="org-left">d</td>
    </tr>
    </tbody>
    </table>
    
    <del>----</del>-&#x2014;+     / <del>-</del>-<del>--</del>-+
    
    <table border="2" cellspacing="0" cellpadding="6" rules="groups" frame="hsides">
    
    
    <tbody>
    <tr>
    </tr>
    </tbody>
    
    
    <tr>
    <td class="org-left"><del>---</del>-&#x2014;+</td>
    </tr>
    </tbody>
    </table>
    
    <del>-</del> b |  c |
    
    <del>---</del>-&#x2014;+


<a id="org4805236"></a>

## Write a version of union that preserves the order of the elements in the original lists:

    (defun new-union (l1 l2)
      (reverse (remove-duplicates (reverse (append (copy-list l1) (copy-list l2))))))


<a id="org1b0d1b2"></a>

## Define a function that takes a list and&#x2026;

Define a function that takes a list and returns a list indicating the
number of times each (eql) element appears, sorted from most common
element to least common:

    ;;; compre
    
    (defun compre (lst)
      (if (consp lst)
          (compr (car lst) 1 (cdr lst))
          lst))
    
    ;; return compressed list
    (defun compr (elt n lst)
      (if (null lst)
          (list (cons elt n))
          (let ((next (car lst)))
            (if (eql next elt)
                (compr elt (+ n 1) (cdr lst))
                (if (member elt (cdr lst))
                    (compr elt n (append (cdr lst) (list next)))
                    (cons (cons elt n)
                          (compr next 1 (cdr lst))))))))
    
    ;;; sort
    
    ;; item largest in list
    (defun new-compare (item lst)
      (if (null lst)
          t
          (if (>= (cdr item) (cdar lst))
              (new-compare item (cdr lst)))))
    
    ;; return largest item
    (defun biggest (lst)
      (if (null (cdr lst))
          (car lst)
          (if (new-compare (car lst) (cdr lst))
              (car lst)
              (biggest (cdr lst)))))
    
    ;; return list except largest item
    (defun rest-big (lst)
      (if (= (cdr (car lst)) (cdr (biggest lst)))
          (cdr lst)
          (rest-big (append (cdr lst) (list (car lst))))))
    
    ;; sorting
    (defun new-sort (lst)
      (if (null (cdr lst))
          lst
          (let ((item (car lst))
                (big (biggest lst)))
            (if (= (cdr item) (cdr big))
                (cons item (new-sort (cdr lst)))
                (new-sort (cons big (rest-big lst)))))))
    
    ;;; main
    
    ;; > (occurrences ' ( a b a d a c d e a )
    ;; ((A . 4) (C . 2) (D . 2) (B . 1))
    (defun occurrences (lst)
      (new-sort (compre lst)))


<a id="org1dbb457"></a>

## Why does `(member ' ( a ) ' ( ( a ) ( b ) ) )` return nil?

Because two lists is different object, they allocates two pointers.


<a id="org30e24d8"></a>

## Suppose the function `pos+` takes a list and&#x2026;

Suppose the function pos+ takes a list and returns a list of each element
plus its position:

    ;;> (pos+ '( 7 5 1 4 ) )
    ;;(7 6 3 7)

Define this function using (a)recursion, (b)iteration, (c)mapcar.

    ;;; a) recursion
    
    (defun rec-pos+ (lst)
      (rec-pos-mid 0 lst))
    
    (defun rec-pos-mid (n lst)
      (if (null lst)
          nil
          (cons (+ (car lst) n) (rec-pos-mid (+ n 1) (cdr lst)))))
    
    ;;; b) iteration
    
    (defun ite-pos+ (lst)
      (let ((r '()))
        (do ((elt lst (cdr elt))
             (n 0 (+ n 1)))
            ((null elt) nil)
          (push (+ (car elt) n) r))
        (reverse r)))
    
    ;;; c) mapcar
    
    (defun map-pos+ (lst)
      (let ((n 0))
        (mapcar #'(lambda (x) (and
                               (setf n (+ n 1))
                               (+ x (- n 1))
                               ))
                lst)))


<a id="org59c5f1e"></a>

## After years of deliberation,&#x2026;

After years of deliberation, a government commission has decided that lists should be represented by using the cdr to point to the first element and the car to point to the rest of the list. Define the government versions of the following functions:


<a id="org7d81872"></a>

## Modify the program in Figure 3.6 to&#x2026;

Modify the program in Figure 3.6 to use fewer cons cells. (Hint: Use dotted lists.)


<a id="org8dccd6d"></a>

## Define a function that takes a list and prints it in dot notation:

    ;;> (showdots '(a b c))
    ;;(A . (B . (C . NIL)))
    ;;NIL
    (defun showdots (lst)
      (do ((str lst (cdr str)))
          ((null str) (format t "nil)"))
        (format t "(~a . " (car str))))
    (showdots '(1 2 3))


<a id="org2146079"></a>

## Write a program to find the&#x2026;

Write a program to find the `longest` finite path through a network represented as in Section 3.15. The network may contain cycles.

