;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname recursion-ignores-structure) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(check-expect (largers* '(3 5 2 5 2 5 6 3 2 4) 3) '(3 5 5 5 6 3 4))

(define (largers* l n)
  (cond
    [(empty? l) '()]
    [else (if (>= (first l) n)
              (cons (first l) (largers* (rest l) n))
              (largers* (rest l) n))]))

; [List-of Number] -> [List-of Number]
; produces a sorted version of alon
; assume the numbers are all distinct 
(define (quick-sort< alon)
  (cond
    [(empty? alon) '()]
    [else (local ((define pivot (first alon)))
            (append (quick-sort< (smallers alon pivot))
                    (list pivot)
                    (quick-sort< (largers alon pivot))))]))

; Exercise 426
(define (quick-sort<.v2 alon)
  (cond
    [(empty? alon) '()]
    [(empty? (rest alon)) alon]
    [else (local ((define pivot (first alon)))
            (append (quick-sort<.v2 (smallers alon pivot))
                    (list pivot)
                    (quick-sort<.v2 (largers alon pivot))))]))

; Exercise 427
(define (quick-sort<.v3 alon)
  (cond
    [(empty? alon) '()]
    [(empty? (rest alon)) alon]
    [else (local ((define pivot (first alon))
                  (define length* (length alon)))
            (if (< length* 3)
                (sort alon <)
                (append (quick-sort<.v3 (smallers alon pivot))
                        (list pivot)
                        (quick-sort<.v3 (largers alon pivot)))))]))

; Exercise 428
(define (quick-sort<.v4 alon)
  (cond
    [(empty? alon) '()]
    [else (local ((define pivot (first alon)))
            (append (quick-sort<.v4 (smallers alon pivot))
                    (list pivot)
                    (quick-sort<.v4 (largers.v2 (rest alon) pivot))))]))

; Exercise 429
(define (quick-sort<.v5 alon)
  (cond
    [(empty? alon) '()]
    [else (local ((define pivot (first alon)))
            (append (quick-sort<.v5 (smallers.v2 alon pivot))
                    (list pivot)
                    (quick-sort<.v5 (largers.v3 (rest alon) pivot))))]))

; Exercise 430
(define (quick-sort<.v6 alon)
  (cond
    [(empty? alon) '()]
    [else (local ((define pivot (first alon))
                  (define (compar f)
                    (cond                                       
                      [(symbol=? 'small f) (smallers.v2 alon pivot)]
                      [(symbol=? 'larger f) (largers.v3 alon pivot)])))
            (append (quick-sort<.v6 (compar 'small))
                    (list pivot)
                    (quick-sort<.v6 (compar 'larger))))]))
 
; [List-of Number] Number -> [List-of Number]
; produces the list elements larger than n
(define (largers alon n)
  (cond
    [(empty? alon) '()]
    [else (if (> (first alon) n)
              (cons (first alon) (largers (rest alon) n))
              (largers (rest alon) n))]))

; Exercise 428
(define (largers.v2 alon n)
  (cond
    [(empty? alon) '()]
    [else (if (>= (first alon) n)
              (cons (first alon) (largers (rest alon) n))
              (largers (rest alon) n))]))

; Exercise 429
(define (largers.v3 alon n)
  (filter (lambda (i) (> i n)) alon))
 
; [List-of Number] Number -> [List-of Number]
; produces the list elements smallers than n
(define (smallers alon n)
  (cond
    [(empty? alon) '()]
    [else (if (< (first alon) n)
              (cons (first alon) (smallers (rest alon) n))
              (smallers (rest alon) n))]))

; Exercise 429
(define (smallers.v2 alon n)
  (filter (lambda (i) (< i n)) alon))

;(quick-sort< (list 11 8 14 7))
;(quick-sort<.v6 '(1 4 2 5 6 3 6 4 1))
;(quick-sort< (list 10 6 8 9 14 12 3 11 14 16 2))
(quick-sort< (list 1 2 3 4 5 6 7 8 9 10 11 12 13 14))