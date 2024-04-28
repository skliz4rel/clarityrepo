
;; title: readonlyfunc
;; version:
;; summary:
;; description:

;; traits
;;

;; token definitions
;;

;; constants
;;

;; data vars
;;

(define-read-only (add (a uint) (b uint)) 

    (ok (+ a b))
)

(print (add u1 u3))


;;return the value of a variable
(define-data-var counter uint u0)

(define-read-only (getCounter) 
    (ok (var-get counter))
)


;; return the counter of the given principal
(define-map counters principal uint)

(map-set counters 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK u5)
(map-set counters 'ST20ATRN26N9P05V2F1RHFRV24X8C8M3W54E427B2 u10)

(define-read-only (get-counter-of (who principal))
    ;; Implement.
	(ok (unwrap-panic  (map-get? counters who)))
)


(print (get-counter-of 'ST1J4G6RR643BCG8G8SR6M2D9Z9KXT2NJDRK3FBTK))