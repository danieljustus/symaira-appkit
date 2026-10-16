#!/usr/bin/env python3
"""Vendor Phosphor icons (MIT) into SymairaTheme's asset catalog + manifest.

Usage: vendor-phosphor-icons.py <unpacked @phosphor-icons/core dir> <map.txt>
map.txt: one "<symairaCase> <phosphor-name>" per line.
"""
import json, shutil, sys
from pathlib import Path

src, mapping = Path(sys.argv[1]), Path(sys.argv[2])
root = Path(__file__).resolve().parent.parent
cat = root / "Sources/SymairaTheme/Resources/SymairaIcons.xcassets"
shutil.rmtree(cat, ignore_errors=True)
cat.mkdir(parents=True)
(cat / "Contents.json").write_text(json.dumps({"info": {"author": "xcode", "version": 1}}, indent=2))
manifest = {}
for line in mapping.read_text().split("\n"):
    if not line.strip():
        continue
    case, name = line.split()
    for weight, suffix, asset in (("regular", "", case), ("fill", "-fill", case + ".fill")):
        svg = src / "assets" / weight / f"{name}{suffix}.svg"
        d = cat / f"{asset}.imageset"
        d.mkdir()
        shutil.copy(svg, d / f"{asset}.svg")
        (d / "Contents.json").write_text(json.dumps({
            "images": [{"filename": f"{asset}.svg", "idiom": "universal"}],
            "info": {"author": "xcode", "version": 1},
            "properties": {"preserves-vector-representation": True, "template-rendering-intent": "template"},
        }, indent=2))
    manifest[case] = {"phosphor": name,
                      "regular": f"SymairaIcons.xcassets/{case}.imageset/{case}.svg",
                      "fill": f"SymairaIcons.xcassets/{case}.fill.imageset/{case}.fill.svg"}
out = root / "Sources/SymairaTheme/Resources/icons.json"
out.write_text(json.dumps(manifest, indent=2, sort_keys=True) + "\n")
shutil.copy(src / "LICENSE", root / "Sources/SymairaTheme/Resources/PHOSPHOR-LICENSE")
print(len(manifest), "icons")
