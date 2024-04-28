(define-constant number u0)

(if (is-eq (mod number u2) u0)
    (ok "the number is even")
    (err "the number is uneven")
)
