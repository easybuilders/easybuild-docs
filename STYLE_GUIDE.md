# Style guide for EasyBuild documentation

General guidance on the style of the EasyBuild documentation.

## Code Blocks

There are broadly two types of code block used, which take different syntax highlighting:

* Where the code represents a single command use the `shell` lexer, and don't include a leading `$`.
  For example:

    ```` markdown
    ``` shell
    ls -la ~
    ```
    ````

* Where the code represents a command, followed by some example output, use the `console` lexer, and *do* include a leading `$`.
  For example:

    ```` markdown
    ``` console
    $ echo "Hello World!"
    Hello World!
    ```
    ````

## Admonitions

Use [admonitions](https://squidfunk.github.io/mkdocs-material/reference/admonitions/) primarily for warnings and notes.
For example:

``` markdown
!!! warning
    This is a warning!

!!! note
    This is a note.
```
