
;; title: publicfunction
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

;; data maps
;;

;; public functions
;;

;; read only functions
;;

;; public function with no parameter.
;;

(define-public (hello-world)
    (ok "Hello world")
)

(print (hello-world))


;; Sample two
(define-public ( multiply (uint a) (uint b)) 

    (ok (* a b))
)

(print (multiply 1 2) )