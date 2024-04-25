
;; title: basics of clarinet language, A lisp style language
;; version:
;; summary:
;; description: This contract is going to show use of basic arithmethic operations in Clarinet.

(+ 4 5)

(concat "Jide" " Akindejoye")

  (+ (* 5 6) 4)

  (
    *
    (+ 1 2)
    (- 4 5)
  )

;;signed integers
 
 (- 8 10)

;; unsigned integers cannot contain negative values.
 (- u18 u10)

 (/ 100 4)

 (/ u100 u5)

;; Booleans 

(not true)

(and true true true)

(or true false true)


;; Principals

'ST1HTBVD3JG9C05J7HBJTHGR0GGW7KXW28M5JS8QE  ;; Standard principals backed by private keys. Wallet address

'ST1HTBVD3JG9C05J7HBJTHGR0GGW7KXW28M5JS8QE.my-first-contract ;;COntract principals points to a smart contract

;; get balance of a wallet aaddress (standard principal)
(stx-get-balance 'ST1HTBVD3JG9C05J7HBJTHGR0GGW7KXW28M5JS8QE )

(stx-get-balance 'ST1HTBVD3JG9C05J7HBJTHGR0GGW7KXW28M5JS8QE.my-first-contract) ;; get balance of the contract


(stx-transfer? u500 tx-sender 'ST1HTBVD3JG9C05J7HBJTHGR0GGW7KXW28M5JS8QE)