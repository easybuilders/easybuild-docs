"""
Generate the code reference pages.
Based off https://mkdocstrings.github.io/recipes/#automatic-code-reference-pages
"""

from pathlib import Path

import mkdocs_gen_files


EB_FRAMEWORK = "src/easybuild-framework"
MKDOCS_SEARCH_PRIORITY = """---
search:
  boost: 0.5
---
"""

if not Path(f"{EB_FRAMEWORK}/easybuild").is_dir():
    print("WARNING  -  EasyBuild Framework is not available. API documentation will not be generated.")
    exit(0)


try:
    # remove the problematic py2.py and symlink the py3.py in its place
    Path(f"{EB_FRAMEWORK}/easybuild/tools/py2vs3/py2.py").unlink(missing_ok=True)
    Path(f"{EB_FRAMEWORK}/easybuild/tools/py2vs3/py2.py").symlink_to(Path("py3.py"))
except FileNotFoundError:
    print("WARNING  -  Unable to create py2.py -> py3.py symlink")

# build a navigation for the menu and a dictionary of navigations for each section
menu_nav = mkdocs_gen_files.Nav()
navs = {}

for path in sorted(Path(f"{EB_FRAMEWORK}/easybuild/").rglob("*.py")):
    module_path = path.relative_to(EB_FRAMEWORK).with_suffix("")
    doc_path = path.relative_to(EB_FRAMEWORK).with_suffix(".md")
    full_doc_path = Path("api", doc_path)

    parts = list(module_path.parts)

    if len(parts) > 1 and tuple(parts[:-1]) not in navs:
        navs[tuple(parts[:-1])] = mkdocs_gen_files.Nav()

    if parts[-1] == "__init__":
        parts = parts[:-1]
        doc_path = doc_path.with_name("index.md")
        full_doc_path = full_doc_path.with_name("index.md")
    elif parts[-1] == "__main__":
        continue

    # add item to menu navigation
    menu_nav[parts] = doc_path.as_posix()

    # walk through the parents to the item and add it to each navigation section
    for i in range(1, len(parts)):
        nav_tuple = tuple(parts[:-i])
        doc_path_relative_to_nav = doc_path.relative_to("/".join(parts[:len(parts)-i])).as_posix()
        navs[nav_tuple][parts] = doc_path_relative_to_nav

    with mkdocs_gen_files.open(full_doc_path, "w") as fd:
        fd.write(MKDOCS_SEARCH_PRIORITY)
        identifier = ".".join(parts)
        fd.write(f"::: {identifier}\n")

    mkdocs_gen_files.set_edit_path(full_doc_path, path)

# Generate the menu navigation file
with mkdocs_gen_files.open("api/summary.md", "w") as nav_file:
    nav_file.write(MKDOCS_SEARCH_PRIORITY)
    nav_file.writelines(menu_nav.build_literate_nav())

# Generate the section navigation files, appending to any existing API content
for key, nav in navs.items():
    fp = '/'.join(key)
    filename = f"api/{fp}/index.md"

    if not Path(filename).is_file():
        with mkdocs_gen_files.open(filename, "w") as nav_file:
            nav_file.write(MKDOCS_SEARCH_PRIORITY)

    with mkdocs_gen_files.open(filename, "a") as nav_file:
        nav_file.writelines(nav.build_literate_nav())
