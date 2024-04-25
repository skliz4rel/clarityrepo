
;; title: keywords
;; version:
;; summary:

block-height

burn-block-height

;;Contains the principal that sent the transaction. It can be used to validate the principal that is calling into a public function.

tx-sender

;;Note that it is possible for the tx-sender to be a contract principal if the special function as-contract was used to shift the sending context.
(as-contract tx-sender)

;;Contains the principal that called the function. It can be a standard principal or contract principal. If the contract is called via a signed transaction directly, then tx-sender and contract-caller will be equal. If the contract calls another contract in turn, then contract-caller will be equal to the previous contract in the chain.
contract-caller