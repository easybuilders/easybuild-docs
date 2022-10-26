# EasyBuild documentation

This repository contains the *sources* of the EasyBuild documentation, which is hosted at <https://docs.easybuild.io>.

> **Warning**
> 
> The sources of the EasyBuild documentation currently still reside at <https://github.com/easybuilders/easybuild/tree/main/docs>.
>
> We are actively porting the sources from [reStructuredText](https://en.wikipedia.org/wiki/ReStructuredText) format
> to [MarkDown](https://daringfireball.net/projects/markdown) format.

## Porting effort (we need your help!)

We are currently moving the EasyBuild documentation from the [``easybuild`` repository](https://github.com/easybuilders/easybuild)
to this repository, and are converting the documentation sources from [reStructuredText](https://en.wikipedia.org/wiki/ReStructuredText) (``.rst``)
to [MarkDown](https://daringfireball.net/projects/markdown) (``.md``), so it can be rendered using [MkDocs](https://mkdocs.org).

If you would like to help, here's what you should do:

0) Fork the ``easybuild-docs`` repository to your GitHub account, clone the repository and set up a remote for your fork:

   ```shell
   git clone git@github.com:easybuilders/easybuild-docs.git
   cd easybuild-docs
   git remote add YOUR_GITHUB_ACCOUNT git@github.com:YOUR_GITHUB_ACCOUNT/easybuild-docs.git
   ```

1) Pick a documentation page that you would like to port to MarkDown format.

   All pages that still have the "`still needs to be ported`" warning message on top have not been ported yet.
   
   Make sure you take into account [open pull requests](https://github.com/easybuilders/easybuild-docs/pulls)! (see also step 2)
   
2) Create a new branch from the latest commit of the `main`.

   (we're using `example_branch` below):

   ```shell
   git checkout main
   git pull origin main
   git branch example_branch
   ```

3) Remove the top warning in the existing `.md` file that corresponds to the documentation page you would like to work on, and create a commit for it:

   ```shell
   git checkout example_branch
   vim docs/example.md  # replace 'vim' with your favourite editor, probably still 'vim'
   git add docs/example.md
   git commit -m "remove warning on top of 'example' page"
   ```

4) Push the branch to your fork, and create a (draft) pull request for it (yes, now already).

   Use "`port example page to MarkDown`" as title for your pull request
   (where you replace `example` with the name of the page you are porting, of course).

   By creating a pull request already at this stage, it is clear to others who want to help with the porting effort
   that someone is already working on that documentation page, and we can avoid duplicate work being done.

   ```shell
   git push YOUR_GITHUB_ACCOUNT example_branch
   # create pull request in GitHub, change PR title to "port example page to MarkDown";
   # you can use this URL, in which you replace '`YOUR_GITHUB_ACCOUNT`' and '`example_branch'`:
   # https://github.com/YOUR_GITHUB_ACCOUNT/easybuild-docs/pull/new/example_branch
   ```

5) Port the page to MarkDown, add another commit when your done, and update your pull request by pushing the updated branch to your fork.

   ```shell
   vim docs/example.md  # don't bother replacing 'vim', you know you want to use it...
   git add docs/example.md
   git commit -m "port example page to MarkDown"
   git push YOUR_GITHUB_ACCOUNT example_branch
   ```

6) Keep an eye on your pull request, and update your pull request again if any changes are suggested by the person who reviews it,
   or if the tests fail.

An example pull request in which the [``what-is-easybuild``](https://easybuilders.github.io/easybuild-docs/what-is-easybuild)
page was ported to MarkDown can be seen [here](https://github.com/easybuilders/easybuild-docs/pull/7).

Some important attention points:

- **Focus your effort on *porting* to the MarkDown format**, not on the contents of the documentation page.

  If you spot any outdated or missing content that should be updated/fixed/added, please [open an issue for it](https://github.com/easybuilders/easybuild-docs/issues).

- To preview a rendered version of the documentation page you are working on, you will need to install the required `mkdocs` Python packages,
  see instructions below.

- **Only work at one documentation page at a time**: only start working on another page if your pull request has been merged.

  This way, we can maximize the number of people working in parallel, hopefully reducing the time needed to complete the porting effort.
  
- **Stay away from `docs/api.md` and any pages under `docs/version-specific/`.**

  Those pages correspond to part of the documentation that will be auto-generated, so porting them manually is futile effort.
  

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
