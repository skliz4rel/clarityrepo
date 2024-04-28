
;; title: try
;; version:
;; summary:The try! function takes an optional or a response type and will attempt to unwrap it. Unwrapping is the act of extracting the inner value and returning it. Take the following example:
;; description:

(try! (some "This is it friend"))


;;It will unwrap the some and return the inner "wrapped string".
;;try! can only successfully unwrap some and ok values.

(define-public (try-example (input (response uint uint)) )
   (begin
    (try! input)
    (ok "end of the function")
   )
)

(print (try-example (ok u1)))
(print (try-example (err u2)))
