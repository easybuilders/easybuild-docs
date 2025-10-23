# Contributing {: #contributing }

This documentation explains how you can contribute to EasyBuild, and
discusses the review process for contributions.

## How to contribute {: #contributing_how }

It is a common misconception that contributing to an open source project
requires being intimately familiar with its codebase.

There are various ways to contribute, even if you don't have any
experience with the programming language(s) being used by the project
you are interested in.

You can contribute to EasyBuild by:

- [Giving feedback][contributing_feedback]
- [Reporting bugs][contributing_bugs]
- [Submitting feature/change requests][contributing_requests]
- [Helping others][contributing_helping_others]
- [Contributing easyconfig files][contributing_easyconfigs]
- [Contributing code changes][contributing_code]
- [Writing documentation][contributing_docs]
- [Joining the conversation][contributing_conversation]

### Giving feedback {: #contributing_feedback }

An easy way to contribute to EasyBuild, even without having a lot of
hands-on experience with it, is to **provide feedback** on your
experiences.

Feedback from people new to EasyBuild is valuable, since it provides a
perspective that is easily overlooked by more experienced users.

You can contact the EasyBuild community via the EasyBuild mailing list
(`easybuild@lists.ugent.be`), the `#easybuild` IRC channel (see also
[Getting help][getting_help]).

### Reporting bugs {: #contributing_bugs }

If you run into unexpected problems when using EasyBuild, please **open
a bug report** in the issue tracker of the relevant GitHub repository:

- <https://github.com/easybuilders/easybuild-framework/issues>: for
    general problems with `eb`, the EasyBuild framework, etc.
- <https://github.com/easybuilders/easybuild-easyblocks/issues>: for
    problems specific to a particular (generic or software-specific)
    easyblock, etc.
- <https://github.com/easybuilders/easybuild-easyconfigs/issues>: for
    problems specific to a particular software package, e.g., with
    building and installing a particular version of that software, or
    when using a particular toolchain, etc.
- <https://github.com/easybuilders/easybuild/issues>: for problems
    with the EasyBuild documentation, etc.

Please try and provide all relevant information, which may include:

- the EasyBuild version you are using
- the specifics of the system you are using, incl. OS + version,
    Python version, modules tool & version, etc.
- the active EasyBuild configuration; usually the output of
    `eb --show-config` is sufficient
- the full `eb` command line that was used
- warning or error messages, or other relevant informative messages
- filename or contents of easyconfig file(s) being used
- EasyBuild log file (for example via <https://gist.github.com/>),
    preferably collected with `eb --debug`

### Submitting feature/change requests {: #contributing_requests }

If you have **suggestions for enhancements or ideas for new features**
that could be useful, please open an issue in the relevant GitHub
repository (see [Reporting bugs][contributing_bugs]).

Describe what you have in mind, and maybe also provide a concrete
example to illustrate how your suggestion would improve the current
functionality.

### Helping others {: #contributing_helping_others }

Try and **help others** based on your experience, or help them figure
out an answer to their question or a solution to their problem using the
EasyBuild documentation or by reaching out to someone else in the
EasyBuild community that may know the answer.

The EasyBuild community is known to be very welcoming and helpful, and
you too can be a part of that.

### Contributing easyconfig files {: #contributing_easyconfigs }

Please **contribute easyconfig files** that are not included yet in (the
`develop` branch of) the `easybuild-easyconfigs` GitHub repository at
<https://github.com/easybuilders/easybuild-easyconfigs>.

This includes easyconfigs for software that is not supported yet by
EasyBuild, as well as updates to existing easyconfigs (e.g., version
updates, using a different toolchain, etc.), even if you consider the
updates to be trivial. Keep in mind that being able to use something
that is known to work out-of-the-box can save quite a bit of time
compared to having to tweak existing easyconfigs and validate the result
installations.

We highly recommend using the `--new-pr` and `--update-pr` command line
options for contributing easyconfig files; see
[Submitting new and updating pull requests][github_new_update_pr].

### Contributing code changes {: #contributing_code }

Of course you can also **contribute code changes**, including bug fixes,
enhancements or additional features in the EasyBuild framework, the
easyblocks repository, the test suites or in related scripts.

Do keep in mind that this requires some experience with Python, although
you should be able to go a long way by using the existing code base as
support.

See [Pull requests][contributing_pull_requests] for more
information on the practical aspects of contributing code.

### Writing documentation {: #contributing_docs }

Another way to contribute to EasyBuild without having to implement
Python code is by **writing documentation**, i.e. enhancing or updating
existing documentation or documenting features that are not covered yet.

To contribute to the documentation hosted at
<https://docs.easybuild.io>, you should open a pull request to
the `main` branch of the <https://github.com/easybuilders/easybuild-docs> repository;
see the `docs` subdirectory.

The EasyBuild documentation is made with [Material for MkDocs](https://squidfunk.github.io/mkdocs-material)
and written in [MarkDown](https://daringfireball.net/projects/markdown).

### Joining the conversation {: #contributing_conversation }

Last but not least, you can actively **join the conversation** that
arise on the EasyBuild mailing list, the `#easybuild` IRC channel and
during the bi-weekly EasyBuild conference calls (see
<https://github.com/easybuilders/easybuild/wiki/Conference-calls>).

Engage with the EasyBuild community, and help steer EasyBuild
development by participating in the conversations regarding a variety of
topics related to building and installing (scientific) software.

## Pull requests {: #contributing_pull_requests }

To contribute to the EasyBuild framework, easyblocks, easyconfig files
or the EasyBuild documentation, you will need to open a **pull request**
to the corresponding GitHub repository:

- EasyBuild framework:
    <https://github.com/easybuilders/easybuild-framework>
- easyblocks: <https://github.com/easybuilders/easybuild-easyblocks>
- easyconfigs: <https://github.com/easybuilders/easybuild-easyconfigs>
- documentation: <https://github.com/easybuilders/easybuild> (see
    `docs` subdirectory)

Doing this the traditional way requires some knowledge about using `git`
(i.e. creating commits, using branches, pushing to and pulling from
remote Git repositories, etc.), and being familiar with GitHub.

**However, this can be largely circumvented by using the GitHub
integration provided by EasyBuild, see**
[Integration with GitHub][integration_with_github] **.**

### Setting up {: #contributing_pull_request_setup }

!!! note
    These instructions assume that you already have a working
    GitHub account.

    If you don't have a GitHub account yet, visit <https://github.com/>
    to create one.

    We highly recommend registering your SSH public key in your GitHub
    account, via <https://github.com/settings/keys>. This allows pushing
    to your fork of the GitHub repositories without using a password.

Before you can open pull requests, you will need to **fork** the GitHub
repository you are targeting, and create a local **working copy** of
that repository. This only needs to be done *once* for every of the
EasyBuild repositories.

!!! note
    For the purpose of this guide, we will be using the
    `easybuild-framework` repository.

    However, the instructions are equivalent for the other EasyBuild
    repositories.

#### Forking the repository {: #contributing_pull_request_setup_fork_repo }

First, create your own *fork* of the repository in your GitHub account
using the `Fork` button on the top right at
<https://github.com/easybuilders/easybuild-framework>.

This will create a 'copy' of the `easybuild-framework` repository
owned by the `easybuilders` GitHub organisation to your own personal
GitHub account.

You will have to use this fork as a staging area for your work, to
prepare your contributions before creating the actual pull requests.

#### Creating a working copy {: #contributing_pull_request_setup_working_copy }

In addition to forking the repository on GitHub, you also need to create
a local *working copy* of the repository. This is basically a local
checkout of the repository where you can track the changes you are
making.

First, *clone* your fork of the repository:

``` shell
git clone git@github.com:EXAMPLE/easybuild-framework.git
```

!!! note
    Do not forget to replace `EXAMPLE` with your GitHub account name.

If that worked as expected, you should have a new directory named
`easybuild-framework`. Move into the `easybuild-framework` directory:

``` shell
cd easybuild-framework
```

Finally, we recommended to also check out the `develop` branch, which
will be used as the base for your own branches:

``` shell
git checkout -b develop origin/develop
```

With this in place, you are all set to open pull requests for your
contributions.

##### Keeping the `develop` branch in sync

It is important to keep the `develop` branch in your working copy in
sync with the upstream repository in the GitHub `easybuilders`
organization.

For this, you need to add the upstream repository as a '*remote*'
repository:

``` shell
git remote add upstream git@github.com:easybuilders/easybuild-framework.git
```

!!! note
    `upstream` is just a name that you give to the remote the central

    `easybuilders` repository on GitHub; you can modify this to your
    liking if desired (but do take that into account for the further
    instructions if you do so).

    For your fork of the repository, a default remote named `origin`
    should have been created via `git clone` (see the output of
    `git remote -v`).

To sync your `develop` branch, use `git pull upstream develop` after
making sure you have the `develop` branch checked out:

``` shell
git checkout develop
git pull upstream develop
```

##### Running your development instance {: #running_your_development_instance }

There are multiple ways to deploy a local development copy of EasyBuild. This
section presents a method that is more relevant when modifying the framework and
easyblock repositories.

To deploy a local copy of EasyBuild clone the
[easybuild-framework](https://github.com/easybuilders/easybuild-framework),
[easybuild-easyblocks](https://github.com/easybuilders/easybuild-easyblocks), and
[easybuild-easyconfigs](https://github.com/easybuilders/easybuild-easyconfigs)
repositories in the same directory, say `EasyBuild`. After cloning these
repositories the content of the `EasyBuild` directory should be the following.

```
$ tree -L 1 EasyBuild
EasyBuild
├── easybuild-easyblocks
├── easybuild-easyconfigs
└── easybuild-framework

3 directories, 0 files
```

Export an environment variable with the path to the `EasyBuild` directory to
simplify commands calling the development instance of EasyBuild.

``` shell
export EB_DEVEL_ROOT=/path/to/EasyBuild
```

To run the development instance, add the paths of the framework and easyblock
repositories to the Python path, and the path of the easyconfig repository to
the robot search path.

For instance a command to install `ReFrame-4.3.3.ed` in inline format would be
the following.

``` shell
PYTHONPATH=${EB_DEVEL_ROOT}/easybuild-framework:${EB_DEVEL_ROOT}/easybuild-easyblocks:${PYTHONPATH} EASYBUILD_ROBOT_PATHS=${EB_DEVEL_ROOT}/easybuild-easyconfigs/easybuild/easyconfigs ${EB_DEVEL_ROOT}/easybuild-framework/eb --dry-run --robot ReFrame-4.3.3.eb
```

Define an alias if you prefer to avoid defining all these variables each time
the development version EasyBuild is called.

``` shell
alias eb_devel='PYTHONPATH="${EB_DEVEL_ROOT}/easybuild-framework:${EB_DEVEL_ROOT}/easybuild-easyblocks:${PYTHONPATH}" EASYBUILD_ROBOT_PATHS="${EB_DEVEL_ROOT}/easybuild-easyconfigs/easybuild/easyconfigs" ${EB_DEVEL_ROOT}/easybuild-framework/eb'
```

??? note "Controlling the robot search path in development instances"

    There is no default value for the [robot search
    path](/using-easybuild/#controlling_robot_search_path) in the development
    instance. The robot search path is set explicitly using the
    `EASYBUILD_ROBOT_PATHS` environment variable. As a result, expect that some
    features of the `EASYBUILD_ROBOT_PATHS` and its accompanying command line
    option, `--robot-paths` will not work with, `eb_devel`, the alias for the
    EasyBuild development version.

    For instance,

    - you cannot use `EASYBUILD_ROBOT_PATHS` to set the robot path as it is
      overridden in the alias `eb_devel`, and
    - you cannot append in the default robot search path, with `--robot-paths`,
      as it overrides the `EASYBUILD_ROBOT_PATHS` environment option.

    As a workarroun,

    - use `--robot-paths` to override the robot search path, and
    - use the environment variable `EASYBUILD_ROBOT_PATHS` to explicitly modify
      the robot search path.

    For instance to append to the development robot search path, use the
    following command.

    ``` shell
    eb_devel --robot-paths=${EASYBUILD_ROBOT_PATHS}:/path/0:/path/1
    ```

### Opening a new pull request {: #contributing_creating_pull_requests }

!!! note
    This section describes the manual procedure to open a new pull
    request.

    Please consider using `eb --new-pr` instead, see
    [Submitting pull requests][github_new_pr].

!!! note
    We assume you are already located in your local working copy of
    the repository you want to contribute to (e.g., `easybuild-framework`).

To open a pull request for your contribution, you must follow these
steps:

1. [Creating a new branch][contributing_creating_pull_requests_branch]
1. [Committing your changes][contributing_creating_pull_requests_commit]
1. [Pushing your branch][contributing_creating_pull_requests_push]
1. [Pull request title & description][contributing_creating_pull_requests_pr_title]
1. [Opening the pull request][contributing_creating_pull_requests_open_pr]

#### Creating a new branch {: #contributing_creating_pull_requests_branch }

First, create a new branch for your work. You can do this either before
or after making the changes that you would like to contribute, but we
recommend to create a new branch before making any changes.

Make sure you have the `develop` branch checked out before creating your
branch:

``` shell
git checkout develop
```

To create a new branch, you should use `git branch <branch_name>`
followed by `git checkout <branch_name>`, or equivalently
`git checkout -b <branch_name>`.

For example, to create a new branch named `mybranch`:

``` shell
git checkout -b mybranch
```

You can choose the branch name freely, but make it sufficiently
descriptive – your future self will thank you.

#### Committing your changes {: #contributing_creating_pull_requests_commit }

To 'save' your changes, you should create one or more *commits* in the
branch you created. We recommended making separate commits for different
'units of work'.

First, make sure you have checked out the branch were you want to commit
the changes to. For example, to prepare for committing changes to the
`mybranch` branch:

``` shell
git checkout mybranch
```

To check which branch is currently checked out, use `git branch`.

To get a high-level overview of the changes before committing them, you
can use `git status`.

To see the actual changes that were made, use `git diff`.

To commit the changes you want to contribute, use `git add <files>` to
*stage* the changes, followed by `git commit -m "<message>"` to create
the actual commit.

For example, to commit the changes that were made to
`easybuild/tools/filetools.py`:

``` shell
git add easybuild/tools/filetools.py
git status  # check which files are staged for commit
git commit -m "example commit message for changes to filetools.py"
```

!!! note
    Please use a concise commit message that describes the changes you made.

!!! note
    For files that are already being tracked, you can use `git commit -am <message>`
    to commit all changes at once.

To verify that your work was committed, use `git log` to see all commits
on the current branch. Use `git log --stat` and/or `git log --diff` to
see more details about which changes are included in each of the
commits.

#### Pushing your branch {: #contributing_creating_pull_requests_push }

Once you have committed your changes to a branch, you should *push* your
branch to your fork of the GitHub repository using `git push`.

For example, to push the `mybranch` branch to your fork of the GitHub
repository (via the `origin` remote, see
[Creating a working copy][contributing_pull_request_setup_working_copy]):

``` shell
git push origin mybranch
```

!!! note
    The above command will make your work public.

#### Pull request title & description {: #contributing_creating_pull_requests_pr_title }

Please use a descriptive (short) title for your pull requests, and
clarify (if needed) in the pull request description.

If any other pull requests are required, refer to them in the
description using `#<PR number>` (only for pull requests to the same
repository), or by copy-pasting the URL to the pull request.

For pull requests to the easyconfig repository, we recommend using this
format for the pull request title when contributing new easyconfig
files:

``` shell
{<moduleclass>}[<toolchain>] <software name> <software version> <extra info>
```

For example:

- `{tools}[dummy] EasyBuild v3.2.1`
- `{math}[intel/2017a] numpy 1.13.0 w/ Python 2.7.13`
- `{math,numlib}[foss/2017a] METIS v5.1.0, ParMETIS v4.0.3, SuiteSparse v4.5.5, ...`

If you are opening a work-in-progress pull request, for example to
solicit feedback, tag it using `(WIP)`. in the pull request title.

#### Opening the pull request {: #contributing_creating_pull_requests_open_pr }

To open a pull request using the branch you pushed, you should use the
GitHub interface, and follow the steps outlined below.

1. visit <https://github.com/EXAMPLE/easybuild-framework>

    !!! note
        Replace `EXAMPLE` with your GitHub account name, and
        `easybuild-framework` with the name of the target EasyBuild
        repository.

1. switch to the branch that includes the changes you want to
    contribute using the `Branch: main` button on the left, for
    example by selecting `Branch: mybranch` from the dropdown list
1. click the `New pull request` button
1. change the target branch to `develop` using the `base: main` button
1. review your changes using the 'diff' view presented by GitHub;
1. provide an appropriate title and description for your contribution;
1. open the pull request by clicking the green
     `Create pull request` button

Next, your pull request will be reviewed & tested, see
[Review process for contributions][contributing_review_process].

### Updating existing pull requests {: #contributing_updating_pull_requests }

!!! note
    This section describes the manual procedure to create a new pull request.

    Please consider using `eb --update-pr` instead, see [Updating existing pull requests][github_update_pr].

It is quite common to update a pull request after creating it, for
example if the test suite run in GitHub Actions reports problems with
the changes being made, or as a response to someone reviewing your
contribution.

To update an existing pull request, it suffices to add commits to the
branch that was used for opening the pull request, and pushing the
updated branch to GitHub.

For example, to update the pull request that was created using the
`mybranch` branch:

``` shell
git checkout mybranch
# make changes...
git add <paths to changed files>
git commit -m "example commit message for additional changes"
git push origin mybranch
```

Updating a pull request will trigger GitHub Actions to re-test your
contribution, and a notification will be sent out to whoever is
'watching' your pull request.

### Merging of pull requests {: #contributing_merging_pull_requests }

Once your pull request has been given the green light by GitHub Actions
and one or more people reviewing have approved the changes, it can be
merged into the `develop` branch.

**This can only be done by a member of the EasyBuild maintainers team.
Only pull requests that meet the requirements are eligible for merging,
see** [Requirements for pull requests][contributing_review_process_pr_requirements] **.**

Merging a pull request usually implies that the changes will be part of
the next EasyBuild release.

## Review process for contributions {: #contributing_review_process }

Each contribution is thoroughly reviewed and tested before it gets
merged in. Some aspects of this are automated, others require human
intervention.

### Requirements for pull requests {: #contributing_review_process_pr_requirements }

**Only pull requests (PRs) that fulfil these requirements are eligible
to be merged:**

- *the PR must target the* `develop` *branch of the repository*; see
    [`develop` branch][contributing_review_process_develop_branch]
- *the test suite must (still) pass*, i.e. GitHub Actions *must* give
     a green light; see [Test suite (GitHub Actions)][contributing_review_process_github_actions]

    - *tests should be added or enhanced when appropriate*; see
        [Adding tests][contributing_review_process_adding_tests], especially for PRs to the `easybuild-framework` repository

- *backward compatibility should be retained*; see
      [Backward compatibility][contributing_review_process_backward_compatibility]
- *code style must be kept consistent*; see
     [Code style review][contributing_review_process_code_style]

    - *easyconfigs should be kept consistent across versions &
        toolchains*; see [Comparing with existing easyconfigs][contributing_review_process_review_pr]

- *(successful) test reports must be submitted for easyconfig PRs*;
    see [Test reports for easyconfig contributions][contributing_review_process_test_reports]

- *the PR is approved by one or more maintainers of the repository*;
     see [EasyBuild maintainers][maintainers]
- *the PR should be merged by one of the maintainers, other than the
      author of the PR*; see
      [Pull requests are merged by a maintainer other than the author][contributing_review_process_do_not_merge_your_own_prs]

### `develop` branch {: #contributing_review_process_develop_branch }

**Pull requests are only merged in the** `develop` **branch** of the
EasyBuild repositories, which contains the changes that will be included
in the next EasyBuild release.

The `main` branch provides the latest stable release of EasyBuild at
all times. Only the EasyBuild release manager should issue a pull
request to the EasyBuild `main` branch, when preparing a new
EasyBuild release.

Occasionally, an additional version branch (e.g. `3.3.x`) may be
introduced temporarily, in case an intermittent bugfix release is being
worked on.

### Test suite (GitHub Actions) {: #contributing_review_process_github_actions }

Each pull request is tested automatically by [GitHub
Actions](https://github.com/features/actions) and the test result is
reported in the pull request.

**Only pull requests that have been tested and approved by GitHub
Actions are eligible for being merged!**

Note that GitHub Actions will only run the *test suite* for that
particular repository. That is, for easyconfig contributions it does
*not* include actually building and installing software.

For more information on the test suites, see [Unit tests][unit_tests].

#### Adding tests {: #contributing_review_process_adding_tests }

An implicit requirement for contributions, in particular contributions
to the EasyBuild framework, is that they **must be accompanied by
additional tests or test cases**.

For new features or enhancements, a dedicated test (case) must be added
which verifies that the feature implementation works as expected.

For bug fixes, a test (case) must be added that triggers the code path
where the bug manifested, and which verifies that the bug was indeed
fixed.

Tests not only confirm that the implementation is correct, it also helps
to ensure that any future changes will not break the functionality you
contributed.

### Backward compatibility {: #contributing_review_process_backward_compatibility }

**Contributions should retain backward compatibility**, i.e., they
should *not* make any changes that alter the (default) functionality of
the existing code base. Of course, enhancements to existing code that
retain backward compatibility can be made.

One exception to this rule is *bug fixes*, where the whole point is
usually to fix functionality that was implemented incorrectly.

This also applies to existing easyconfig files; for example, the
versions of dependencies should *not* be altered. Adding dependencies
that were missing or otherwise enhancing existing easyconfigs (e.g.,
adding extra extensions, enabling additional features, etc.) are usually
considered acceptable.

Changes that break backward compatibility have to be motivated well with
technical arguments, and must be approved by the EasyBuild maintainers.

### Code style review {: #contributing_review_process_code_style }

Next to functional evaluation of contributions, care is also taken to
maintain a consistent code style across the EasyBuild code base (see
also [Code style][code_style]); **contributions must
take the (mostly PEP8) code style into account.**

This aspect is sometimes considered to be needless overhead, yet it is
an important aspect of the review process. A consistent code style is
invaluable in a large code base that is constantly being updated by a
worldwide community.

This also applies to easyconfig files, where we try to maintain a strict
style that mostly matches the established PEP8 coding style for Python
(since easyconfigs are written in Python syntax). However, also the
grouping and ordering of easyconfig parameters is a part of the 'code'
style we maintain.

An automated (partial) check to see whether easyconfig files are ready
to be contributed can be performed via `eb --check-contrib`. This will
check:

- style aspects for the specified easyconfig files
- whether SHA256 checksums are included for all source files & patches

This check is also a part of the test suite run by GitHub Actions for
easyconfig PRs.

#### Comparing with existing easyconfigs {: #contributing_review_process_review_pr }

*(`--review-pr`)*

We try to maintain **consistency across easyconfig files** for a
particular software package, across multiple software versions,
toolchains and variants (with a different `versionsuffix`).

Therefore, easyconfig contributions are also reviewed using
`eb --review-pr <PR #>`, which compares the touched easyconfig files to
those in the current `develop` branch that are most closely related.

The easyconfig files to compare with are selected based on similarity,
by combining two criteria, in order.

First, the software version is taken into account, using one of the
following criteria:

- exact match on software version match
- match on major/minor software version
- match on major software version
- no match on software version

This is combined with one of the criteria below (in order):

- matching versionsuffix and toolchain name/version
- matching versionsuffix and toolchain name (any toolchain version)
- matching versionsuffix (any toolchain name/version)
- matching toolchain name/version (any versionsuffix)
- matching toolchain name (any versionsuffix, toolchain version)
- no extra requirements (any versionsuffix, toolchain name/version)

The first combination of one of the software version criteria with one
of the other criteria that yields one or more matching easyconfig files
is used. If none of the combinations match, no easyconfig files for that
particular software package are available yet, and no comparison is
made.

The output of `--review-pr` provides a 'multidiff' comparison, which
highlights the differences between the easyconfig file in the pull
request and the most similar selected ones from the current `develop`
branch.
Interpreting this output is a quick and easy way to assess how different
the contributed easyconfig files are from the existing easyconfigs,
although it does require a bit of practice because of the density of the
provided information.

### Test reports for easyconfig contributions {: #contributing_review_process_test_reports }

*(`upload-test-report`)*

For easyconfig contributions, one or more accompanying **test reports
must be submitted** to confirm that the added and/or changed easyconfig
files (still) work as expected.

We recommend that you submit a test report for your own easyconfig pull
requests. Other people can also submit test reports to confirm that your
contribution works as expected on their system(s).

With EasyBuild being properly configured (see
[GitHub: Configuration][github_configuration]), this should be as
simple as running
`eb --from-pr <PR#> --upload-test-report --force --robot`.

See [Uploading test reports][github_upload_test_report] for more
information.

### Pull requests are merged by a maintainer other than the author {: #contributing_review_process_do_not_merge_your_own_prs }

**A pull request should never be merged by its author.**

This policy is maintained in order to ensure a *"two-pairs-of-eyes"*
review process of all contributions.

### Why a pull request may be closed by a maintainer {: #contributing_review_process_why_pr_closed_by_maintainer }

Although it is generally avoided, there are a few reasons why
maintainers might close a pull request:

- uses an archived toolchain
- no activity for > 6 months
- obsolete because more recent PRs for newer versions of the software
    have been merged already

This is done routinely as a way of focusing everyone's efforts on
relevant contributions, and should not be seen as a rejection. In fact,
contributors are encouraged to reopen the pull request if they feel it
is still relevant.
