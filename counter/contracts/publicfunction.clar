
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
(define-public (multiply (a int) (b int) ) 
    (ok (* a b))
)


(print (multiply 1 2) )


;; function would divide

(define-public (divide (a int) (b int))

    (ok (/ a b)) ;; the ok is a response method to return the value of the function

)

(print (divide 10 5))


;; Addition function
(define-public (addition (a int) (b int))

    (ok (+ a b))
)

(print (addition 10 5))

;; Subtraction function

(define-public (substraction (a int) (b int))
        (ok (- a b))
)

(print (substraction 1 2 ))


