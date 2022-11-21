;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname number-integration) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(define ε 0.1)

; Exercise 458
; [Number -> Number] Number Number -> Number
; computes the area under the graph of f between a and b
; assume (< a b) holds 
 
(check-within (integrate-kepler (lambda (x) 20) 12 22) 200 ε)
(check-within (integrate-kepler (lambda (x) (* 2 x)) 0 10) 100 ε)
#|(check-within (integrate-kepler (lambda (x) (* 3 (sqr x))) 0 10)
              1000
              ε)|#
 
(define (integrate-kepler f a b)
  (local ((define middle (mid a b)))
    (+ (trapezoids f a middle)
       (trapezoids f middle b))))


; Number Number -> Number
; produces mid value
(check-expect (mid 2 4) 3)

(define (mid a b) (/ (+ a b) 2))


; [Number -> Number] Number Number -> Number
; compute the areas of trapezoids
(check-expect (trapezoids (lambda (x) (+ 2 x)) 0 3) 10.5) 

(define (trapezoids f l r)
  (if (> r l)
      (* (/ 1 2) (- r l) (+ (f l) (f r)))
      (error "value not right")))


(define ε2 0.01)
; Exercise 459
; [Number -> Number] Number Number -> Number
; computes the area under the graph of f between a and b
; assume (< a b) holds
(check-within (integrate (lambda (x) 20) 12 22) 200 ε2)
(check-within (integrate (lambda (x) (* 2 x)) 0 10) 100 ε2)
(check-within (integrate (lambda (x) (* 3 (sqr x))) 0 10)
              1000
              ε2)

(define (integrate f a b)
  (local (; width of each rectangle
          (define w (/ (- b a) R))
          ; height of one of rectangles
          (define s (/ w 2))
          ; area of one rectangle
          (define (area f r)          
            (* w (f (+ a (* (- r 1) w) s))))
          (define (iterate r)
            (cond
              [(= r 0) (area f r)]
              [else (+ (area f r) (iterate (sub1 r)))])))
    (iterate R)))

; number of rectangles
(define R 20000)


; Exercise 460
; [Number -> Number] Number Number -> Number
; use divide-and-conquer strategy
(define (integrate-dc f a b)
  (cond
    [(<= (- b a) ε) ()]))