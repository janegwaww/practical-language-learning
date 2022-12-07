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
