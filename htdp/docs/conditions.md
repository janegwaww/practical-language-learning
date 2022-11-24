

# conditions

    ;; The first three lines of this file were inserted by DrRacket. They record metadata
    ;; about the language level of this file in a form that our tools can easily process.
    #reader(lib "htdp-beginner-reader.ss" "lang")((modname conditions) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
    ; Any -> Number
    ; computes the area of a disk with radius v, 
    ; if v is a number
    (define (checked-area-of-disk v)
      (cond
        [(and (number? v) (> v 0)) (area-of-disk v)]
        [else (error "area-of-disk: number expected")]))
    
    ; Any -> vec
    ; check expect
    (define (check-make-vec vec)
      (cond
        [(and (> vex-x 0) (> vex-y 0)) vec]
        [else (error "make-vec: number expected")]))
    
    (define (missile-or-not? v)
      (cond
        [(or (false? v) (posn? v)) #true]
        [else #false]))
    
    (define (check-sigs s)
      (cond
        [(and (number? s-pre) (number? s-post)) s]
        [else (error "error")]))
    
    
    (define (light=? a-value another-value)
      (if (and (light? a-value) (light? another-value))
          (string=? a-value another-value)
          (error (cond
                   [(boolean=? (light? a-value) #false) (string-append a-value MESSAGE)]
                   [(boolean=? (light? another-value) #false) (string-append another-value MESSAGE)]
                   [(boolean=? (light? a-value) (light? another) #false) (string-append a-value another-value MESSAGE)]
                   ))))

