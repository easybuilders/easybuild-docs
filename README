# EasyBuild documentation

This repository contains the *sources* of the EasyBuild documentation, which is hosted at https://docs.easybuild.io.

> **Warning**
> 
> The sources of the EasyBuild documentation currently still reside at https://github.com/easybuilders/easybuild/tree/main/docs.
>
> We are actively porting the sources from [reStructuredText](https://en.wikipedia.org/wiki/ReStructuredText) format
> to [MarkDown](https://daringfireball.net/projects/markdown) format.

## Format

The documentation sources are located in the [docs subdirectory](https://github.com/easybuilders/easybuild-docs/tree/main/docs).
They are written in [MarkDown](https://daringfireball.net/projects/markdown) format, and rendered using [MkDocs](https://www.mkdocs.org),
more specifically with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material).

Useful links:

- The Markdown Guide: <https://www.markdownguide.org>
- Reference guide for Material for MkDocs: <https://squidfunk.github.io/mkdocs-material/reference>

## Publishing

The documentation is automatically built and published to https://docs.easybuild.io on every push to the `main` branch of this repository.

This is taken care of by the [`deploy` GitHub Actions workflow](https://github.com/easybuilders/easybuild-docs/tree/main/.github/workflows/deploy.yml).

## Using `mkdocs`

### Installing `mkdocs`

To install all the required `mkdocs` Python packages, use the provided [requirements.txt](https://github.com/easybuilders/easybuild-docs/tree/main/requirements.txt) file:

```
pip install -r requirements.txt
```

### Building

To build the documentation, use:

```
mkdocs build
```

or use the `Makefile` that is provided in this repository:

```
make
```

### Testing

To test whether the documentation is building correctly, and whether all (internal) links are correct, use:

```
mkdocs build --strict
```

or

```
make test
```

These commands will exit with a non-zero exit code if `mkdocs` produces any errors or warnings.

### Previewing

To see a local preview of the rendered documentation in your browser, use

```
mkdocs serve
```

or

```
make preview
```

and click the link that is provided, for example:

```
INFO     -  Documentation built in 0.24 seconds
INFO     -  [17:52:07] Watching paths for changes: 'docs', 'mkdocs.yml'
INFO     -  [17:52:07] Serving on http://127.0.0.1:8000/
```

This preview of the rendered documentation will automatically refresh when the documentation sources are updated!


## Contributing

To contribute to the EasyBuild documentation, you should make a pull request to the `main` branch.

For example:

```
git clone git@github.com:easybuilders/easybuild-docs.git
cd easybuild-docs
git remote add example_fork git@github.com:example/easybuild-docs.git
git checkout -b example_branch
git add docs/example.md
git commit -m "this is just an example"
git push example_fork example_branch
# then go to https://github.com/easybuilders/easybuild-docs and open the pull request
```
