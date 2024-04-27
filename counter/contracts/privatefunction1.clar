
;; title: privatefunction1
;; version:
;; summary:
;; description:
(define-constant err-invalid-caller (err u1))

(define-map authorised-callers principal bool)

(define-map recipients principal bool)

(map-set recipients tx-sender true)
(map-set authorised-callers 'ST20ATRN26N9P05V2F1RHFRV24X8C8M3W54E427B2 true)
(map-insert authorised-callers tx-sender true)

(define-private (is-valid-caller (caller principal) )

 (unwrap-panic (map-get? authorised-callers caller)) ;; You need to unwrap it cos it sends an optional result
)

(define-public (delete-recipient (recipient principal))

       (if (is-valid-caller  tx-sender)
       
           (ok (map-delete recipients tx-sender))  ;; map-delete would return false and wrap in the ok response function  
           err-invalid-caller
       )
)


(print (delete-recipient tx-sender))
