

# exercise-12

1.  [Draw three different trees that&#x2026;](#org5146c87)
2.  [Assuming make-queue,&#x2026;](#org9ee90e7)
3.  [Define a function `copy-queue` that returns a copy of a queue.](#orgb15951a)
4.  [Define a function that&#x2026;](#org08dc990)
5.  [Define a function that&#x2026;](#orgfc77eb6)
6.  [efine a function that&#x2026;](#orga2c0500)
7.  [Define a function that&#x2026;](#orge5cfb23)
8.  [Define a function that&#x2026;](#org1696f3c)


<a id="org5146c87"></a>

## Draw three different trees that&#x2026;

1.Draw three different trees that would print as ((A) (A) (A)). Write an expression that generates each.

    (cons (cons 'a nil) (cons (cons 'a nil) (cons (cons 'a nil) nil)))
    
    (make-array '(3 1) :initial-element 'a)
    
    (vector '(a) '(a) '(a))


<a id="org9ee90e7"></a>

## Assuming make-queue,&#x2026;

2.Assuming `make-queue`, `enqueue`, and `dequeue` are defined as in Figure 12.7, draw the queue in box-notation after each step:


<a id="orgb15951a"></a>

## Define a function `copy-queue` that returns a copy of a queue.


<a id="org08dc990"></a>

## Define a function that&#x2026;

4.Define a function that takes an object and a queue, and puts the object on the *front* of the queue.


<a id="orgfc77eb6"></a>

## Define a function that&#x2026;

5.Define a function that takes an object and a queue, and (destructively) moves the first (`eql`) instance of the object to the front of the queue.


<a id="orga2c0500"></a>

## efine a function that&#x2026;

6.Define a function that takes an object and a possibly cdr-circular list, and returns true if the object is a member of the list.


<a id="orge5cfb23"></a>

## Define a function that&#x2026;

7.Define a function that returns true when its argument is a cdr-circular list.


<a id="org1696f3c"></a>

## Define a function that&#x2026;

8.Define a function that returns true when its argument is a car-circular list.

