import os
from pathlib import Path

src_base = 'src'
out_base = os.path.join('docs', 'content', 'api')

template = """# {method}

@pydoc {method}

{menu}
"""


for root, dirs, files in os.walk(src_base, followlinks=True):
    if root.endswith('__pycache__') or root == src_base or root.endswith('scripts'):
        continue

    output = root.replace(src_base, out_base)
    method = root.replace(src_base, '')[1:].replace('/', '.')
    Path(output).mkdir(parents=True, exist_ok=True)

    menu = []
    for directory in dirs:
        if directory == '__pycache__' or directory == 'scripts':
            continue

        menu.append(f"* [`{method}.{directory}`]({directory})")

    for file in files:
        if file == '__init__.py':
            continue

        filename = file.replace('.py', '')
        menu.append(f"* [`{method}.{filename}`]({filename}.md)")

        with open(os.path.join(output, f'{filename}.md'), 'w') as f:
            f.write(template.format(method=f'{method}.{filename}', menu=''))

    with open(os.path.join(output, 'index.md'), 'w') as f:
        f.write(template.format(method=method, menu="\n".join(menu)))

