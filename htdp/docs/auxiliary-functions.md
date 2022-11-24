

# auxiliary-functions

    ;; The first three lines of this file were inserted by DrRacket. They record metadata
    ;; about the language level of this file in a form that our tools can easily process.
    #reader(lib "htdp-beginner-abbr-reader.ss" "lang")((modname auxiliary-functions) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
    ; List-of-numbers -> List-of-numbers 
    ; rearranges alon in descending order
    
    (check-expect (sort> '()) '())
    (check-expect (sort> (list 3 2 1)) (list 3 2 1))
    (check-expect (sort> (list 1 2 3)) (list 3 2 1))
    (check-expect (sort> (list 12 20 -5))
                  (list 20 12 -5))
    
    (define (sort> l)
      (cond
        [(empty? l) '()]
        [(cons? l) (insert (first l) (sort> (rest l)))]))
    
    ; Number List-of-numbers -> List-of-numbers
    ; inserts n into the sorted list of numbers alon
    (define (insert n l)
      (cond
        [(empty? l) (cons n '())]
        [else (if (>= n (first l))
                  (cons n l)
                  (cons (first l) (insert n (rest l))))]))
    
    (define (sorted>? ne-l)
      (cond
        [(empty? (rest ne-l)) #true]
        [else (cond
                [(< (first ne-l) (first (rest ne-l))) #false]
                [else (sorted>? (rest ne-l))])]))
    
    (check-satisfied (sort> (list 12 20 -5)) sorted>?)
    
    
    (define-struct gp [name score])
    ; A GamePlayer is a structure: 
    ;    (make-gp String Number)
    ; interpretation (make-gp p s) represents player p who 
    ; scored a maximum of s points
    
    ; sorts lists of game players by score
    
    (check-expect (score (list (make-gp "n" 123) (make-gp "l" 321)))
                  (list (make-gp "l" 321) (make-gp "n" 123)))
    
    (define (score l)
      (cond
        [(empty? l) '()]
        [(cons? l) (sorting (first l) (score (rest l)))]))
    
    (define (sorting n l)
      (cond
        [(empty? l) (cons n '())]
        [else (if (>= (gp-score n) (gp-score (first l)))
                  (cons n l)
                  (cons (first l) (sorting n (rest l))))]))

