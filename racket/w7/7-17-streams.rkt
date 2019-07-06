#lang racket

(provide (all-defined-out))

; 1 1 1 1 ......
(define ones (λ () (cons 1 ones)))

; 1 2 3 4 ....
(define (f x) (cons x (λ () (f (+ x 1)))))
(define nats (λ () (f 1)))

; 2 4 8 16 ...
(define powers-of-two
  (letrec ([f (λ (x) (cons x (λ () (f (* x 2)))))])
    (λ () (f 1))))

(define
  (stream-maker fn args)
  (letrec ([f (λ (x) (cons x (λ () (f (fn x args)))))])
    (λ () (f 1))))

(define powers-of-two-2 (stream-maker * 2))
(define nats-2 (stream-maker + 1))

(define (number-until stream tester)
  (letrec ([f (λ (stream ans)
             (let ([pr (stream)])
               (if (tester (car pr))
                   ans
                   (f (cdr pr) (+ ans 1)))))])
    (f stream 1)))

(number-until
 powers-of-two-2 (λ (x) (> x 30)))
