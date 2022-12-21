

# exercise-12

1.  [Draw three different trees that&#x2026;](#org8ba5fb4)
2.  [Assuming make-queue,&#x2026;](#orge4fe317)
3.  [Define a function `copy-queue` that returns a copy of a queue.](#org0927208)
4.  [Define a function that&#x2026;](#orgfd65d23)
5.  [Define a function that&#x2026;](#org64c4217)
6.  [Define a function that&#x2026;](#org243dd75)
7.  [Define a function that&#x2026;](#org7162a41)
8.  [Define a function that&#x2026;](#org3daec28)


<a id="org8ba5fb4"></a>

## Draw three different trees that&#x2026;

1.Draw three different trees that would print as ((A) (A) (A)). Write an expression that generates each.

    (cons (cons 'a nil) (cons (cons 'a nil) (cons (cons 'a nil) nil)))
    
    (make-array '(3 1) :initial-element 'a)
    
    (vector '(a) '(a) '(a))


<a id="orge4fe317"></a>

## Assuming make-queue,&#x2026;

2.Assuming `make-queue`, `enqueue`, and `dequeue` are defined as in Figure 12.7, draw the queue in box-notation after each step:

    (defun make--queue () (cons nil nil))
    
    (defun enqueue (obj q)
      (if (null (car q))
          (setf (cdr q) (setf (car q) (list obj)))
          (setf (cdr (cdr q)) (list obj)
                (cdr q) (cdr (cdr q))))
      (car q))
    
    (defun dequeue (q)
      (pop (car q)))

    ;;> (setf q (make-queue)) ==> (NIL)

    +---+---+
    |nil|nil|
    +---+---+

    ;;> (enqueue 'a q) ==> (A)

    +---+---+
    |   |   |
    +-+-+-+-+
      | +-+
      | |
    +-+-+---+
    | a |nil|
    +---+---+

    ;;> (enqueue 'b q) ==> (A B)

    +---+---+
    |   |   |
    +-+-+-+-+
      |   |
      |   +---------+
    +-+-+----+  +---+---+
    | a |    +--+ b |nil|
    +---+----+  +---+---+

    ;;> (dequeue q) ==> A

    +---+
    | a |
    +---+


<a id="org0927208"></a>

## Define a function `copy-queue` that returns a copy of a queue.

    (defun copy-queue (q)
      (if (null (car q))
          nil
          (list (cons (car (car q))
                      (copy-queue  (list (cdr (car q)) (cdr q))))
                (cdr q))))


<a id="orgfd65d23"></a>

## Define a function that&#x2026;

4.Define a function that takes an object and a queue, and puts the object on the *front* of the queue.

    (defun push-queue (obj q)
      (setf (car q) (push obj (car q))))


<a id="org64c4217"></a>

## TODO Define a function that&#x2026;

5.Define a function that takes an object and a queue, and (destructively) moves the first (`eql`) instance of the object to the front of the queue.

    (defun push-first-queue (obj q)
      (push-queue obj q))


<a id="org243dd75"></a>

## Define a function that&#x2026;

6.Define a function that takes an object and a possibly cdr-circular list, and returns true if the object is a member of the list.

    (defun cdr-circle-m (obj cc)
      (if (cdr-circle-p cc)
          (member obj cc)
          nil))


<a id="org7162a41"></a>

## Define a function that&#x2026;

7.Define a function that returns true when its argument is a cdr-circular list.

    (defun cdr-circle-p (c)
      (and
        (consp c)
        (eql (cdr c) c)))


<a id="org3daec28"></a>

## Define a function that&#x2026;

8.Define a function that returns true when its argument is a car-circular list.

    (defun car-circle-p (cc)
      (and
       (consp cc)
       (eql (car cc) cc)))

