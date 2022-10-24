# Enable all rules by default
all

# https://github.com/markdownlint/markdownlint/blob/main/docs/RULES.md
exclude_rule 'MD007' # list indent
exclude_rule 'MD009' # trailing spaces
exclude_rule 'MD012' # multiple blank lines
exclude_rule 'MD013' # line length

rule 'MD024', :allow_different_nesting => true
