#!/usr/bin/env python3
"""
Run this script to transform a JSON file
which contains a mapping of color names to their color values.
Each color value must have one of the following formats:

-   A hexadecimal string of the form `#RGB` or `#RRGGBB`
-   A JSON array of three numbers;
    either all of them must be an integer between 0 and 255 (inclusive)
    or all of them must be a strict floating point value between 0.0 and 1.0
-   A JSON object with three required fields: red, green, and blue;
    either all fields must be an integer between 0 and 255 (inclusive)
    or all of them must be a strict floating point value between 0.0 and 1.0 (inclusive)
"""
import argparse
import json
import os
import re
import xml.etree.ElementTree as ET
from typing import Any, Dict, Tuple

FloatingRGB = Tuple[float, float, float]

COLOR_HEX_RE = re.compile(r'#([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})([0-9A-Fa-f]{2})')


def main():
    parser = argparse.ArgumentParser(description="Converts JSON color file to IPE stylesheet")
    parser.add_argument('input_file', help="Input JSON color file")
    parser.add_argument('output_file', nargs='?', help="Output IPE stylesheet (.isy) file to write")
    args = parser.parse_args()

    input_filename = args.input_file
    output_filename = args.output_file
    if output_filename is None:
        dirname, basename = os.path.split(input_filename)
        stem, _ = os.path.splitext(basename)
        output_filename = os.path.join(dirname, f"{stem}.isy")

    convert(input_filename, output_filename)


def convert(input_filename: str, output_filename: str):
    color_data = read_input_file(input_filename)
    stylesheet_name, _ = os.path.splitext(os.path.basename(output_filename))
    body_content = build_ipe_stylesheet_body(stylesheet_name, color_data)
    with open(output_filename, "wb") as fobj:
        fobj.write('<?xml version="1.0"?>\n'.encode('utf-8'))
        fobj.write('<!DOCTYPE ipestyle SYSTEM "ipe.dtd">\n'.encode('utf-8'))
        ET.ElementTree(body_content).write(fobj, 'utf-8')


def build_ipe_stylesheet_body(stylesheet_name: str, color_data: Dict[str, FloatingRGB]) -> ET.Element:
    """
    Constructs IPE stylesheet XML element.
    """
    root = ET.Element('ipestyle', dict(name=stylesheet_name))
    root.text = '\n'
    root.tail = '\n'
    for color_name, value in color_data.items():
        red, green, blue = value
        elem = ET.SubElement(root, 'color', dict(name=color_name, value=f'{red} {green} {blue}'))
        elem.tail = '\n'
    return root


def read_input_file(filename: str) -> Dict[str, FloatingRGB]:
    """
    Reads color JSON file.
    """
    with open(filename) as fobj:
        data = json.load(fobj)
    mapping = {}
    for name, value in data.items():
        try:
            mapping[name] = parse_rgb_color(value)
        except Exception as exc:
            raise ValueError(f"error while parsing {value!r} for {name}") from exc
    return mapping


def parse_rgb_color(value: Any) -> FloatingRGB:
    """
    Parses an RGB color item into a triplet of RGB components,
    each of which is a floating point inclusively between 0 and 1.
    """
    if isinstance(value, str):
        matchobj = COLOR_HEX_RE.fullmatch(value)
        if matchobj is None:
            raise ValueError(f"invalid hex string: {value!r}")
        red = int(matchobj[1], base=16)
        green = int(matchobj[2], base=16)
        blue = int(matchobj[3], base=16)
    elif isinstance(value, list):
        red, green, blue = value
    elif isinstance(value, dict):
        red, green, blue = value['red'], value['green'], value['blue']
    else:
        raise ValueError(f"unrecognized color format: {value!r}")

    colors = red, green, blue

    if all(isinstance(c, int) for c in colors):
        red, green, blue = (_sanitize_uint8(c) for c in colors)
    elif all(isinstance(c, float) for c in colors):
        red, green, blue = (_sanitize_unit_float(c) for c in colors)
    else:
        raise ValueError(f"unrecognized color format: {value!r}")

    return red, green, blue


def _sanitize_uint8(component: int) -> float:
    if not 0 <= component <= 255:
        raise ValueError(f"value out of range [0, 255]: {component!r}")
    return component / 255


def _sanitize_unit_float(component: float) -> float:
    if not 0 <= component <= 1:
        raise ValueError(f"value out of range [0.0, 1.0]: {component!r}")
    return component


if __name__ == '__main__':
    main()
