

# exercise-11

1.  [Define accessors, initforms&#x2026;](#org4bd9527)
2.  [Rewrite the code in&#x2026;](#orgc940816)
3.  [Suppose that a number of classes are defined as follows:](#org747ed77)
4.  [Suppose that you already have the following functions:](#org7753d15)
5.  [Without changing the behavior&#x2026;](#org67f874b)
6.  [Give an example of a problem&#x2026;](#org02b51b8)


<a id="org4bd9527"></a>

## Define accessors, initforms&#x2026;

1.Define accessors, initforms, and initargs for the classes defined in
Figure 11.2. Rewrite the associated code so that it no longer calls
`slot-value`.


<a id="orgc940816"></a>

## Rewrite the code in&#x2026;

2.Rewrite the code in Figure 9.5 so that spheres and points are classes,
and `intersect` and normal are generic functions.


<a id="org747ed77"></a>

## Suppose that a number of classes are defined as follows:

    (defclass a (c d) ...)
    (defclass b (d c) ...)
    (defclass c () ..)
    (defclass d (e f g) ...)
    
    (defclass e () ...)
    (defclass f (h) ...)
    (defclass g (h) ...)
    (defclass h () ...)

a.Draw the network representing the ancestors of `a`, and list the classes an instance of a belongs to, from most to least specific.

b.Do the same for b.


<a id="org7753d15"></a>

## Suppose that you already have the following functions:

`precedence`: takes an object and returns its precedence list, a list of classes ordered from most specific to least specific.

`methods`: takes a generic function and returns a list of all its methods.

`specializations` : takes a method and returns a list of the specializations of the parameters. Each element of the returned list will be either a class, or a list of the form `(eql x)`, or `t` (indicating that the parameter is unspecialized).

Using these functions (and not `compute-applicable-methods` or `find-method`), define a function `most-spec-app-meth` that takes a generic function and a list of the arguments with which it has been called, and returns the most specific applicable method, if any.


<a id="org67f874b"></a>

## Without changing the behavior&#x2026;

5.Without changing the behavior of the generic function `area` (Figure 11.2) in any other respect, arrange it so that a global counter gets incremented each time `area` is called.


<a id="org02b51b8"></a>

## Give an example of a problem&#x2026;

6.Give an example of a problem that would be difficult to solve if only the first argument to a generic function could be specialized.

