;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname interpreting-variables) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
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


; BSL-var-expr -> Boolean
; check BSL-var-expr is BSL-expr
(define (numeric? bsl)
  (local ((define (rest-help l)
            (or
             (number? (first l))
             (if (symbol? (first l))
                 (number? (first l))
                 #false)
             (rest-help (rest l)))))
    (cond
      [(empty? bsl) #false]
      [else (and (symbol? (first bsl))
                 (rest-help (rest bsl)))])))