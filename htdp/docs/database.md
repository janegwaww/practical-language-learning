

# database

    ;; The first three lines of this file were inserted by DrRacket. They record metadata
    ;; about the language level of this file in a form that our tools can easily process.
    #reader(lib "htdp-intermediate-lambda-reader.ss" "lang")((modname database) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp") (lib "web-io.rkt" "teachpack" "2htdp") (lib "dir.rkt" "teachpack" "htdp")) #f)))
    (define-struct db [schema content])
    ; A DB is a structure: (make-db Schema Content)
    
    ; A Schema is a [List-of Spec]
    ; A Spec is a [List Label Predicate]
    ; A Label is a String
    ; A Predicate is a [Any -> Boolean]
    
    ; A (piece of) Content is a [List-of Row]
    ; A Row is a [List-of Cell]
    ; A Cell is Any
    ; constraint cells do not contain functions 
    
    ; integrity constraint In (make-db sch con), 
    ; for every row in con,
    ; (I1) its length is the same as sch's, and
    ; (I2) its ith Cell satisfies the ith Predicate in sch
    
    (define-struct spec [label predicate])
    ; Spec is a structure: (make-spec Label Predicate)
    
    (define db1 (make-db (list (list "Name" string?)
                               (list "Age" integer?)
                               (list "Present" boolean?))
             '(("Alice" 35 #true) ("Bob" 25 #false))))
    
    (make-db '((make-spec "Name" String?)
               (make-spec "Age" Integer)
               (make-spec "Present" Boolean))
             '(("Alice" 35 #true) ("Bob" 25 #false)))
    
    ; Exercise 404
    ; f [List-of N][List-of N] -> Boolean
    ; comparision two values from two list
    (check-expect (andmap2 (lambda(s c) [(second s) c])
                           (list (list "name" string?) (list "age" number?)) '("a" 1))
                  #true)
    
    (define (andmap2 f l1 l2)
      (cond
        [(empty? l1) #true]
        [(cons? l1) (and (f (first l1) (first l2))
                         (andmap2 f (rest l1) (rest l2)))]))
    
    ; DB -> Boolean
    ; do all rows in db satisfy (I1) and (I2)
    (check-expect (integrity-check db1) #true)
    
    (define (integrity-check db)
      (local (; Row -> Boolean 
              ; does row satisfy (I1) and (I2) 
              (define (row-integrity-check row)
                (and (= (length row)
                        (length (db-schema db)))
                     (andmap (lambda (s c) [(second s) c])
                             (db-schema db)
                             row))))
        (andmap row-integrity-check (db-content db))))
    
    (define labels '("Name" "Present"))
    
    ; Spec -> Boolean
    ; does this spec belong to the new schema
    (define (keep? c)
      (member? (first c) labels))
    
    ; Row [List-of Label] -> Row
    ; retains those cells whose corresponding element 
    ; in names is also in labels
    (check-expect (row-filter '("Alice" 35 #true) '("Name" "Age" "Present"))
                  '("Alice" #true))
    
    (define (row-filter row names)
      (cond
        [(empty? row) '()]
        [else (if (member? (first names) labels)
                  (cons (first row) (row-filter (rest row) (rest names)))
                  (row-filter (rest row) (rest names)))]))
    
    
    ; Exercise 406
    (define school-schema
      `(("Name"    ,string?)
        ("Age"     ,integer?)
        ("Present" ,boolean?)))
    (define school-content
      `(("Alice" 35 #true)
        ("Bob"   25 #false)
        ("Carol" 30 #true)
        ("Dave"  32 #false)))
    (define school-db
      (make-db school-schema
               school-content))	
    ; DB [List-of Label] -> DB
    ; retains a column from db if its label is in labels
    (define projected-content
      `(("Alice" #true)
        ("Bob"   #false)
        ("Carol" #true)
        ("Dave"  #false)))
    
    (define projected-schema
      `(("Name" ,string?) ("Present" ,boolean?)))
    
    (define projected-db
      (make-db projected-schema projected-content))
    ;  Stop! Read this test carefully. What's wrong?
    (check-expect (db-content (project.v1 school-db '("Name" "Present")))
                  projected-content)
    (define (project.v1 db labels)
      (local ((define schema  (db-schema db))
              (define content (db-content db))
              (define (member*? i) (member? i labels))
    
              ; Spec -> Boolean
              ; does this column belong to the new schema
              (define (keep? c)
                (member*? (first c)))
    
              ; Row -> Row
              ; retains those columns whose name is in labels
              (define (row-project row)
                (row-filter row (map first schema)))
    
              ; Row [List-of Label] -> Row
              ; retains those cells whose name is in labels
              (define (row-filter row names)
                (cond
                  [(empty? names) '()]
                  [else
                   (if (member*? (first names))
                       (cons (first row)
                         (row-filter (rest row) (rest names)))
                       (row-filter (rest row) (rest names)))])))
        (make-db (filter keep? schema)
                 (map row-project content))))

