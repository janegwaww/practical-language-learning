;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname natural-number) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; N String -> List-of-strings 
; creates a list of n copies of s
 
(check-expect (copier 0 "hello") '())
(check-expect (copier 2 "hello")
              (cons "hello" (cons "hello" '())))
;(check-expect (copier 0.1 "x") '())

(check-expect (copier.v2 0 "hello") '())
(check-expect (copier.v2 2 "hello")
              (cons "hello" (cons "hello" '())))
;(check-expect (copier.v2 0.1 "x") '())

 
(define (copier n s)
  (cond
    [(zero? n) '()]
    [(positive? n) (cons s (copier (sub1 n) s))]))

(define (copier.v2 n s)
  (cond
    [(zero? n) '()]
    [else (cons s (copier.v2 (sub1 n) s))]))

; N -> Number
; computes (+ n pi) without using +
 
(check-within (add-to-pi 3) (+ 3 pi) 0.001)
(check-expect (sum (cons 1 (cons 2 '()))) 3)
 
(define (add-to-pi n)
  (cond
    [(zero? n) pi]
    [(positive? n) (+ 1 (add-to-pi (sub1 n)))]))

(define (sum l)
  (cond
    [(empty? l) 0]
    [(cons? l) (+ (first l) (sum (rest l)))]))

; N x -> Number
; comsumes a natural number n and multiplies it with a number x without using *

(check-expect (multiply 3 4) (* 3 4))

(define (multiply n x)
  (cond
    [(zero? n) 0]
    [(positive? n) (+ x (multiply (sub1 n) x))]))


(define cimg (rectangle 10 10 "outline" "black"))
; Number Image -> Image
; produces a column of n copies of img
(define (col n img)
  (cond
    [(zero? n) img]
    [(positive? n) (beside img (col (sub1 n) img))]))

; N Image -> Image
; produces a row of n copies of img
(define (row n img)
  (cond
    [(zero? n) img]
    [(positive? n) (above img (row (sub1 n) img))]))

; Image -> Image
(define plain
  (overlay (col 7 (row 17 cimg)) (empty-scene 80 180)))

(define (dot posn)
  (place-image (circle 5 "solid" "red") (posn-x posn) (posn-y posn) plain))


