# Enable all rules by default
all

# https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md
exclude_rule 'MD007' # list indent
exclude_rule 'MD009' # trailing spaces
exclude_rule 'MD010' # Hard tabs
exclude_rule 'MD012' # multiple blank lines
exclude_rule 'MD013' # line length
exclude_rule 'MD026' # Trailing punctuation in header
exclude_rule 'MD036' # Emphasis instead of header
exlcude_rule 'MD038' # Spaces inside code span elements
exclude_rule 'MD046' # Code block style. Doesn't like MkDocs admonitions or content tabs

rule 'MD024', :allow_different_nesting => true
