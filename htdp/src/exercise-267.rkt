;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname exercise-267) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; [list-of $] -> [list-of €]
; converts a list of $ amounts into a list of € amounts

(check-expect (convert-euro '(1.06 2.12 3.18)) (list 1 2 3))

(define (convert-euro lm)
  (local
    ; Number -> Number
    ; dollar to euro
    ((define (us-to-eu n)
       (/ n 1.06)))
    (map us-to-eu lm)))

; [list-of F] -> [list-of C]
; converts a list of Fahrenheit measurements to a
; list of Celsius measurements

(check-expect (convertFC '(50 41 32)) '(10 5 0))

(define (convertFC fc)
  (local (; f -> c
          ; convert fahrenheit to celsius
          (define (f-to-c n)
            (* (/ 5 9) (- n 32))))
    (map f-to-c fc)))

; [X Y][X -> Y][list-of X] -> [list-of Y]
; translates a list of posns into a list of
; lists of pairs of Number

(check-expect (translate (list (make-posn 1 2) (make-posn 4 5))) (list (list 1 2) (list 4 5)))

(define (translate lp)
  (local (; posn -> [list-of Numbers]
          ; translate posn to a list of numbers
          (define (posn-to-num p) (list (posn-x p) (posn-y p))))
    (map posn-to-num lp)))


; exercise 268
; [mi -> boolean][list-of recored] -> [list-of recored]
; sorts a list of inventory records by the difference
; between the two prices

(check-expect (sort-records (list (make-invent "1" 12) (make-invent "2" 20)))
              (list (make-invent "2" 20) (make-invent "1" 12)))

(define (sort-records r)
  (local (; mi -> boolean
          ; sort record base on prices
          (define (help i1 i2)
            (> (invent-price i1) (invent-price i2))))
    (sort r help)))

(define-struct invent [name price])



; Number [list-of records] -> [list-of records]
; produces a list of all those structures
; that salse price is below ua

(check-expect (eliminate-expensive 100 (list (make-invent "3" 200) (make-invent "4" 89)))
              (list (make-invent "4" 89)))

(define (eliminate-expensive n l)
  (local (; X -> boolean
          ; whether the inventory price greater than 100 
          (define (help i) (< (invent-price i) n)))
    (filter help l)))


(build-list 5 add1)
(build-list 5 +)
(local ((define (domi n) (/ 1 (+ 1 n)))) (build-list 5 domi))