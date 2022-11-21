;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname interpreting-functions) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; A BSL-var-expr is one of: 
; – Number
; – Symbol 
; – (make-add BSL-var-expr BSL-var-expr)
; – (make-mul BSL-var-expr BSL-var-expr)

; A BSL-fun-expr is one of:
; - Number
; - Symbol
; - (make-var Symbol BSL-fun-expr)
; – (make-add BSL-fun-expr BSL-fun-expr)
; – (make-mul BSL-fun-expr BSL-fun-expr)
; - (make-fun Symbol (list-of Symbol) BSL-fun-expr)

(define-struct add [left right])
(define-struct mul [left right])
(define-struct or* [left right])
(define-struct and* [left right])
(define-struct not* [left right])
(define-struct var [name content])
(define-struct fun [name param content])

; BSL-var-expr Symbol Number -> BSL-var-expr

(define x 2)
(check-expect (subst '(+ 1 x) 'x x) (list '+ 1 x))

(define (subst bsl s n)
  (cond
    [(empty? bsl) '()]
    [else (cons (if (and (symbol? (first bsl)) (symbol=? (first bsl) s))
                    n
                    (first bsl))
                (subst (rest bsl) s n))]))

(make-fun 'f '(x) (make-add 3 'x))
(make-fun 'g '(y) (make-var 'f (make-mul 2 'y)))
(make-fun 'h '(v) (make-add (make-var 'f 'v) (make-var 'g 'v)))
 

(make-var 'k (make-add 1 1))
(make-mul 5 (make-var 'k (make-add 1 1)))
(make-mul (make-var 'i 5) (make-var 'k (make-add 1 1)))


; BSL-fun-expr Symbol Symbol BSL-fun-expr -> BSL-fun-expr
; determines the value of ex
(define (eval-definition1 ex f x b)
  (local ((define value (eval-definition1 ex f x b))
          (define plugd (subst b x value)))
    (eval-definition1 plugd f x b)))


; BSL-fun-def* Symbol -> BSL-fun-def
; retrieves the definition of f in da
; signals an error if there is none
(define g 5)
(define da-fgh (list (list 'f 4) (list 'g 5) (list 'h 3)))
(check-expect (lookup-def da-fgh 'g) g)

(define (lookup-def da f)
  (if (and (cons? (assq f da)) (number? (second (assq f da))))
      (second (assq f da))
      #false))

; BSL-fun-expr da BSL-fun-def -> Number
; evaluation bsl func expression
(check-expect (eval-function* '(define (f g) (+ 5 g))) 6)

(define (eval-function* ex da bfd)
  (...ex...da...bfd...))