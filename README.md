# EasyBuild documentation

This repository contains the *sources* of the EasyBuild documentation, which is hosted at <https://docs.easybuild.io>.

> **Warning**
> 
> The sources of the EasyBuild documentation currently still reside at <https://github.com/easybuilders/easybuild/tree/main/docs>.
>
> We are actively porting the sources from [reStructuredText](https://en.wikipedia.org/wiki/ReStructuredText) format
> to [MarkDown](https://daringfireball.net/projects/markdown) format.


## Format

The documentation sources are located in the [docs subdirectory](https://github.com/easybuilders/easybuild-docs/tree/main/docs).

They are written in [MarkDown](https://daringfireball.net/projects/markdown) format, and rendered using [MkDocs](https://www.mkdocs.org),
and the [Material for MkDocs](https://squidfunk.github.io/mkdocs-material) theme.

Useful links:

- The Markdown Guide: <https://www.markdownguide.org>
- Reference guide for Material for MkDocs: <https://squidfunk.github.io/mkdocs-material/reference>

## Publishing

The documentation is automatically built and published to <https://docs.easybuild.io> on every push to the `main` branch of this repository.

This is taken care of by the [`deploy` GitHub Actions workflow](https://github.com/easybuilders/easybuild-docs/tree/main/.github/workflows/deploy.yml).

## Using `mkdocs`

### Installing `mkdocs`

To install all the required `mkdocs` Python packages, use the provided [requirements.txt](https://github.com/easybuilders/easybuild-docs/tree/main/requirements.txt) file:

```shell
pip install -r requirements.txt
```

### Building

To build the documentation, use:

```shell
mkdocs build
```

or use the `Makefile` that is provided in this repository:

```shell
make
```

### Testing

To test whether the documentation is building correctly, and whether all (internal) links are correct, use:

```shell
mkdocs build --strict
```

or

```shell
make test
```

These commands will exit with a non-zero exit code if `mkdocs` produces any errors or warnings.

### Previewing

To see a local preview of the rendered documentation in your browser, use

```shell
mkdocs serve
```

or

```shell
make preview
```

and click the link that is provided, for example:

```shell
INFO     -  Documentation built in 0.24 seconds
INFO     -  [17:52:07] Watching paths for changes: 'docs', 'mkdocs.yml'
INFO     -  [17:52:07] Serving on http://127.0.0.1:8000/
```

This preview of the rendered documentation will automatically refresh when the documentation sources are updated!

### EasyBuild Framework API

The API documentation for the EasyBuild Framework is generated automatically if the EasyBuild framework code is found in ``src``:

```shell
mkdir src
cd src
git clone git@github.com:easybuilders/easybuild-framework.git
```

If the EasyBuild Framework is not found then the `mkdocs` build of the documentation will be faster, but this will cause a number of warnings messages to be printed.


## Contributing

To contribute to the EasyBuild documentation, you should make a pull request to the `main` branch.

- Fork the ``easybuild-docs`` repository to your GitHub account, clone the repository and set up a remote for your fork:

   ```shell
   git clone git@github.com:easybuilders/easybuild-docs.git
   cd easybuild-docs
   git add remote YOUR_GITHUB_ACCOUNT git@github.com:YOUR_GITHUB_ACCOUNT/easybuild-docs.git
   ```

- Create a branch for your changes, push it to your fork on the ``easybuild-docs`` repository, and open the pull request:

  ```shell
  vim docs/example.md
  git checkout -b example_branch
  git add docs/example.md
  git commit -m "this is just an example"
  git push YOUR_GITHUB_ACCOUNT example_branch
  # create pull request in GitHub:
  # https://github.com/YOUR_GITHUB_ACCOUNT/easybuild-docs/pull/new/example_branch
  ```
