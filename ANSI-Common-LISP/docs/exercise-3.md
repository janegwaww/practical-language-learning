

# exercises 3

1.  [Show the following lists in box notation:](#orgca63b2b)
2.  [Write a version of union that preserves the order of the elements in the original lists:](#org25d2f38)
3.  [Define a function that takes a list and&#x2026;](#org64b7622)
4.  [Why does `(member ' ( a ) ' ( ( a ) ( b ) ) )` return nil?](#org71be9e8)
5.  [Suppose the function `pos+` takes a list and&#x2026;](#org0aa07d4)
6.  [After years of deliberation,&#x2026;](#org1644c27)
7.  [Modify the program in Figure 3.6 to&#x2026;](#org8864d50)
8.  [Define a function that takes a list and prints it in dot notation:](#org23cf2f5)
9.  [Write a program to find the&#x2026;](#org30c754d)


<a id="orgca63b2b"></a>

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


<a id="org25d2f38"></a>

## Write a version of union that preserves the order of the elements in the original lists:

    (defun new-union (l1 l2)
      (reverse (remove-duplicates (reverse (append (copy-list l1) (copy-list l2))))))


<a id="org64b7622"></a>

## Define a function that takes a list and&#x2026;

Define a function that takes a list and returns a list indicating the
number of times each (eql) element appears, sorted from most common
element to least common:

    (defun occur (lst)
      ())
    
    (defun occurrences (lst)
      (sort (occur lst) #'> :key #'cdr))


<a id="org71be9e8"></a>

## Why does `(member ' ( a ) ' ( ( a ) ( b ) ) )` return nil?


<a id="org0aa07d4"></a>

## Suppose the function `pos+` takes a list and&#x2026;

Suppose the function pos+ takes a list and returns a list of each element
plus its position:


<a id="org1644c27"></a>

## After years of deliberation,&#x2026;

After years of deliberation, a government commission has decided that lists should be represented by using the cdr to point to the first element and the car to point to the rest of the list. Define the government versions of the following functions:


<a id="org8864d50"></a>

## Modify the program in Figure 3.6 to&#x2026;

Modify the program in Figure 3.6 to use fewer cons cells. (Hint: Use dotted lists.)


<a id="org23cf2f5"></a>

## Define a function that takes a list and prints it in dot notation:


<a id="org30c754d"></a>

## Write a program to find the&#x2026;

Write a program to find the `longest` finite path through a network represented as in Section 3.15. The network may contain cycles.

