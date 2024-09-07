import argparse
import json
import shutil
from collections import defaultdict
from pathlib import Path


def output_markdown(processed, output_base_path):
    packages = sum(len(v) for v in processed.values())
    top_page = open(output_base_path / 'index.md', 'w')
    top_page.write("# List of supported software\n\n")
    top_page.write(f"EasyBuild supports {packages} different software packages (incl. toolchains, bundles):\n\n")

    for letter in processed:
        top_page.write(f" * [{letter}]({letter}/index.md)\n")

        letter_dir = output_base_path / letter
        letter_dir.mkdir()
        letter_page = open(letter_dir / 'index.md', 'w')
        letter_page.write(f"# List of supported software ({letter})\n\n")

        for software in processed[letter]:
            top_page.write(f"    * [{software}]({letter}/{software}.md)\n")
            letter_page.write(f" * [{software}]({software}.md)\n")

            versionsuffix = any(v['versionsuffix'] for v in processed[letter][software])

            software_page = open(letter_dir / f'{software}.md', 'w')
            software_page.write(f"# {software}\n\n")
            software_page.write(f"{processed[letter][software][0]['description']}\n\n")
            software_page.write(f"*homepage*: <{processed[letter][software][0]['homepage']}>\n\n")

            if versionsuffix:
                software_page.write("version | versionsuffix | toolchain\n")
                software_page.write("--------|---------------|----------\n")
            else:
                software_page.write("version | toolchain\n")
                software_page.write("--------|----------\n")

            for version in processed[letter][software]:
                software_page.write(f"``{version['version']}`` | ")
                if versionsuffix:
                    if version['versionsuffix']:
                        software_page.write(f"``{version['versionsuffix']}``")
                    software_page.write(" | ")
                software_page.write(f"``{version['toolchain']}``\n")

            software_page.close()

        letter_page.close()

    top_page.close()


def generate_markdown_pages(jsonfile, output_base, delete_existing):
    """
    Generate markdown
    :param jsonfile: input file (json file)
    :param output_base: base directory for output files
    :param delete_existing: delete the output directory (if it exists)
    """
    with open(jsonfile) as f:
        data = json.load(f)

    processed = defaultdict(lambda: defaultdict(list))
    for software in data:
        initial = software['name'][0].lower()
        if initial.isnumeric():
            initial = '0'
        processed[initial][software['name']].append(software)

    output_base_path = Path(output_base)

    if delete_existing and output_base_path.exists() and output_base_path.is_dir():
        shutil.rmtree(output_base_path)

    output_base_path.mkdir(parents=True)
    output_markdown(processed, output_base_path)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(prog='Software Markdown Pages',
                                     description='Generate Markdown pages of software from JSON file')
    parser.add_argument('-j', '--jsonfile', default='software.json', help='Input JSON file')
    parser.add_argument('-o', '--output-base', default='output', help='Base directory for output files')
    parser.add_argument('--delete-existing-output', action='store_true',
                        help='Delete output base directory (if it exists)')
    args = parser.parse_args()

    generate_markdown_pages(args.jsonfile, args.output_base, args.delete_existing_output)
