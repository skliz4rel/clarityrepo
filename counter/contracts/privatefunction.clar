
;; title: privatefunction
;; version:
;; summary:
;; description:Private functions are defined in the same manner as public functions. The difference is that they can only be called by the current contract. They cannot be called from other smart contracts, 

;;

(define-constant contract-owner tx-sender)

;; Try removing the contract-owner constant above and using a different
;; one to see the example calls error out:
;; (define-constant contract-owner 'ST20ATRN26N9P05V2F1RHFRV24X8C8M3W54E427B2)

(define-constant err-invalid-caller (err u1))

(define-map recipients principal uint)

(define-private (is-valid-caller)
    (is-eq contract-owner tx-sender)
)

(define-public (add-recipient (recipient principal) (amount uint) ) 

    (if (is-valid-caller)
    
        (ok (map-set recipients recipient amount))
        err-invalid-caller
    )
)

(define-public (delete-recipient (recipient principal))

    (if (is-valid-caller)
        (ok (map-delete recipients recipient))
        err-invalid-caller
    )
)


;; Two example calls to the public functions:
(print (add-recipient 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK u500))
(print (delete-recipient 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK))

