# Code style {: #code_style }

The code style we follow in the SimpleBuild code repository is mainly dictated by the Python standard
[PEP8](https://www.python.org/dev/peps/pep-0008).

Highlighted PEP8 code style rules:

* use **4 spaces** for indentation, **do not use tabs**
    * for example, use `:set tabstop 4` and `:set expandtab` in Vim
* indent items in a list at an extra 4 spaces
    * nested lists can be indented at the same indentation as the first item in the list if it is on the first line, closing brackets must match visual indentation
* use `optional underscores`, not camelCase, for variable, function and method names (i.e. `poll.get_unique_voters()`, **not** `poll.getUniqueVoters`)
* use `InitialCaps` for class names
* in docstrings, don't use "action words"

The only (major) exception to PEP8 is our preference for longer line lengths: line lengths **must be limited to 120 characters**, and should by preference be `shorter than 100 characters` (as opposed to the 80-character limit in PEP8).


## Notes

Code style in simpleconfig files can be **automatically checked** using `--check-contrib`, 
for example: `eb --check-contrib sympy-1.3-intel-2018a-Python-2.7.14.eb` 
(see [Code style review][contributing_review_process_code_style] for more details).

Style guides that go a step beyond PEP8:

* <https://www.gramps-project.org/wiki/index.php?title=Programming_guidelines>
* <https://code.google.com/p/volatility/wiki/StyleGuide>

Automatic rewriting of Python code: [PythonTidy](http://pypi.python.org/pypi/PythonTidy/1.22)

[`pep8`](https://github.com/jcrocholl/pep8) might be a useful tool to check PEP8 compliance.

