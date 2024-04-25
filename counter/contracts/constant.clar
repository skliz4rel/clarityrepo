
;; title: datatype
;; version:
;; summary:
;; description:

(define-constant devname "Jide Akindejoye")

(define-constant 
    description (concat devname " is a Nigerian")
 )

 (print devname)

 (print description)

 ;;A common pattern that you will come across is that of defining a constant to store the principal that deployed the contract:

(define-constant contactowner tx-sender)

(print contactowner)

;;Constants are also useful to give return values and errors meaningful names.

(define-constant err-something-failed (err u0))

(print err-something-failed)

