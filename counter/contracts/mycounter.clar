;; title: mycounter
;; version:
;; summary:
;; description:
(define-data-var count uint u1)

(define-constant figure 0)

(define-public (increment (step uint)) 
    (let ((newval (+ (var-get count) step)))
    
        (var-set count newval)

        (print { object:"count",action:"incremented",value:newval})
    
        (ok newval)
    ) ;;; using the let to assisgn result to a new variable
)

(define-public (decrement (step uint)) 
    (let  ((newval (- (var-get count) step)))

    (var-set count newval)

    (print { object:"count", action:"decremented", value:newval})

    (ok newval)
    )
)

(define-read-only (read-count) 
    (ok (var-get count))
)