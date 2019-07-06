#lang racket

(provide (all-defined-out))

(define (slow-add x y)
  (letrec ([slow-id (λ (y z)
                      (if (= 0 z)
                          y
                          (slow-id y (- z 1))))])
    (+ (slow-id x 500000000) y)))

(define (my-mult x y-thunk)
  (cond [(= x 0) 0]
        [(= x 1) (y-thunk)]
        [#t (+ (y-thunk) (my-mult (- x 1) y-thunk))]))

; (my-mult 3 (λ () (slow-add 3 4)))
; (my-mult 50 (let ([x (slow-add 4 3)]) (λ () x)))

(define (my-delay th)
  (mcons #f th))

(define (my-force p)
  (if (mcar p)
      (mcdr p)
      (begin (set-mcar! p #t)
             (set-mcdr! p ((mcdr p)))
             (mcdr p))))

(my-mult 35 (let ([p (my-delay (λ () (slow-add 5 6)))])
             (λ () (my-force p))))

