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

## Internal Links

MkDocs automatically adds an html anchor to all headers. The default anchor is the header text in lower case and spaces replaced by `-`. So, the header 'Internal Links' gets an automatic anchor of `internal-links`. (Note too that multiple `-` characters, e.g. `--robot`, in a header will be truncated to a single `-` in the anchor.)

We can manually specify the anchor by adding an attribute, so:

``` markdown
## Internal Links {: #anchor }
```

The standard MkDocs method to link to another page is by reference to the relative path to the markdown file:

``` markdown
[link text](page.md)
```

and to a section within the page with

``` markdown
[link text](page.md#anchor)
```

The EasyBuild docs uses [mkdocs-autorefs](https://github.com/mkdocstrings/autorefs). This allows internal links to be automatically linked by referring only to the anchor, e.g.

``` markdown
[link text][anchor]
```

N.B. according to the *mkdocs-autorefs* README:

> Note that this plugin's behavior is undefined when trying to link to a heading title that appears several times throughout the site. Currently it arbitrarily chooses one of the pages.
