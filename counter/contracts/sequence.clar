
;; title: sequence
;; version:
;; summary: This is going to illustrate the sequence in clarity which is storing varaibles with list of characters
;; description:

;;buffers
0x68656c6c6f21

;;Strings
"This is ASCII STRING"

;; UTF-8 String
u"This is the UTF string \u{1f601}"

;;List contains list of items of same data type
(list 1 2 3 4 5 6 7 8)

(list "a" "b" "c")

;; map is used to perform manipulation on a list
(map not (list true false true))

;; fold. takes a list has input and reduces it to one value.
(fold + (list u1 u2 u3) u0)  ;; output is 6. Adds up all item.

;; Get the lenght of a sequence
(len 0x68656c6c6f21)

(len "This is the best day of my life")

(len (list 1 2 3 4 5 6))

;; get elementat a particular index

(element-at (list 1 2 3 4 5 6) u2)


(index-of (list 1 2 3 4 5 6) 2)

