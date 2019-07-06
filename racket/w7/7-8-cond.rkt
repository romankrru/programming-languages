#lang racket

(provide (all-defined-out))

(define l1 (list 5 1 2 (list 3 4 (list 4 5)) 2 1))

(define (sum3 xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum3 (cdr xs)))]
        [#t (+ (sum3 (car xs)) (sum3 (cdr xs)))]))

(define (sum4 xs)
  (cond [(null? xs) 0]
        [(number? (car xs)) (+ (car xs) (sum4 (cdr xs)))]
        [(list? (car xs)) (+ (sum4 (car xs)) (sum4 (cdr xs)))]
        [#t (sum3 (cdr xs))]))

(define (count-falses xs)
  (cond [(null? xs) 0]
        [(car xs) (count-falses (cdr xs))]
        [#t (+ 1 (count-falses (cdr xs)))]))

(count-falses (list 1 2 #f 3 #f))
