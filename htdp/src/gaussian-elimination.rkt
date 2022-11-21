;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname gaussian-elimination) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; An SOE is a non-empty Matrix.
; constraint for (list r1 ... rn), (length ri) is (+ n 1)
; interpretation represents a system of linear equations
 
; An Equation is a [List-of Number].
; constraint an Equation contains at least two numbers. 
; interpretation if (list a1 ... an b) is an Equation, 
; a1, ..., an are the left-hand-side variable coefficients 
; and b is the right-hand side
 
; A Solution is a [List-of Number]
 
(define M ; an SOE 
  (list (list 2 2  3 10) ; an Equation 
        (list 2 5 12 31)
        (list 4 1 -2  1)))
 
(define S '(1 1 2)) ; a Solution

; Equation -> [List-of Number]
; extracts the left-hand side from a row in a matrix
(check-expect (lhs (first M)) '(2 2 3))
(define (lhs e)
  (reverse (rest (reverse e))))
 
; Equation -> Number
; extracts the right-hand side from a row in a matrix
(check-expect (rhs (first M)) 10)
(define (rhs e)
  (first (reverse e)))


; Exercise 462
; Equation [List-of Number] -> Boolean
; whether list of number is solution of SOE
(check-expect (check-solution M S) #true)

(define (check-solution e l)
  (cond
    [(empty? e) #true]
    [else (and (plug-in (first e) l)
               (check-solution (rest e) l))]))

; [List-of Number] [List-of Number] -> Boolean
; the solution for on equation in equations
; terminate when list is empty
(check-expect (plug-in (first M) S) #true)

(define (plug-in e s)
  (local ((define (help l r)
            (cond
              [(empty? l) 0]
              [else (+ (* (first l) (first r))
                       (help (rest l) (rest r)))])))
    (= (help (lhs e) s) (rhs e))))

; Exercise 463
; check following system of equtions has the same solution
(check-expect (check-solution M1 S) #true)

(define M1 (list (list 2 2  3 10)
                 (list 0 3  9 21)
                 (list 0 0  1  2)))

; Exercise 464
; check equtions solution
(check-expect (check-solution M2 S) #true)

(define M2 (list (list 2  2  3   10)
                 (list 0  3  9   21)
                 (list 0 -3 -8  -19)))


; Exercise 465
; subtracts a multiple of the second equatin from the first
(check-expect (subtract '(2 2  3 10) '(4 5 12 31)) '(0.5 3 5.5))

(define (subtract el er)
  (local ((define rate (/ (first el) (first er)))
          (define (help l r)
            (cond
               [(empty? r) '()]
               [else (cons (- (* (first r) rate) (first l))
                           (help (rest l) (rest r)))])))
    (rest (help el er))))


; Exercise 466
; A TM is an [NEList-of Equation]
; such that the Equations are of decreasing length: 
;   n + 1, n, n - 1, ..., 2. 
; interpretation represents a triangular matrix

; SOE -> TM
; triangulates the given system of equations
(define M3 (list (list 2 2 3 10)
                 (list   3 9 21)
                 (list     -1 -2)))
(check-expect (triangulate (reverse M)) M3)

(define (triangulate M)
  (local ((define (help m)
            (cond
              [(empty? (rest m)) m]
              [else (cons (subtract (rhs m) (first m))
                          (help (rest m)))])))
    (cond
      [(empty? M) '()]
      [else (local ((define hm (help M)))
              (cons (rhs hm) (triangulate (lhs hm))))])))

; Exercise 467
; adapt triangulate to contain rotates possible
(check-expect (triangulate.v2 M4) M5)

(define (triangulate.v2 M)
  (local ((define (help m)
            (cond
              [(empty? (rest m)) m]
              [else (cons (subtract (rhs m) (first m))
                          (help (rest m)))])))
    (cond
      [(empty? M) '()]
      [else (local ((define hm (help M)))
              (cons (rhs hm) (triangulate (lhs hm))))])))


(define M4 (list (list 2  3  3 8)
                 (list 2  3 -2 3)
                 (list 4 -2  2 4)))
(define M5 (list (list 2  3  3   8)
                 (list   -8 -4 -12)
                 (list      -5  -5)))
(check-expect (check-solution M5 '(1 1 1)) #true)
