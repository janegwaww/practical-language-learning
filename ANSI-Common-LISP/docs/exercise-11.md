

# exercise-11

1.  [Define accessors, initforms&#x2026;](#org2e591d4)
2.  [Rewrite the code in&#x2026;](#org8049b89)
3.  [Suppose that a number of classes are defined as follows:](#orgb8a9b4d)
4.  [Suppose that you already have the following functions:](#org2fb6526)
5.  [Without changing the behavior&#x2026;](#orgb9714e7)
6.  [Give an example of a problem&#x2026;](#orgb327613)


<a id="org2e591d4"></a>

## Define accessors, initforms&#x2026;

1.Define accessors, initforms, and initargs for the classes defined in Figure 11.2. Rewrite the associated code so that it no longer calls
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


<a id="org8049b89"></a>

## Rewrite the code in&#x2026;

2.Rewrite the code in Figure 9.5 so that spheres and points are classes, and `intersect` and normal are generic functions.([section-9-8 Example: Ray-Tracing](section-9-8.md))

    (defclass point ()
      ((x :accessor x)
       (y :accessor y)
       (z :accessor z)))
    
    (defclass surface ()
      ((color
        :initarg :color)))
    
    (defclass sphere (surface)
      ((radius
        :accessor sphere-radius
        :initarg :radius
        :initform 0)
       (center
        :accessor sphere-center
        :initarg :center
        :initform (make-instance 'point))))
    
    (defgeneric intersect (sphere pt xr yr zr))
    
    (defgeneric normal (sphere pt))
    
    (defmethod intersect ((s sphere) pt xr yr zr)
      (let* ((c (sphere-center s))
             (n (minroot (+ (sq xr) (sq yr) (sq zr))
                         (* 2 (+ (* (- (x pt) (x c)) xr)
                                 (* (- (y pt) (y c)) yr)
                                 (* (- (z pt) (z c)) zr)))
                         (+ (sq (- (x pt) (x c)))
                            (sq (- (y pt) (y c)))
                            (sq (- (z pt) (z c)))
                            (- (sq (sphere-radius s)))))))
        (if n
            (make-instance 'point :x (+ (x pt) (* n xr))
                                  :y (+ (y pt) (* n yr))
                                  :z (+ (z pt) (* n zr))))))
    
    (defmethod normal ((s sphere) pt)
      (let ((c (sphere-center s)))
        (unit-vector (- (x c) (x pt))
                     (- (y c) (y pt))
                     (- (z c) (z pt)))))


<a id="orgb8a9b4d"></a>

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

[exercise-11-3](exercise-11-3.md)


<a id="org2fb6526"></a>

## Suppose that you already have the following functions:

`precedence`: takes an object and returns its precedence list, a list of classes ordered from most specific to least specific.

`methods`: takes a generic function and returns a list of all its methods.

`specializations` : takes a method and returns a list of the specializations of the parameters. Each element of the returned list will be either a class, or a list of the form `(eql x)`, or `t` (indicating that the parameter is unspecialized).

Using these functions (and not `compute-applicable-methods` or `find-method`), define a function `most-spec-app-meth` that takes a generic function and a list of the arguments with which it has been called, and returns the most specific applicable method, if any.

    (defun most-spec-app-meth (gfun &rest obj)
      (let ((pl (precedence obj))
            (ml (methods gfun)))
        (dolist (m ml)
          (let ((sl (specialization m)))
            (dolist (s sl)
              (cond
                ((member s pl) s)
                ((eql x) x)
                (t s)))))))


<a id="orgb9714e7"></a>

## Without changing the behavior&#x2026;

5.Without changing the behavior of the generic function `area` (Figure 11.2) in any other respect, arrange it so that a global counter gets incremented each time `area` is called.


<a id="orgb327613"></a>

## Give an example of a problem&#x2026;

6.Give an example of a problem that would be difficult to solve if only the first argument to a generic function could be specialized.

