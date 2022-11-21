;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname binary-search) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; [Number -> Number] Number Number -> Number
; determines R such that f has a root in [R,(+ R ε)]
; assume f is continuous 
; (2) (or (<= (f left) 0 (f right)) (<= (f right) 0 (f left)))
; generative divides interval in half, the root is in 
; one of the two halves, picks according to (2)
(check-satisfied (find-root poly 3 6) (lambda (x) (<= (poly x) 0.001)))
(check-satisfied (find-root.v2 poly 3 6) (lambda (x) (<= (poly x) 0.001)))
;(check-satisfied (find-root.v3 poly 3 6) (lambda (x) (<= (poly x) 0.001)))

(define (find-root f left right)
  (cond
    [(<= (- right left) ε) left]
    [else
      (local ((define mid (/ (+ left right) 2))
              (define f@mid (f mid)))
        (cond
          [(or (<= (f left) 0 f@mid) (<= f@mid 0 (f left)))
           (find-root f left mid)]
          [(or (<= f@mid 0 (f right)) (<= (f right) 0 f@mid))
           (find-root f mid right)]))]))

; Exercise 449
(define (find-root.v2 f left right)
  (cond
    [(<= (- right left) ε) left]
    [else
      (local ((define mid (/ (+ left right) 2))
              (define f@mid (f mid))
              (define f-left (f left))
              (define f-right (f right)))
        (cond
          [(or (<= f-left 0 f@mid) (<= f@mid 0 f-left))
           (find-root f left mid)]
          [(or (<= f@mid 0 f-right) (<= f-right 0 f@mid))
           (find-root f mid right)]))]))

; Exercise 449
; help function evaluate (f left) at each stage
(define (find-root.v3 f left right)
  (local ((define (help l r)
            (cond
              [(<= (- r l) ε) l]
              [else
               (local ((define mid (/ (+ l r) 2))
                       (define f@mid (f mid))
                       (define f-left (f l))
                       (define f-right (f r)))
                 (cond
                   [(or (<= f-left 0 f@mid) (<= f@mid 0 f-left))
                    (help f-left mid)]
                   [(or (<= f@mid 0 f-right) (<= f-right 0 f@mid))
                    (help mid f-right)]))]))
          )
    (help left right)))

; Number -> Number
(define (poly x)
  (* (- x 2) (- x 4)))

(define ε 0.001)



; Exercise 451
(define-struct table [length array])
; A Table is a structure:
;   (make-table N [N -> Number])

(define table1 (make-table 3 (lambda (i) i)))
 
; N -> Number
(define (a2 i)
  (if (= i 0)
      pi
      (error "table2 is not defined for i =!= 0")))
 
(define table2 (make-table 1 a2))

; Table N -> Number
; looks up the ith value in array of t
(define (table-ref t i)
  ((table-array t) i))

; T -> Number
; finds the smallest index for a root of the table
(define (find-linear t)
  (local ((define index 0))
    ()))