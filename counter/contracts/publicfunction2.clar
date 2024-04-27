
;; title: publicfunction2
;; version:
;; summary:
;; description:

;; traits
;; This public function sums 3  numbers

(define-public (sum-three (a uint) (b uint ) (c uint)) 
    (begin 
        (ok (+ a b c ))
    )
)

(print (sum-three u1 u2 u3))

;; --- Exercise validation code --
(asserts! (is-eq (sum-three u1 u2 u3) (ok u6))  "That does not seem right, try again..." )

(asserts! (is-eq (sum-three u3 u5 u7) (ok u15)) "That does not seem right, try again...")

(asserts! (is-eq (sum-three u20 u30 u40) (ok u90)) "Almost there, try again!")