;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname two-inputs) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; Exercise 393
; A Son.L is one of: 
; – empty 
; – (cons Number Son.L)
; 
; Son is used when it 
; applies to Son.L and Son.R
		
; A Son.R is one of: 
; – empty 
; – (cons Number Son.R)
; 
; Constraint If s is a Son.R, 
; no number occurs twice in s

; Son.L Son.R -> [List-of Number]
; produces one that contains the elements of both
(check-expect (union '(1 2) '(3 4)) '(1 3 2 4))

(define (union l r)
  (cond
    [(and (empty? l) (empty? r)) '()]
    [(and (cons? l) (empty? r)) l]
    [(and (empty? l) (cons? r)) r]
    [(and (cons? l) (cons? r))
     (cons (first l)
           (cons (first r)
                 (union (rest l) (rest r))))]))

; [List-of Number][List-of Number] -> [List-of Number]
; produces the set of exactly elements occur in both
(check-expect (intersect '(2 3 4) '(3 4 5)) '(3 4))

(define (intersect l r)
  (local ((define (contain? l n)
            (cond [(empty? l) #false]
                  [else (if (= n (first l))
                            #true
                            (contain? (rest l) n))])))
    (cond
      [(and (empty? l) (empty? r)) '()]
      [(and (empty? l) (cons? r)) '()]
      [(and (cons? l) (empty? r)) '()]
      [(and (cons? l) (cons? r))
       (if (contain? r (first l)) (cons (first l) (intersect (rest l) r))
           (intersect (rest l) r))])))

; Exercise 394
; [List-of Number][List-of Number] -> [List-of Number]
; produces a single sorted list of numbers contains all
; numbers on both inputs lists.
(check-expect (merge '(1 4 4) '(3 5)) '(1 3 4 4 5))
(check-expect (merge '(1 4 4 4) '()) '(1 4 4 4))

(define (merge l r) 
  (cond
    [(and (empty? l) (empty? r)) '()]
    [(and (empty? l) (cons? r)) r]
    [(and (cons? l) (empty? r)) l]
    [(and (cons? l) (cons? r)) (sort (union l r) <)]))


; Exercise 395
; produces the first n items from l or
; all of l if it is too short
(check-expect (take '(1 2 3 4) 2) '(1 2))

(define (take l n)
  (cond
    [(empty? l) '()]
    [(= n 0) '()]
    [(> n 0) (cons (first l) (take (rest l) (sub1 n)))]))

