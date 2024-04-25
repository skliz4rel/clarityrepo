
;; title: variable
;; version:
;; summary:
;; description:

;;Variables are data members that can be changed over time. They are only modifiable by the current smart contract. Variables have a predefined type and an initial value.

;;(define-data-var var-name var-type initial-value) syntax for creating a variable

(define-data-var number uint u0)

(print (var-get number))

;;Change the value in the variable
(var-set number u1)

;; print the value of the variable
(print (var-get number))


;; Sample 2 below
(define-data-var message (string-ascii 15) "This works.")



;; Sample 3

(define-data-var highscore 

;;Tuple definication type
{
    score:uint,
    who: (optional principal),
    atheight:uint
}

;;Tuple value
{
    score:u0,
    who:none,
    atheight:u2
}
)

;;print the value of high-score
(print (var-get highscore))

;;change the value
(var-set 

highscore { score:u1, who:(some tx-sender), atheight:u0}

)

;; print the new value
(print (var-get highscore))

