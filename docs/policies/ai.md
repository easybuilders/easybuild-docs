# EasyBuild AI Policy {: #policy_ai }


This policy applies to the use of AI, such as generative AI, LLMs, and AI coding assistants, for:

 * code and documentation contributed to EasyBuild;
 * functionality that EasyBuild provides;
 * reporting bugs to EasyBuild.

There are two parts to the policy:

1. [Policy for the provision of AI features in EasyBuild][policy_ai_features]
1. [Policy for the use of AI in contributions to EasyBuild][policy_ai_contributions]

This policy is live as of 19 April 2026 and contributions that were initiated prior to this do not have to retroactively comply with the *Policy for the use of AI in contributions to EasyBuild*.

*EasyBuild continues to provide support for the installation of AI software. These are welcome in EasyBuild, and it is left to individual users and sites as to if they install this software.*

## Policy for the provision of AI features in EasyBuild {: #policy_ai_features }

Functionality that adds AI features directly into the default EasyBuild installation will not be accepted.

The default EasyBuild installation is either:

* `pip install easybuild`
* Using EasyBuild to install EasyBuild, through an easyconfig file named `EasyBuild-x.y.z.eb` (for any version `x.y.z`)

### Reasoning {: #policy_ai_features_reasoning }

By not accepting AI features in the default EasyBuild installation this will allow those wishing to avoid AI to do so, preserving user choice.

Features that enhance EasyBuild using AI should be provided by optional installations or standalone tools. Options for this include:

* Providing the AI feature as additional Python packages. These may be added as optional installs to the default EasyBuild install:
    * Installing EasyBuild using `pip` and opting in to specific optional features, for example with `pip install easybuild[llm]`;
    * Installing EasyBuild with EasyBuild using a customized easyconfig file, like `EasyBuild-x.y.z-with-llm.eb`;
    * Using [hooks](https://docs.easybuild.io/hooks/) that customize the standard functionality of EasyBuild, for example to add AI features.

## Policy for the use of AI in contributions to EasyBuild {: #policy_ai_contributions }

We ask that contributors:

* Declare when they have used AI in a contribution;
* If AI was used in a contribution, that they also:
  * Declare which AI tool and model was used;
  * Declare the extent of that use of AI;
  * Keep a ["human in the loop"](https://www.phoronix.com/news/LLVM-Human-In-The-Loop) when using AI.

Contributions to EasyBuild are:

* GitHub pull requests - code, review, and information;
* GitHub issues;
* GitHub wiki;
* Producing documentation and tutorials hosted by EasyBuild;
* Messages in EasyBuild Slack;
* Emails to the EasyBuild mailing list;
* EasyBuild User Meeting talks;
* Meeting notes.

### Reasoning {: #policy_ai_contributions_reasoning }

By asking those submitting PRs and issues to mark them when they are AI assisted, this will allow us to understand the scope of use of AI in contributions to EasyBuild.

Also, there are potential ethical obligations relating to the data used to train LLMs that remain to be clarified.

### Examples of contribution statements

Examples of statements to declare the use of AI are:

* I used GitHub CoPilot (GPT-5 mini) to code this PR.
* ChatGPT (GPT 5.3) was used to summarise the existing code, but the code was written by me.
* Claude (Sonnet 4.6) was used to produce documentation describing the contribution.

## Changelog

### v1.0 (19 April 2026)

Initial EasuBuild AI policy
