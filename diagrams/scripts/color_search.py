#!/usr/bin/env python3
"""
Selects the name of the color closest to the given target under L*a*b* color space.
"""
from __future__ import annotations

import collections
import json
import re
import sys
from collections.abc import Sequence
from dataclasses import InitVar, dataclass, field
from typing import Literal

import click
import numpy as np
import yaml
from skimage import color

COLOR_HEX_RE = re.compile(r'[0-9A-Fa-f]{6}')

WEB_COLORS = {
    'medium violet red': 'C71585',
    'deep pink': 'FF1493',
    'pale violet red': 'DB7093',
    'hot pink': 'FF69B4',
    'light pink': 'FFB6C1',
    'pink': 'FFC0CB',
    'dark red': '8B0000',
    'red': 'FF0000',
    'firebrick': 'B22222',
    'crimson': 'DC143C',
    'indian red': 'CD5C5C',
    'light coral': 'F08080',
    'salmon': 'FA8072',
    'dark salmon': 'E9967A',
    'light salmon': 'FFA07A',
    'orange red': 'FF4500',
    'tomato': 'FF6347',
    'dark orange': 'FF8C00',
    'coral': 'FF7F50',
    'orange': 'FFA500',
    'dark khaki': 'BDB76B',
    'gold': 'FFD700',
    'khaki': 'F0E68C',
    'peach puff': 'FFDAB9',
    'yellow': 'FFFF00',
    'pale goldenrod': 'EEE8AA',
    'moccasin': 'FFE4B5',
    'papaya whip': 'FFEFD5',
    'light goldenrod yellow': 'FAFAD2',
    'lemon chiffon': 'FFFACD',
    'light yellow': 'FFFFE0',
    'maroon': '800000',
    'brown': 'A52A2A',
    'saddle brown': '8B4513',
    'sienna': 'A0522D',
    'chocolate': 'D2691E',
    'dark goldenrod': 'B8860B',
    'peru': 'CD853F',
    'rosy brown': 'BC8F8F',
    'goldenrod': 'DAA520',
    'sandy brown': 'F4A460',
    'tan': 'D2B48C',
    'burlywood': 'DEB887',
    'wheat': 'F5DEB3',
    'navajo white': 'FFDEAD',
    'bisque': 'FFE4C4',
    'blanched almond': 'FFEBCD',
    'cornsilk': 'FFF8DC',
    'dark green': '006400',
    'green': '008000',
    'dark olive green': '556B2F',
    'forest green': '228B22',
    'sea green': '2E8B57',
    'olive': '808000',
    'olive drab': '6B8E23',
    'medium sea green': '3CB371',
    'lime green': '32CD32',
    'lime': '00FF00',
    'spring green': '00FF7F',
    'medium spring green': '00FA9A',
    'dark sea green': '8FBC8F',
    'medium aquamarine': '66CDAA',
    'yellow green': '9ACD32',
    'lawn green': '7CFC00',
    'chartreuse': '7FFF00',
    'light green': '90EE90',
    'green yellow': 'ADFF2F',
    'pale green': '98FB98',
    'teal': '008080',
    'dark cyan': '008B8B',
    'light sea green': '20B2AA',
    'cadet blue': '5F9EA0',
    'dark turquoise': '00CED1',
    'medium turquoise': '48D1CC',
    'turquoise': '40E0D0',
    'aqua': '00FFFF',
    'cyan': '00FFFF',
    'aquamarine': '7FFFD4',
    'pale turquoise': 'AFEEEE',
    'light cyan': 'E0FFFF',
    'navy': '000080',
    'dark blue': '00008B',
    'medium blue': '0000CD',
    'blue': '0000FF',
    'midnight blue': '191970',
    'royal blue': '4169E1',
    'steel blue': '4682B4',
    'dodger blue': '1E90FF',
    'deep sky blue': '00BFFF',
    'cornflower blue': '6495ED',
    'sky blue': '87CEEB',
    'light sky blue': '87CEFA',
    'light steel blue': 'B0C4DE',
    'light blue': 'ADD8E6',
    'powder blue': 'B0E0E6',
    'rebecca purple': '663399',
    'indigo': '4B0082',
    'purple': '800080',
    'dark magenta': '8B008B',
    'dark violet': '9400D3',
    'dark slate blue': '483D8B',
    'blue violet': '8A2BE2',
    'dark orchid': '9932CC',
    'fuchsia': 'FF00FF',
    'magenta': 'FF00FF',
    'slate blue': '6A5ACD',
    'medium slate blue': '7B68EE',
    'medium orchid': 'BA55D3',
    'medium purple': '9370DB',
    'orchid': 'DA70D6',
    'violet': 'EE82EE',
    'plum': 'DDA0DD',
    'thistle': 'D8BFD8',
    'lavender': 'E6E6FA',
    'misty rose': 'FFE4E1',
    'antique white': 'FAEBD7',
    'linen': 'FAF0E6',
    'beige': 'F5F5DC',
    'white smoke': 'F5F5F5',
    'lavender blush': 'FFF0F5',
    'old lace': 'FDF5E6',
    'alice blue': 'F0F8FF',
    'seashell': 'FFF5EE',
    'ghost white': 'F8F8FF',
    'honeydew': 'F0FFF0',
    'floral white': 'FFFAF0',
    'azure': 'F0FFFF',
    'mint cream': 'F5FFFA',
    'snow': 'FFFAFA',
    'ivory': 'FFFFF0',
    'white': 'FFFFFF',
    'black': '000000',
    'dark slate gray': '2F4F4F',
    'dim gray': '696969',
    'slate gray': '708090',
    'gray': '808080',
    'light slate gray': '778899',
    'dark gray': 'A9A9A9',
    'silver': 'C0C0C0',
    'light gray': 'D3D3D3',
    'gainsboro': 'DCDCDC',
}


@dataclass
class ClosestColorSelector:
    """
    Selects the name of the color closest to the given target under L*a*b* color space.
    """
    candidates: InitVar[dict[str, str]] = None
    illuminant: Literal['A', 'D50', 'D55', 'D65', 'D75', 'E'] = 'D65'
    observer: Literal['2', '10'] = '2'
    color_names: list[str] = field(init=False)
    precomputed_labs: np.ndarray = field(init=False)

    def __post_init__(self, candidates: dict[str, str] = None):
        candidates = candidates or WEB_COLORS
        self.color_names = list(candidates.keys())
        self.precomputed_labs = color.rgb2lab(
            [self.rgb_hex2float(c) for c in candidates.values()],
            illuminant=self.illuminant,
            observer=self.observer,
        )

    @classmethod
    def rgb_hex2float(cls, hex_value: str) -> tuple[float, float, float]:
        """
        Converts the given RGB color from a hexadecimal string
        into a triplet of floating point values within [0, 1]-range.
        """
        r = int(hex_value[0:2], base=16) / 255
        g = int(hex_value[2:4], base=16) / 255
        b = int(hex_value[4:6], base=16) / 255
        return r, g, b

    def closest_name(self, target_hex_value: str) -> str:
        """
        Selects the name of the pre-defined color
        closest to the given target under L*a*b* color space.
        """
        target = color.rgb2lab(self.rgb_hex2float(target_hex_value))
        deltas = self.precomputed_labs - target
        dist2 = np.einsum('ij,ij->i', deltas, deltas)
        index = int(np.argmin(dist2))
        return self.color_names[index]

    def closest_names(self, target_hex_values: Sequence[str]) -> dict[str, str]:
        """
        Same as closest_name but works for a sequence of target colors.
        Raises `ValueError` if duplicate names are found.
        """
        prelim_mapper = collections.defaultdict(list)
        for value in target_hex_values:
            name = self.closest_name(value)
            prelim_mapper[name].append(value)

        for name, hex_values in prelim_mapper.items():
            if len(hex_values) >= 2:
                hex_values = ', '.join(hex_values)
                raise ValueError(f"multiple hex values mapped to the same name {name}: {hex_values}")

        return {name: hex_values[0] for name, hex_values in prelim_mapper.items()}


def validate_hex_value(ctx, param, value):
    if COLOR_HEX_RE.fullmatch(value):
        return value
    raise click.BadParameter('color must be a 6-digit hexadecimal string')


@click.command()
@click.argument('hex_string', callback=validate_hex_value)
@click.option('--db', type=click.Path(exists=True, dir_okay=False, allow_dash=True),
              help="Path of JSON/YAML files containing mapping of color names to hex values "
                   "(defaults to using pre-defined, extended web colors")
@click.option('--illuminant', type=click.Choice(['A', 'D50', 'D55', 'D65', 'D75', 'E'], case_sensitive=False),
              default='D65', show_default=True, help="Name of illuminant for XYZ color coordinates")
@click.option('--observer', type=click.Choice(['2', '10']),
              default='2', show_default=True, help="Aperture angle of the observer")
def program(hex_string, db, illuminant, observer):
    """
    Selects the name of the color closest to the given HEX_STRING.
    """
    if db == '-':
        data = sys.stdin.read()
        try:
            candidates = json.loads(data)
        except ValueError:
            candidates = yaml.safe_load(data)
    elif db:
        with open(db) as fobj:
            if db.endswith('.json'):
                candidates = json.load(fobj)
            elif db.endswith(('.yaml', '.yml')):
                candidates = yaml.safe_load(fobj)
            else:
                raise ValueError("improper filename (expected *.json or *.yaml)")
    else:
        candidates = WEB_COLORS

    selector = ClosestColorSelector(candidates, illuminant, observer)
    name = selector.closest_name(hex_string)
    print(name)


if __name__ == '__main__':
    program()
