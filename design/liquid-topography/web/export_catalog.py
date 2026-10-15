#!/usr/bin/env python3
"""Export the component catalogue as a standalone, offline HTML file.

Run build.py first. The source remains web/catalog.html plus generated tokens;
this export is a disposable user-facing preview, never another token source.
"""
from pathlib import Path
import sys

root = Path(__file__).resolve().parent
if len(sys.argv) != 2:
    raise SystemExit('Usage: python3 web/export_catalog.py /absolute/output.html')
html = (root / 'catalog.html').read_text()
css = (root.parent / 'dist/tokens.css').read_text()
link = '<link rel="stylesheet" href="../dist/tokens.css">'
if html.count(link) != 1:
    raise SystemExit('Expected one generated stylesheet link; refusing ambiguous export')
output = Path(sys.argv[1]).expanduser().resolve()
if output == root / 'catalog.html':
    raise SystemExit('Export must not overwrite the source catalogue')
output.parent.mkdir(parents=True, exist_ok=True)
output.write_text(html.replace(link, '<!-- Generated offline preview; edit the kit source instead. -->\n<style>\n'+css+'\n</style>'))
print(output)
