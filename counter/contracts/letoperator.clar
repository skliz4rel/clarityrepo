
;; title: letoperator
;; version:
;; summary:
;; description:

;; traits
;;

(define-data-var firstname (string-ascii 20) "Jide")

(define-data-var lastname (string-ascii 20) "Akindejoye")

(define-read-only (get-firstname) 

    (ok (var-get firstname))
)

(define-read-only (get-lastname) 

    (ok (var-get lastname))
)

(define-public  (get-fullname)
    (let ( (fullname (concat (var-get firstname) (var-get lastname) )) )
    
    
        (ok  fullname)
    )
)

(print (get-fullname))