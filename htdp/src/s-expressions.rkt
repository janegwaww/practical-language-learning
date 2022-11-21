;; The first three lines of this file were inserted by DrRacket. They record metadata
;; about the language level of this file in a form that our tools can easily process.
#reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname s-expressions) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp")) #f)))
; An Atom is one of: 
; – Number
; – String
; – Symbol

(define (atom? a)
  (or
    (number? a)
    (string? a)
    (symbol? a)))

(check-expect (count 'world 'hello) 0)
(check-expect (count '(world hello) 'hello) 1)
(check-expect (count '(((world) hello) hello) 'hello) 2)

; S-expr Symbol -> N 
; counts all occurrences of sy in sexp 
(define (count sexp sy)
 (local (
         ; SL -> N 
         ; counts all occurrences of sy in sl 
         (define (count-sl sl)
           (cond
             [(empty? sl) 0]
             [else
              (+ (count (first sl) sy) (count-sl (rest sl)))]))
         ; Atom -> N 
         ; counts all occurrences of sy in at 
         (define (count-atom at)
           (cond
             [(number? at) 0]
             [(string? at) 0]
             [(symbol? at) (if (symbol=? at sy) 1 0)])))
   (cond
     [(atom? sexp) (count-atom sexp)]
     [else (count-sl sexp)])))
 

; S-expr -> Number
; determines s-expression's depth
(define (depth se)
  (cond
    [(atom? se) 1]
    [else (local ((define (help sl)
                    (cond
                      [(empty? sl) 0]
                      [else (+ 1 (help (rest sl)))])))
            (help se))]))



(define-struct no-info [])
(define NONE (make-no-info))
 
(define-struct node [ssn name left right])
; A BT (short for BinaryTree) is one of:
; – NONE
; – (make-node Number Symbol BT BT)

; BT Number -> Boolean
; a given number occurs in some given BT

(check-expect (contains-bt? (make-node 15 'd NONE (make-node 24 'i NONE NONE)) 24) #true) 

(define (contains-bt? bt n)
  (cond
    [(no-info? bt) #false]
    [else (or (= (node-ssn bt) n)
              (contains-bt? (node-left bt) n)
              (contains-bt? (node-right bt) n) )]))

; BT -> [list-of Number]
; produces the sequence of all the ssn numbers
; in the tree

(check-expect (inorder (make-node 15 'd
                                  (make-node 12 's NONE NONE)
                                  (make-node 24 'i NONE NONE))) '(12 15 24))

(define (inorder bt)
  (cond
    [(no-info? bt) '()]
    [else (append           
           (inorder (node-left bt))
           (list (node-ssn bt))
           (inorder (node-right bt)))]))


(check-expect (search-bst (make-node 15 'd
                                  (make-node 12 's NONE NONE)
                                  (make-node 24 'i NONE NONE)) 12) 's)
(define (search-bst bst n)
  (cond
    [(no-info? bst) NONE]
    [else (if (= (node-ssn bst) n)
              (node-name bst)
              (cond
                [(> (node-ssn bst) n) (search-bst (node-left bst) n)]
                [else (search-bst (node-right bst) n)]))]))

; B N S -> B
; produces a BST like B
(define (create-bst B N S)
  (cond
    [(no-info? B) (make-node N S NONE NONE)]
    [else (make-node N S (node-left B) (node-right B))]))

; [list-of [list-of Number Symbol]] -> BST
(define (create-bst-from-list l)
  (cond
    [(empty? l) NONE]
    [else (create-bst (create-bst-from-list (rest l))
                      (first (first l))
                      (second (first l)))]))