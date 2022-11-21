;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname refining-interpreters) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
(define-struct add [left right])
(define-struct mul [left right])
(define-struct or* [left right])
(define-struct and* [left right])
(define-struct not* [left right])

; data definition for add, mul structure type
; Add
; - Number
; - (make-add Add Add)

(make-add 10 -10)
(make-add (make-mul 20 3) 33)
(make-add (make-mul 3.14 (make-mul 2 3)) (make-mul 3.14 (make-mul -1 -9)))

(+ -1 2)
(+ (* 20 3) 33)
(* (+ 1 (* 2 3)) 3.14)



(define (eval-express be)
  (cond
    [(add? be) (+ (add-left be) (add-right be))]
    [(mul? be) (* (mul-left be) (mul-right be))]
    [else (error "wrong")]))

(define (eval-bool-expression bl)
  (cond
    [(or*? bl) (or (or*-left bl) (or*-right))]
    [(and*? bl) (and (and*-left bl) (and*-right))]
    [(not*? bl) (not (not*-left bl) (not*-right))]
    [else (error WRONG)]))


(define (atom? a)
  (or
    (number? a)
    (string? a)
    (symbol? a)))
(define WRONG "error")

; S-expr -> BSL-expr

(check-satisfied (parse '(+ 1 1)) (check-parse '(+ 1 1)))

(define (parse s)
  (cond
    [(atom? s) (parse-atom s)]
    [else (parse-sl s)]))
 
; SL -> BSL-expr 
(define (parse-sl s)
  (local ((define L (length s)))
    (cond
      [(< L 3) (error WRONG)]
      [(and (= L 3) (symbol? (first s)))
       (cond
         [(symbol=? (first s) '+)
          (make-add (parse (second s)) (parse (third s)))]
         [(symbol=? (first s) '*)
          (make-mul (parse (second s)) (parse (third s)))]
         [else (error WRONG)])]
      [else (error WRONG)])))
 
; Atom -> BSL-expr 
(define (parse-atom s)
  (cond
    [(number? s) s]
    [(string? s) (error WRONG)]
    [(symbol? s) (error WRONG)]))

; S-expr -> Boolean
(define (check-parse s)
  (lambda (se)
    (local ((define (spring l) '())
            (define (list=? l r)
              (and (symbol=? (first l) (first r))
                   (list=? (rest l) (rest r)))))
      (list=? (spring se) s))))