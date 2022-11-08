#!/usr/bin/env python

"""
Script to raise an error if there are any duplicated internal links
Designed for use in Github actions.
"""

import os
import re

intlnk_regex = re.compile(r".*{:(\s*)#(\w+)(\s*)}")


def check_for_links(filepath, link_dict):
    """Search Markdown file for occurrences of any internal links

    Args:
        filepath (string): path to Markdown file
        link_dict (dict): instance of dictionary
    """

    with open(filepath) as fh:
        for index, line in enumerate(fh.readlines(), 1):
            path_line = f"{filepath}#L{index}"
            match = intlnk_regex.match(line)
            if match:
                if match[2] in link_dict:
                    if path_line not in link_dict[match[2]]:
                        link_dict[match[2]].append(path_line)
                else:
                    link_dict[match[2]] = [path_line]


def main():
    """Traverse the "docs" directory and locate all Markdown files.
    Determine whether there are any duplicate entries in the parsed files.

    Raises:
        SystemExit: Exits with code "1" if any duplicates are discovered.
    """

    link_dict = {}

    tests_fail = False
    fail_info = []

    for root, _, files in os.walk('./docs'):
        for file in files:
            if file.endswith('.md'):
                filepath = os.path.join(root, file)
                check_for_links(filepath, link_dict)

    for k, v in link_dict.items():
        if len(v) > 1:
            tests_fail = True
            fail_info.append(f"\"{k}\" is used in {len(v)} locations: {v}")

    if tests_fail:
        print("Internal link tests failed! Each link definition name should appear only once.\n")
        print('\n'.join(fail_info))
        raise SystemExit(1)
    else:
        print("Link check tests successful")


if __name__ == '__main__':
    main()
