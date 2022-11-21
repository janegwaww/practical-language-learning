;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname traversing-graphs) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
; Exercise 471
; A Node is a Symbol.
; -- Symbol

; Graph representations
; -- (Node ())
; -- (Node (List-of Node))

(define sample-graph
  '((A (B E))
    (B (E F))
    (C (D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))

; Node Graph -> [List-of Node]
; produces the list of immediate neighbors of n
(check-expect (neighbors 'E sample-graph) '(C F))

(define (neighbors n g)
  (cond
    [(empty? g) '()]
    [else (local ((define f (first g)))
           (if (symbol=? (first f) n)
               (second f)
               (neighbors n (rest g))))]))

; A Path is a [List-of Node].
; interpretation The list of nodes specifies a sequence
; of immediate neighbors that leads from the first 
; Node on the list to the last one. 

; Node Node Graph -> [Maybe Node]
; finds a path from origination to destination in G
; if there is no path, the function produces #false
(check-expect (find-path 'C 'D sample-graph)
              '(C D))
(check-member-of (find-path.v2 'E 'D sample-graph)
                 '(E F D) '(E C D))
(check-expect (find-path 'C 'G sample-graph)
              #false)
(check-member-of (find-path 'A 'G sample-graph) '(A E F G) '(A B F G) '(A B E F G))

(define (find-path origination destination G)
  (cond
    [(symbol=? origination destination) (list destination)]
    [else (local ((define next (neighbors origination G))
                  (define candidate
                    (find-path/list next destination G)))
            (cond
              [(boolean? candidate) #false]
              [else (cons origination candidate)]))]))

; Exercise 474
(define (find-path.v2 origination destination G)
  (cond
    [(symbol=? origination destination) (list destination)]
    [else (local ((define (neighbors* n g)
                    (cond
                      [(empty? g) '()]
                      [else (local ((define f (first g)))
                              (if (symbol=? (first f) n)
                                  (second f)
                                  (neighbors* n (rest g))))]))
                  (define (find-path/list* lo-Os D G)
                    (cond
                      [(empty? lo-Os) #false]
                      [else (local ((define candidate
                                      (find-path (first lo-Os) D G)))
                              (cond
                                [(boolean? candidate)
                                 (find-path/list* (rest lo-Os) D G)]
                                [else candidate]))]))
                  (define next (neighbors origination G))
                  (define candidate
                    (find-path/list* next destination G)))
            (cond
              [(boolean? candidate) #false]
              [else (cons origination candidate)]))]))

; [List-of Node] Node Graph -> [Maybe Path]
; finds a path from some node on lo-originations to
; destination; otherwise, it produces #false
(define (find-path/list lo-Os D G)
  (cond
    [(empty? lo-Os) #false]
    [else (local ((define candidate
                    (find-path (first lo-Os) D G)))
            (cond
              [(boolean? candidate)
               (find-path/list (rest lo-Os) D G)]
              [else candidate]))]))

; Exercise 472
; Graph -> Boolean
(check-expect (test-on-all-nodes sample-graph) #true)

(define (test-on-all-nodes G) #false)


(define cyclic-graph
  '((A (B E))
    (B (E F))
    (C (B D))
    (D ())
    (E (C F))
    (F (D G))
    (G ())))
