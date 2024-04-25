
;; title: composite
;; version:
;; summary:
;; description:

;; Optional

(some u4)

(some "This is an optional containing a string")

;; Optional containing a principal below
(some 'ST1HTBVD3JG9C05J7HBJTHGR0GGW7KXW28M5JS8QE)

;; nothing is rep by none

none

(element-at (list 1 2 3 4 5 5 5) u1000)
;; would return none cos index does not exits

;; to access value contain in some you must unwrap it
(unwrap-panic (some u10))


;; Tuple  Tuples are records that hold multiple values in named fields. 

{
    id: u10,
    username: "Jide Akindejoye",
    address:  'ST1HTBVD3JG9C05J7HBJTHGR0GGW7KXW28M5JS8QE ;; and a principal
}

;; get a member of the Tuples
(get username { id: 5, username: "skliz"})

;;Tuples are immutable but they can be merged but not changed

(merge 
    { id: 5, username:"skliz"}
    { id: 10, score: 20 }
)

;; the right id would over write the values in the left id



;; Reponses
;;A response is a composite type that wraps another type just like an optional.

(ok true)

(err u4) ;; returns an error sometine when wrong.

(unwrap-panic (ok true))

