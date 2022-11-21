;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname newton) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; [Number -> Number] Number -> Number
; translate slope formula into code
(define (slope f n)
  (* (/ 1 (* 2 ε)) (- (f (+ n ε)) (f (- n ε)))))

(define ε 0.001)

; [Number -> Number] Number -> Number
; maps f and r1 to the root of the tangent
(define (root-of-tangent f r)
  (- r (/ (f r) (slope f r))))


; Number -> Number
(define (poly x) (* (- x 2) (- x 4)))

; [Number -> Number] Number -> Number
; finds a number r such that (f r) is small
; generative repeatedly generates improved guesses
(check-within (newton poly 1) 2 ε)
(check-within (newton poly 3.5) 4 ε)
 
(define (newton f r1)
  (cond
    [(<= (abs (f r1)) ε) r1]
    [else (newton f (root-of-tangent f r1))]))



; Exercise 457
; computes how many months it takes
; to double a given amount of money
; generative recursive terminate when
; money incress to double
(check-expect (double-amount 100) 9)

(define (double-amount money)
  (local ((define (help m n)
            (cond
              [(>= m (* 2 money)) n]
              [else (help (+ m (month-pay m)) (add1 n))])))
    (help money 1)))

(define rate 0.1)
(define (month-pay m) (* m rate))