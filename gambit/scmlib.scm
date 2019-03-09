(c-define (c-foo) () int "foo" "extern"
          (display "Foo from Gambit")
          (newline)
          5)

(c-define (c-string->symbol symbol) (char-string) scheme-object "string_to_symbol" "extern"
          (string->symbol symbol))

(c-define (c-get-assoc-list) () scheme-object "get_assoc_list" "extern"
          '(("foo" . 1) ("bar" . 2) ("baz" . 3)))

(c-define (c-get-assoc-list2) () scheme-object "get_assoc_list2" "extern"
          '((foo . 1) (bar . 2) (baz . 3)))
