;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-advanced-reader.ss" "lang")((modname accumulator-style) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(define-struct node [left right])
; A Tree is one of: 
; – '()
; – (make-node Tree Tree)
(define example
  (make-node (make-node '() (make-node '() '())) '()))

; Exercise 498
; Tree -> N
; measures the height of abt0
(check-expect (height.v2 example) 3)
(check-expect (height.v2 example) 3)

(define (height.v2 abt0)
  (local (; Tree N N -> N
          ; measures the height of abt
          ; accumulator s is the number of steps 
          ; it takes to reach abt from abt0
          ; accumulator m is the maximal height of
          ; the part of abt0 that is to the left of abt
          (define (h/a abt s m)
            (cond
              [(empty? abt) s]
              [else
               (max (h/a (node-left abt)
                         (add1 s) (add1 m)) 
                    (h/a (node-right abt)
                         (add1 s) m))])))
    (h/a abt0 0 0)))

; Exercise 499
; [List-of Number] -> Number
; product if a list numbers
(check-expect (product '(1 2 3)) 6)

(define (product l)
  (local ((define (p/a l n)
            (cond
              [(empty? l) n]
              [else (p/a (rest l) (* n (first l)))])))
    (p/a l 1)))


; Exercise 500
; [List-of Number] -> Number
; determines the number of items on a list
(check-expect (how-many '(1 3 4)) 3)

(define (how-many l)
  (local ((define (h/a l n)
            (cond
              [(empty? l) n]
              [else (h/a (rest l) (add1 n))])))
    (h/a l 0)))


; Exercise 501
; N -> Number
; adds n to pi without using +
(check-within (add-to-pi 2) (+ 2 pi) 0.001)

(define (add-to-pi n)
  (local ((define (atp/a n0 x)
            (cond
              [(zero? n0) x]
              [else (atp/a (sub1 n0) (add1 x))])))
    (atp/a n pi)))


; Exercise 502
; [NEList-of 1String] -> [NEList-of 1String]
; constracts a palindrome by mirroring
; the list around the last item
(check-expect
  (palindrome (explode "abcd")) (explode "abcdcba"))

(define (palindrome l)
  (local ((define (p/a l0 s)
            (cond
              [(empty? l0) (append (reverse (rest (reverse l))) s)]
              [else (p/a (rest l0) (cons (first l0) s))])))
    (p/a l '())))


; Exercise 503
; Matrix -> Matrix
; rotates a Matrix until the first
; coefficient of the first row differs from 0
(check-expect (rotate* '((0 4 5) (1 2 3)))
              '((1 2 3) (0 4 5)))
(check-expect (rotate.v2 '((0 4 5) (1 2 3)))
              '((1 2 3) (0 4 5)))

(define (rotate* M)
  (cond
    [(not (= (first (first M)) 0)) M]
    [(andmap (lambda (t) (= (first t) 0)) M)
     (error "all rows start with 0")]
    [else
     (rotate* (append (rest M) (list (first M))))]))

(define (rotate.v2 M0)
  (local (; Matrix ... -> Matrix 
          ; accumulator ...
          (define (rotate/a M seen)
            (cond
              [(empty? M) seen] ; Can this be simplified to (empty? M)
              [else (rotate/a (rest M)
                              (cons (first M) seen))])))
    (rotate/a M0 '())))


; Exercise 504
; [List-of Number] -> Number
; produces corresponding number
(check-expect (to10 '(1 0 2)) 102)

(define (to10 ld)
  (local ((define (to10/a l d e)
            (cond
              [(empty? l) d]
              [else (to10/a (rest l)
                            (+ (* (first l) (expt 10 e)) d)
                            (sub1 e))])))
    (to10/a ld 0 (sub1 (length ld)))))


; Exercise 505
; N [>=1] -> Boolean
; whether number is prime
(check-expect (is-prime? 3) #true)
(check-expect (is-prime? 6) #false)

(define (is-prime? n)
  (local ((define (is-prime/a s r)
            (cond
              [(= r 1) #true]
              [else (and
                     (not (= (remainder s r) 0))
                     (is-prime/a s (sub1 r)))])))
    (is-prime/a n (sub1 n))))


; Exercise 506
; accumulator-style version of map
(check-expect (map/a add1 '(1 2 3)) '(4 3 2))

(define (map/a f l)
  (local ((define (h/a f* l* seen)
            (cond
              [(empty? l*) seen]
              [else (h/a f*
                         (rest l*)
                         (cons (f (first l*)) seen))])))
    (h/a f l '())))
