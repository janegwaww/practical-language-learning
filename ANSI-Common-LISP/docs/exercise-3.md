

# exercises 3

1.  [Show the following lists in box notation:](#org9b2b30e)
2.  [Write a version of union that preserves the order of the elements in the original lists:](#org0330797)
3.  [Define a function that takes a list and&#x2026;](#org9022b1b)
4.  [Why does `(member ' ( a ) ' ( ( a ) ( b ) ) )` return nil?](#orge9297d5)
5.  [Suppose the function `pos+` takes a list and&#x2026;](#orgb79f621)
6.  [After years of deliberation,&#x2026;](#orgb6119d8)
7.  [Modify the program in Figure 3.6 to&#x2026;](#orgd286e03)
8.  [Define a function that takes a list and prints it in dot notation:](#orge80f796)
9.  [Write a program to find the&#x2026;](#orgf5107ef)


<a id="org9b2b30e"></a>

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


<a id="org0330797"></a>

## Write a version of union that preserves the order of the elements in the original lists:

    (defun new-union (l1 l2)
      (reverse (remove-duplicates (reverse (append (copy-list l1) (copy-list l2))))))


<a id="org9022b1b"></a>

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


<a id="orge9297d5"></a>

## Why does `(member ' ( a ) ' ( ( a ) ( b ) ) )` return nil?

Because two lists is different object, they allocates two pointers.


<a id="orgb79f621"></a>

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


<a id="orgb6119d8"></a>

## After years of deliberation,&#x2026;

After years of deliberation, a government commission has decided that lists should be represented by using the cdr to point to the first element and the car to point to the rest of the list. Define the government versions of the following functions:

    ;;; a) cons
    
    (defun new-cons (l r)
      (lambda (x)
        (if (= x 1)
            r
            l)))
    
    ;; car
    (defun new-car (fn)
      (funcall fn 1))
    
    ;; cdr
    (defun new-cdr (fn)
      (funcall fn 2))
    
    ;;; b) list
    
    (defun new-list (&rest params)
      (if (consp params)
          (get-list params)
          params))
    
    (defun get-list (lst)
      (if (null lst)
          nil
          (new-cons (car lst)
                    (get-list (cdr lst)))))
    
    ;;; c) length
    
    (defun new-length (lst)
      (if (null lst)
          0
          (+ 1 (new-length (new-car lst)))))
    
    ;;; d) member
    
    (defun new-member (elt lst)
      (if (null lst)
          nil
          (if (eql elt (new-cdr lst))
              t
              (new-member elt (new-car lst )))))


<a id="orgd286e03"></a>

## Modify the program in Figure 3.6 to&#x2026;

Modify the program in Figure 3.6 to use fewer cons cells. (Hint: Use dotted lists.)

    (defun compress (x)
      (if (consp x)
          (compr (cons (car x) 1) (cdr x))
          x))
    
    (defun compr (elt 1st)
      (if (null 1st)
          (list elt)
          (let ((next (car 1st))
                (item (car elt))
                (num (cdr elt)))
            (if (eql next item)
                (compr (cons next (+ num 1)) (cdr 1st))
                (cons (cons item num)
                      (compr (cons next 1) (cdr 1st)))))))


<a id="orge80f796"></a>

## Define a function that takes a list and prints it in dot notation:

    ;;> (showdots '(a b c))
    ;;(A . (B . (C . NIL)))
    ;;NIL
    (defun showdots (lst)
      (do ((str lst (cdr str)))
          ((null str) (format t "nil)"))
        (format t "(~a . " (car str))))
    (showdots '(1 2 3))


<a id="orgf5107ef"></a>

## Write a program to find the&#x2026;

Write a program to find the `longest` finite path through a network represented as in Section 3.15. The network may contain cycles.

