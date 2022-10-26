# Style Guide for *docs.easybuild.io*

General guidance on the style of the EasyBuild documentation.

## Code Blocks

There are broadly two types of code block used, which take different syntax highlighting:

* Where the code represents a single command use the `shell` lexer and don't include a leading `$`. E.g.

    ```` markdown
    ``` shell
    ls -la ~
    ```
    ````

* Where the code represents a command, followed by some example output, use the `console` lexer and *do* include a leading `$`. E.g.

    ```` markdown
    ``` console
    $ echo "Hello World!"
    Hello World!
    ```
    ````

## Admonitions

Use [admonitions](https://squidfunk.github.io/mkdocs-material/reference/admonitions/) primarily for warnings (`!!! warning`) and info (`!!! info`).
