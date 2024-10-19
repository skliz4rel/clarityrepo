
;; title: timelocked-wallet
;; version:
;; summary:
;; description:
;;Instead of starting to code straight away, let us take a moment to consider the features we want to have.

;;A user can deploy the time-locked wallet contract.
;;Then, the user specifies a block height at which the wallet unlocks and a beneficiary.
;;Anyone, not just the contract deployer, can send tokens to the contract.
;;The beneficiary can claim the tokens once the specified block height is reached.
;;Additionally, the beneficiary can transfer the right to claim the wallet to a different principal. (For whatever reason.)
;;With the above in mind, the contract will thus feature the following public functions:

;;lock, takes the principal, unlock height, and an initial deposit amount.
;;claim, transfers the tokens to the tx-sender if and only if the unlock height has been reached and the tx-sender is equal to the beneficiary.
;;bestow, allows the beneficiary to transfer the right to claim the wallet.
;; traits
;;

;; token definitions
;;
;;Instead of starting to code straight away, let us take a moment to consider the features we want to have.

;;A user can deploy the time-locked wallet contract.
;;Then, the user specifies a block height at which the wallet unlocks and a beneficiary.
;;Anyone, not just the contract deployer, can send tokens to the contract.
;;The beneficiary can claim the tokens once the specified block height is reached.
;;Additionally, the beneficiary can transfer the right to claim the wallet to a different principal. (For whatever reason.)
;;With the above in mind, the contract will thus feature the following public functions:

;;lock, takes the principal, unlock height, and an initial deposit amount.
;;claim, transfers the tokens to the tx-sender if and only if the unlock height has been reached and the tx-sender is equal to the beneficiary.
;;bestow, allows the beneficiary to transfer the right to claim the wallet.

(define-constant  contract-owner tx-sender)

;;Errors
(define-constant err-owner-only (err u100))
(define-constant err-already-locked (err u101))
(define-constant err-unlock-in-past (err u102))
(define-constant err-no-value (err u103))
(define-constant err-beneficiary-only (err u104))
(define-constant err-unlock-height-not (err u105))

;;Data
(define-data-var beneficiary (optional principal) none ) ;; This is variable that initializes this to optional principal with initial value none
(define-data-var unlock-height uint u0)


(define-public (lock (new-beneficiary principal) (unlock-at uint) (amount uint))

   (begin 
        (asserts! (is-eq  tx-sender contract-owner)  err-owner-only)
        (asserts!  (is-none (var-get beneficiary)) err-already-locked)
        (asserts! (> unlock-at block-height) err-unlock-in-past)
        (asserts!  (> amount u0) err-no-value)
        (try! (stx-transfer? amount tx-sender (as-contract  tx-sender)))
        (var-set beneficiary (some new-beneficiary))
        (var-set unlock-height unlock-at)
        (ok true)
    )
)


(define-public (bestow (new-beneficiary principal))
    (begin 
        (asserts! (is-eq (some tx-sender) (var-get beneficiary)) err-beneficiary-only)
        (var-set beneficiary (some new-beneficiary))
        (ok true)
     )
)

;;Finally, the claim function should check if both the tx-sender is the beneficiary and that the unlock height has been reached.

(define-public (claim)
    (begin 
        (asserts! (is-eq (some tx-sender) (var-get beneficiary)) err-beneficiary-only)
        (asserts! (>= block-height (var-get unlock-height)) err-unlock-height-not)
        (as-contract (stx-transfer? (stx-get-balance tx-sender) tx-sender (unwrap-panic (var-get beneficiary))))            
    )
)