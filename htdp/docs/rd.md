

# rd

    ;; The first three lines of this file were inserted by DrRacket. They record metadata
    ;; about the language level of this file in a form that our tools can easily process.
    #reader(lib "htdp-beginner-reader.ss" "lang")((modname rd) (read-case-sensitive #t) (teachpacks ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp"))) (htdp-settings #(#t constructor repeating-decimal #f #t none #f ((lib "image.rkt" "teachpack" "2htdp") (lib "universe.rkt" "teachpack" "2htdp") (lib "batch-io.rkt" "teachpack" "2htdp")) #f)))
    (define-struct layer [color doll])
    
    ; RD -> Number
    ; how many dolls are a part of an-rd
    
    (check-expect (depth "red") 1)
    (check-expect
      (depth
       (make-layer "yellow" (make-layer "green" "red")))
      3)
    
    (define (depth an-rd)
      (cond
        [(string? an-rd) 1]
        [else (+ (depth (layer-doll an-rd)) 1)]))
    
    
    ; RD -> String
    ; string of all colors of a Russian doll
    
    (check-expect
      (depth
       (make-layer "yellow" (make-layer "green" "red")))
      3)
    
    (define (colors an-rd)
      (cond
        [(string? an-rd) an-rd]
        [else (string-append (layer-color an-rd) ", " (colors (layer-doll an-rd)))]))

