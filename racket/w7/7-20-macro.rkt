#lang racket

(define (my-force th)
  (if (mcar th)
      (mcdr th)
      (begin (set-mcar! th #t)
            (set-mcdr! th ((mcdr th)))
            (mcdr th))))

(define-syntax my-if
  (syntax-rules (then else)
    [(my-if e1 then e2 else e3)
     (if e1 e2 e3)]))

(define seven (my-if #t then 7 else 14))

(define-syntax comment-out
  (syntax-rules ()
    [(comment-out ignore instead) instead]))

(define no-problem (comment-out (car nul) #f))

(define-syntax my-delay
  (syntax-rules ()
    [(my-delay e)
     (mcons #f (lambda () e))]))

(define p (my-delay (begin (print "hi") (* 3 4))))

(define-syntax for
  (syntax-rules (to do)
    [(for lo to hi do body)
     (let ([l lo]
           [h hi])
       (letrec ([loop (lambda (it)
                        (if (> it h)
                            #t
                            (begin body (loop (+ it 1)))))])
         (loop l)))]))

;; (for 5 to 9 do (print 1))

(define-syntax let2
  (syntax-rules ()
    [(let2 () body)
     body]
    [(let2 (var val) body)
     (let ([var val] body))]
    [(let2 (var1 val1 var2 val2) body)
     (let ([var1 val1])
       (let ([var2 val2]) body))]))

; (let2 (x 1 y 2) (+ x y))

(define-syntax my-let*
  (syntax-rules ()
    [(my-let* () body) body]
    [(my-let* ([var0 val0]
               [var-rest val-res] ...)
              body)
     (let ([var0 val0])
       (my-let* ([var-rest val-rest] ...)
                body))]))
