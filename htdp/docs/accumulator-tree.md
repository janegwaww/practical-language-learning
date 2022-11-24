

# accumulator-tree

    ;; The first three lines of this file were inserted by DrRacket. They record metadata
    ;; about the language level of this file in a form that our tools can easily process.
    #reader(lib "htdp-advanced-reader.ss" "lang")((modname accumulator-tree) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #t #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
    (define ex1 '(λ (x) x))
    (define ex2 '(λ (x) y))
    (define ex3 '(λ (y) (λ (x) y)))
    (define ex4 '((λ (x) (x x)) (λ (x) (x x))))
    (define ex5 'a)
    
    ; Exercise 512
    
    ; Lam -> Boolean
    ; variable
    (check-expect (is-var? ex5) #true)
    
    (define (is-var? lam)
      (symbol? lam))
    
    ; Lam -> Boolean
    ; λ expressions
    (check-expect (is-λ? ex1) #true)
    
    (define (is-λ? lam)
      (symbol=? (first lam) 'λ))
    
    ; Lam -> Boolean
    ; applications
    (check-expect (is-app? ex4) #true)
    
    (define (is-app? lam)
      (local ((define fl (first lam))
              (define bool (or (is-var? fl) (is-λ? fl))))
        (cond
          [(empty? (rest lam)) bool]
          [else (and bool (is-app? (rest lam)))])))
    
    
    ; Lam -> Lam
    ; extract the parameter from a λ expression
    (check-expect (λ-para ex1) '(x))
    
    (define (λ-para lam)
      (second lam))
    
    
    ; Lam -> Lam
    ; extracts the body from a λ expression
    (check-expect (λ-body ex2) 'y)
    
    (define (λ-body lam)
      (first (reverse lam)))
    
    
    ; Lam -> Lam
    ; extracts the function from an application
    (check-expect (app-fun ex4) '((λ (x) (x x)) (λ (x) (x x))))
    
    (define (app-fun lam)
      (cond
        [(empty? lam) '()]
        [else (if (is-λ? (first lam))
                  (cons (first lam) (app-fun (rest lam)))
                  (rest lam))]))
    
    
    ; Lam -> Lam
    ; extracts the argument from an application
    (check-expect (app-arg ex4) '((x) (x)))
    
    (define (app-arg lam)
      (local ((define af (app-fun lam))
              (define (app-arg/a l)
                (cond
                  [(empty? l) '()]
                  [else (cons (λ-para (first l))
                              (app-arg/a (rest l)))])))
        (app-arg/a af)))
    
    
    ; Lam -> Lam
    ; produces the list of all symbols
    ; used as λ parameters in a λ term
    (check-expect (declareds ex4) '(x x))
    
    (define (declareds lam)
      (local ((define lp (app-arg lam))
              (define (hd l)
                (cond
                  [(empty? l) '()]
                  [else (append (first l) (hd (rest l)))])))
        (hd lp)))
    
    
    ; Lam -> Lam 
    (define (undeclareds le0)
      (local (; Lam [List-of Symbol] -> Lam
              ; accumulator declareds is a list of all λ 
              ; parameters on the path from le0 to le
              (define (undeclareds/a le declareds)
                (cond
                  [(is-var? le)
                   (if (member? le declareds) le '*undeclared)]
                  [(is-λ? le)
                   (local ((define para (λ-para le))
                           (define body (λ-body le))
                           (define newd (cons para declareds)))
                     (list 'λ (list para)
                       (undeclareds/a body newd)))]
                  [(is-app? le)
                   (local ((define fun (app-fun le))
                           (define arg (app-arg le)))
                   (list (undeclareds/a fun declareds)
                         (undeclareds/a arg declareds)))])))
        (undeclareds/a le0 '())))
    
    (define ex6 '(λ(x) y))
    (define ex7 '(λ (*undeclared) ((λ (x) (x *undeclared)) y)))
    
    (define-struct pair [left right])
    ; ConsOrEmpty is one of: 
    ; – '()
    ; – (make-pair Any ConsOrEmpty)
    
    ; Any ConsOrEmpty -> ConsOrEmpty
    (define (our-cons a-value a-list)
      (cond
        [(empty? a-list) (make-pair a-value a-list)]
        [(pair? a-list) (make-pair a-value a-list)]
        [else (error "our-cons: ...")]))
    
    ; ConsOrEmpty -> Any
    ; extracts the left part of the given pair
    (define (our-first mimicked-list)
      (if (empty? mimicked-list)
          (error "our-first: ...")
          (pair-left mimicked-list)))
    
    ; ConsOrEmpty -> Any
    ; extracts the right part of the given pair
    (define (our-rest mimcked-list)
      (if (empty? mimicked-list)
          (error "our-rest: ...")
          (pair-right mimicked-list)))

