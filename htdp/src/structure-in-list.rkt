;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-beginner-reader.ss" "lang")((modname structure-in-list) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
; Cons Posn -> Number
; produces the sum of all of its x-coordinates
;(check-expect (sum (cons (make-posn 1 2) (cons (make-posn 3 7) '()))) 4) 

(define (sum lp)
  (cond
    [(empty? lp) 0]
    [else (+ (posn-x (first lp)) (sum (rest lp)))]))



; Cons Posn -> Cons Posn
; consumes list of posns and produces
; list of posns with y-coordinate plus 1
;(check-expect (translate (cons (make-posn 1 2) '())) (cons (make-posn 1 3) '()))

(define (translate lp)
  (cond
    [(empty? lp) '()]
    [else (cons (make-posn (posn-x (first lp)) (+ 1 (posn-y (first lp)))) (rest lp))]))


; Cons Posn -> Cons Posn
; consumes list of posns and produces
; list of posn with x-coordinate between 0 and 100 and y-coordinate between 0 and 200
#|(check-expect (legal.v2 (cons (make-posn 200 300) (cons (make-posn 90 100) '())))
              (cons (make-posn 90 100) '()))|#

(define (legal lp)
  (cond
    [(empty? lp) '()]
    [else  (if (< (posn-x (first lp)) 100) (first lp) (legal (rest lp)))]))

(define (legal.v2 lp)
  (cond
    [(empty? lp) '()]
    [(< (posn-x (first lp)) 100) (first lp)]
    [else (rest lp)]))

(define (legal.v3 lp)
  (cond
    [(empty? (rest lp)) '()]
    [else (if(< (posn-x (first lp)) 100)
           (cons (first lp) (legal.v3 (rest lp)))
           (legal.v3 (rest lp)))]))


 (legal.v3 (cons (make-posn 200 300)
              (cons (make-posn 90 100)
                    (cons (make-posn 80 100)
                          (cons (make-posn 300 80)
                                (cons (make-posn 400 60) '()))))))