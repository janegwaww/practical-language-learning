;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname not-empty-llist) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; A List-of-temperatures is one of: 
; – '()
; – (cons CTemperature List-of-temperatures)
 
(define ABSOLUTE0 -272)
; A CTemperature is a Number greater than ABSOLUTE0.

; List-of-temperatures -> Number
; computes the average temperature 
(define (average alot)
  (/ (sum alot) (how-many alot)))

; List-of-temperatures -> Number 
; adds up the temperatures on the given list 
(define (sum ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (+ (first ne-l) (sum (rest ne-l)))]))

; List-of-temperatures -> Number 
; counts the temperatures on the given list
(check-expect (how-many (cons 1 (cons 2 '()))) 2)

(define (how-many ne-l)
  (cond
    [(empty? (rest ne-l)) (first ne-l)]
    [else (+ (first ne-l) 1)]))

; loi -> loi
; produces an informative error message when it is applied to '()
(define (checked-average loi)
  (if(empty? loi)
     (error "can not applied to empty list")
     loi))


; List-of-temperatures -> Number
; produces #true if the temperatures are sorted in descending order

(check-expect (sorted>? (cons 1 (cons 2 '()))) #false)
(check-expect (sorted>? (cons 3 (cons 2 '()))) #true)

(define (sorted>? ne-l)
  (cond
    [(empty? (rest ne-l)) #true]
    [else (cond
            [(< (first ne-l) (first (rest ne-l))) #false]
            [else (sorted>? (rest ne-l))])]))
