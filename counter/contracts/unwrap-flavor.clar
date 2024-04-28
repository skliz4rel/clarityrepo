
;; title: unwrap-flavor
;; version:
;; summary:
;; description:
(unwrap! (some "wrapped string") (err "unwraped failed"))  ;;"wrapped string"


;;unwrap-panic takes a single input which is either an optional or response. If it fails to unwrap the input, it throws a runtime error and exits the current flow.
(unwrap-panic (ok true)) ;; true

;;unwrap-err! takes a response input and a throw value. If the first input is an err, it will return the wrapped value. Otherwise it returns the throw value and exit. It is the counterpart to unwrap!.

(unwrap-err! (err false) (err "Failed cos it could not unwrap"))

;;unwrap-err-panic is the counterpart to unwrap-panic, the input is unwrapped if it is an err, or else a runtime error is thrown.

(unwrap-err-panic (err false))

;;You should ideally not use the -panic variants unless you absolutely have to, because they confer no meaningful information when they fail. A transaction will revert with a vague "runtime error" and users as well as developers are left to figure out exactly what went wrong.


;;Unpacking assignments
;;The unwrap functions are particularly useful when assigning local variables using let. You can unwrap and assign a value if it exists or exit if it does not. It makes working with maps and lists a breeze.

;; Some error constants

(define-constant err-unknown-listing (err u100))
(define-constant err-not-the-maker (err u101))

;; Define an example map called listings, identified by a uint.

(define-map listings  { id:uint }    {name: (string-ascii 50), maker: principal }) ;;key value hashtable

;;insert some values
(map-set listings { id: u0 }  { name: "Jide", maker: tx-sender})
(map-set listings {id: u1}  {name: "Bimpe", maker:tx-sender })

;; simple function to get a listing
(define-read-only (get-listing (index uint) ) 
    (begin 
        (ok (map-get? listings { id: index}))
    )
)

;; Update name function that only the maker for a specific listing
;; can call.
(define-data-var item principal tx-sender)

(define-public (update-name (id uint) (newname (string-ascii 10))) 
    (begin 
        
        (let 
            (
                ;;The magic happens here
                (listing (unwrap! (get-listing id) err-unknown-listing) )
            )

            (var-set item (unwrap-err-panic (map-get? listings id)) )
            (asserts! (is-eq tx-sender item) err-not-the-maker)
        
            (map-set listings {id: id }  (merge listing { name: newname} )  )

            (ok true)
        )
    )
)


