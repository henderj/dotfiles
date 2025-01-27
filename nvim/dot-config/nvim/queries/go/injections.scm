(short_var_declaration
  left: (expression_list
    (identifier) @_id (#match? @_id "query|sql")
  )
  right: (expression_list
    (raw_string_literal
      (raw_string_literal_content) @injection.content
      (#set! injection.language "sql")
      (#set! injection.combined)
    )
  )
)
