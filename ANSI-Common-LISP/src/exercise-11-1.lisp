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
