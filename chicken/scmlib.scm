(import (chicken foreign)
        (chicken platform))

(define-external (foo (int xyz)) int
  (print xyz)
  1)

(return-to-host)
