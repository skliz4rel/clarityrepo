
;; title: functions
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

;; private functions
;;


;;Data maps are so-called hash tables. It is a kind of data structure that allows you to map keys to specific values. Unlike tuple keys, data map keys are not hard-coded names. They are represented as a specific concrete values. You should use maps if you want to relate data to other data.

;;(define-map map-name key-type value-type)

;;Both key-type and value-type can be any valid type signature, although tuples are normally used because of their versatility.

;; A map that creates a principal => uint relation.
(define-map balances principal uint)

;; Set the "balance" of the tx-sender to u500.

(map-set balances tx-sender u500)

;; retrieve the balance of the tx sender in the map
(print (map-get? balances tx-sender))


;;EXAMPLE 2
;;Let us take a look at how we can use a map to store and read basic orders by ID. We will use an unsigned integer for the key type and a tuple for the value type. These fictional orders will hold a principal and an amount.

(define-map orders uint { maker: principal, amount:uint })

(map-set orders u0 { maker:tx-sender, amount: u100})

(map-set orders u1 {maker:tx-sender, amount: u200})

(print (map-get? orders u1))

;; Maps are not iterateble the only way to access values in a map is by setting the right key



;; EXAMPLE 3

(define-map highestbidder 
            {listing-id:uint, asset: (optional principal) }  ;; using a Tuple has key is quite expensive. Avoid it if possible
            { bid-id:uint}
)

(map-set highestbidder {listing-id: u0, asset: none }   { bid-id: u1 })


;; Set and insert

;;The map-set function will overwrite existing values whilst map-insert will do nothing and return false if the specified key already exists. Entries may also be deleted using map-delete.

(define-map scores principal uint)

(map-insert scores tx-sender u100) ;; this would insert a new entry

;;line below would do nothing becos the key already exits and you cant override it.
(map-insert  scores tx-sender u200)

;;This would print u100

(print (map-get? scores tx-sender ))

;; Delete the entry
(map-delete scores tx-sender) ;; clears allos

(print (map-get? scores tx-sender)) ;; wud return none since the value has been deleted. Key no long enits
