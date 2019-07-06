#lang racket

(provide (all-defined-out))

(define xs (list 4 5 6))
(define ys (list (list 4 5 6 (list 2 3))
                 1 2
                 (list 2 3 5)
                 8 9 2))

(define (sum1 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum1 (cdr xs)))
          (+ (sum1 (car xs)) (sum1 (cdr xs))))))

(define (sum2 xs)
  (if (null? xs)
      0
      (if (number? (car xs))
          (+ (car xs) (sum2 (cdr xs)))
          (if (list? (car xs))
              (+ (sum2 (car xs)) (sum2 (cdr xs)))
              (sum2 (cdr xs))))))

(sum2 (list 1 2 3 (list 1 2 "hi")))
