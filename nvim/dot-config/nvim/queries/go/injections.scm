(short_var_declaration
  left: (expression_list
    (identifier) @_id (#match? @_id "[Qq]uery|[Ss]ql")
  )
  right: (expression_list
    (raw_string_literal
      (raw_string_literal_content) @injection.content
      (#set! injection.language "sql")
    )
  )
)
(short_var_declaration
  left: (expression_list
    (identifier) @_id (#match? @_id "[Rr]egex")
  )
  right: (expression_list
    (raw_string_literal
      (raw_string_literal_content) @injection.content
      (#set! injection.language "regex")
    )
  )
)
