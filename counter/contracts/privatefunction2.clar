
;; title: privatefunction2
;; version:
;; summary:
;; description:

;; traits
;;

(define-data-var counter uint u0)

(define-private (increment) 
    (begin 
    
        (var-set counter (+ (var-get counter) u1) )
        (ok (var-get  counter)  )
    )
)

(print (increment))
