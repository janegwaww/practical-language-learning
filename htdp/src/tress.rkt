;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname tress) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
(define-struct no-parent [])
(define-struct child [father mother name date eyes])
; An FT (short for family tree) is one of: 
; – (make-no-parent)
; – (make-child FT FT String N String)

(define NP (make-no-parent))
; An FT is one of: 
; – NP
; – (make-child FT FT String N String)

; Oldest Generation:
(define Carl (make-child NP NP "Carl" 1926 "green"))
(define Bettina (make-child NP NP "Bettina" 1926 "green"))
 
; Middle Generation:
(define Adam (make-child Carl Bettina "Adam" 1950 "hazel"))
(define Dave (make-child Carl Bettina "Dave" 1955 "black"))
(define Eva (make-child Carl Bettina "Eva" 1965 "blue"))
(define Fred (make-child NP NP "Fred" 1966 "pink"))
 
; Youngest Generation: 
(define Gustav (make-child Fred Eva "Gustav" 1988 "brown"))


; Exercise 310
; FT -> Number
; counts the child structures in the tree

(check-expect (count-persons Gustav) 5)
(check-expect (count-persons Fred) 1)

(define (count-persons f)
  (cond
    [(no-parent? f) 0]
    [else (+ 1 (count-persons (child-father f)) (count-persons (child-mother f)))]))

; Exercise 311
; FT Number -> Number
; the average age of all child structures
; in the family tree

(check-expect (average-age Fred 2000) 34)
(check-expect (average-age Gustav 2000) 45.8)

(define (average-age ft year)
  (local (; FT -> Number
          (define (total ft)
            (cond
              [(no-parent? ft) 0]
              [else (+ (- year (child-date ft)) (total (child-father ft)) (total (child-mother ft)))])))
   (/ (total ft) (count-persons ft))))


; FT -> Boolean
; proper ancestor has blue eyes

(check-expect (blue-eyed-ancestor? Eva) #false)
(check-expect (blue-eyed-ancestor? Gustav) #true)

(define (blue-eyed-ancestor? an-ftree)
  (cond
    [(and (no-parent? (child-mother an-ftree))
          (no-parent? (child-father an-ftree))) #false]
    [else
     (or
      (string=? (child-eyes (child-mother an-ftree)) "blue")
      (string=? (child-eyes (child-father an-ftree)) "blue")
       (blue-eyed-ancestor?
         (child-father an-ftree))
       (blue-eyed-ancestor?
         (child-mother an-ftree)))]))