# see https://mkdocstrings.github.io/recipes/#automatic-code-reference-pages

"""Generate the code reference pages and navigation."""

from pathlib import Path

import mkdocs_gen_files

TOP_DIR = "docs/api"
FRAMEWORK_PKG_DIR = "src/easybuild-framework"
EASYBLOCKS_PKG_DIR = "src/easybuild-easyblocks"

nav = mkdocs_gen_files.Nav()

for pkg_dir in (FRAMEWORK_PKG_DIR, EASYBLOCKS_PKG_DIR):
    for path in sorted(Path(pkg_dir + "/easybuild").rglob("*.py")):
        module_path = path.relative_to(pkg_dir).with_suffix("")
        doc_path = path.relative_to(pkg_dir).with_suffix(".md")
        full_doc_path = Path(TOP_DIR, doc_path)

        parts = tuple(module_path.parts)
        print(parts)
        print(full_doc_path)

        if parts[-1] == "__init__":
            parts = parts[:-1]
            doc_path = doc_path.with_name("index.md")
            full_doc_path = full_doc_path.with_name("index.md")
        elif parts[-1] in ("__main__", "setup"):
            continue
        elif parts[-2] == "py2vs3":
            continue
        elif parts[0] == "contrib":
            continue

        nav[parts] = doc_path.as_posix()

        with mkdocs_gen_files.open(full_doc_path, "w") as fd:
            ident = ".".join(parts)
            fd.write(f"::: {ident}")

        mkdocs_gen_files.set_edit_path(full_doc_path, path)

with mkdocs_gen_files.open("%s/index.md" % TOP_DIR, "w") as nav_file:
    nav_file.writelines(nav.build_literate_nav())
