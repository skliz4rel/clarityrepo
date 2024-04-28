
;; title: ifstatement
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

(define-constant num1 u1)
(define-constant num2 u2)
(define-constant invalid-err (err false))

(define-public (ifstatement) 
    (begin 
        (if (is-eq num1 num2) 
        (ok true)
        invalid-err
        )
       ;; (asserts! (is-eq num1 num2) invalid-err)
    )
)

(print (ifstatement))