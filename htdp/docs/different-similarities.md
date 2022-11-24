

# different-similarities

    ;; The first three lines of this file were inserted by DrRacket. They record metadata
    ;; about the language level of this file in a form that our tools can easily process.
    #reader(lib "htdp-intermediate-reader.ss" "lang")((modname different-similarities) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
    ; Lon -> Lon
    ; adds 1 to each item on l
    (define (add1* l)
      (rule l a1))
    (define (a1 n) (add1 n))
    
    ; Lon -> Lon
    ; adds 5 to each item on l
    (define (plus5 l)
      (rule l p5))
    (define (p5 n) (+ n 5))
    
    
    ; Lon -> Lon
    ; subtracts 2 to each item on l
    (define (sub2 l)
      (rule l s2))
    (define (s2 n) (- n 2))
    
    (define (rule l f)
      (cond
        [(empty? l) '()]
        [else
         (cons
           (f (first l))
           (rule (rest l) f))]))
    
    (define (extract R l t)
      (cond
        [(empty? l) '()]
        [else (cond
                [(R (first l) t)
                 (cons (first l)
                       (extract R (rest l) t))]
                [else
                 (extract R (rest l) t)])]))
    
    ; Number Number -> Boolean
    ; is the area of a square with side x larger than c
    (define (squared>? x c)
      (> (* x x) c))

