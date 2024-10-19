
;; title: responsechecking
;; version:
;; summary:
;; description:

(define-map deposits principal uint)

(define-read-only (get-total-deposit (who principal) ) 

    (default-to u0 (map-get? deposits who))
)

(define-public (deposit (amount uint) ) 

    (begin 
        (try! (stx-transfer? amount tx-sender (as-contract tx-sender)))
        (map-set deposits tx-sender (+ (get-total-deposit tx-sender) amount))
        (ok true)
    )
)