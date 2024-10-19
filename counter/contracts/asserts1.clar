
;; title: asserts1
;; version:
;; summary:
;; description:

(define-constant contract-owner tx-sender)

(define-constant invalid-caller-err (err u0))

(define-map recipients principal uint)

(define-private (is-invalid-caller)

   (is-eq contract-owner tx-sender)
)


(define-public (add-recipient  (recipient principal) (amount uint))

    (begin 
        (asserts! (is-invalid-caller) invalid-caller-err)

        (map-set recipients recipient amount)
        (ok true)
    )
)


(define-public (delete-recipient (recipient principal)) 
    (begin 
        (asserts! (is-invalid-caller) invalid-caller-err )

        (ok (map-delete recipients recipient))
    )
)



;; Two example calls to the public functions:
(print (add-recipient 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK u500))
(print (delete-recipient 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK))
