
;; title: asserts
;; version:
;; summary:
;; description:


(asserts! true (err false))

;; Would fail and cos the contract to throw and exception (asserts! false (err "Failed"))

;;Example 2
(define-public (assets-example (input bool)) 
    (begin 
        (asserts! input (err "Contract would fail and terminate with exception"))
        (ok "end of the function")
    )
)


(print (assets-example true))
(print (assets-example false))