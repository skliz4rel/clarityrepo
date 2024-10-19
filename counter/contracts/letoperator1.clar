
;; title: letoperator1
;; version:
;; summary:
;; description:

(define-data-var num1 uint u10)

(define-data-var num2 uint u50)

(define-private (addition) 
    (let ((result (+ (var-get num1) (var-get num2))))

        (ok result)
    )
)

(define-private (substration)

    (let ((result (- (var-get num1)  (var-get num2) )))

        (ok result)
    )
)

(define-private (multiply) 
    (let  ((result (* (var-get num1)  (var-get num2)) ))

        (ok result)
     )
)

(define-private (divide) 

    (let ((result (/ (var-get num1) (var-get num2))))

        (ok result)
    )
)

(define-public (displayResult) 
    (begin 
        (print (unwrap-panic (addition)))
        (print (unwrap-panic (substration)))
        (print (unwrap-panic (multiply)))
        (print (unwrap-panic (divide)))
        (ok true)
    )
)