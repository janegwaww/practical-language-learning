

# exercise-11

1.  [Define accessors, initforms&#x2026;](#orgdce9e3f)
2.  [Rewrite the code in&#x2026;](#org3308766)
3.  [Suppose that a number of classes are defined as follows:](#orga966b57)
4.  [Suppose that you already have the following functions:](#org924fcab)
5.  [Without changing the behavior&#x2026;](#org8d48056)
6.  [Give an example of a problem&#x2026;](#orgf83c83d)


<a id="orgdce9e3f"></a>

## Define accessors, initforms&#x2026;

1.Define accessors, initforms, and initargs for the classes defined in
Figure 11.2. Rewrite the associated code so that it no longer calls
`slot-value`.

    (defclass rectangle ()
      ((height
        :accessor rec-height
        :initarg :height
        :initform 0)
       (width
        :accessor rec-width
        :initarg :width
        :initform 0)))
    
    (defclass circle ()
      ((radius
        :accessor circle-radius
        :initarg :radius
        :initform 0)))
    
    (defmethod area ((x rectangle))
      (* (rec-height x) (rec-width x)))
    
    (defmethod area ((x circle))
      (* pi (expt (circle-radius x) 2)))
    
    (let ((r (make-instance 'rectangle)))
      (setf (rec-height r) 2
            (rec-width r) 3)
      (area r))


<a id="org3308766"></a>

## Rewrite the code in&#x2026;

2.Rewrite the code in Figure 9.5 so that spheres and points are classes,
and `intersect` and normal are generic functions.


<a id="orga966b57"></a>

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


<a id="org924fcab"></a>

## Suppose that you already have the following functions:

`precedence`: takes an object and returns its precedence list, a list of classes ordered from most specific to least specific.

`methods`: takes a generic function and returns a list of all its methods.

`specializations` : takes a method and returns a list of the specializations of the parameters. Each element of the returned list will be either a class, or a list of the form `(eql x)`, or `t` (indicating that the parameter is unspecialized).

Using these functions (and not `compute-applicable-methods` or `find-method`), define a function `most-spec-app-meth` that takes a generic function and a list of the arguments with which it has been called, and returns the most specific applicable method, if any.


<a id="org8d48056"></a>

## Without changing the behavior&#x2026;

5.Without changing the behavior of the generic function `area` (Figure 11.2) in any other respect, arrange it so that a global counter gets incremented each time `area` is called.


<a id="orgf83c83d"></a>

## Give an example of a problem&#x2026;

6.Give an example of a problem that would be difficult to solve if only the first argument to a generic function could be specialized.

