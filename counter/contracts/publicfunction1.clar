
;; title: publicfunction1
;; version:
;; summary:
;; description:
;;This program is going to be used to calculate even number 
(define-data-var even-values uint u0)

(define-public (count-even (number uint))
    (begin 
        ;;increment the values of the number by 1
        (var-set even-values (+ (var-get even-values) u1) )

        ;; check ifthe input is an even or odd
        (if
            (is-eq (mod number u2) u0)
                (ok "is an even number")
                (err "is an odd number")
        )
    
    )
)

(print (count-even u4))
(print (count-even u7))

(print (var-get even-values))