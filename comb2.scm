(define comb2 (lambda (xs) (comb2-helper xs '{} '{})))

(define comb2-helper
  (lambda (xs hs ret)
    (if (null? xs)
        ret
        (comb2-helper (cdr xs)
                      (append hs `(,(car xs)))
                      (append ret
                              (append (map (lambda (y) `(,(car xs) ,y)) hs)
                                      (map (lambda (y) `(,(car xs) ,y)) (cdr xs))
                                      ))))))

(define n 10)
;(define n 1600)
;(print (comb2 (iota n 1)))


(define (combinations set n)
  (define (rec set tail)
    (cond [(null? tail) (list set)]
          [(eq? (cdr set) tail) (map list set)]
          [else (fold-right (cut acons (car set) <> <>)
                            (rec (cdr set) (cdr tail))
                            (rec (cdr set) tail))]))
  (rec set (list-tail set 2)))

; https://practical-scheme.net/gauche/man/gauche-refe/Combination-library.html
;(use util.combinations)

(print (combinations (iota n 1) 2))


(list-tail '(1 2 3 5) 2)
