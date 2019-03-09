(import :std/net/request)

(define (foo)
  (display "Foo from Gerbil")
  (newline)
  (display (http-get "http://example.com/"))
  (newline)
  5)

(define (get-assoc-list)
  '(("foo" . 1) ("bar" . 2) ("baz" . 3)))

(define (get-assoc-list2)
  '((foo . 1) (bar . 2) (baz . 3)))

(begin-foreign
  (namespace ("scmlib#" foo
                        get-assoc-list
                        get-assoc-list2))

  (c-define (c-foo) () int "foo" "extern"
            (foo))
  
  (c-define (c-string->symbol symbol) (char-string) scheme-object "string_to_symbol" "extern"
            (string->symbol symbol))
  
  (c-define (c-get-assoc-list) () scheme-object "get_assoc_list" "extern"
            (get-assoc-list))
  
  (c-define (c-get-assoc-list2) () scheme-object "get_assoc_list2" "extern"
            (get-assoc-list2)))
