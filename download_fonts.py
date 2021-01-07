#!/usr/bin/env python3
import os
import shutil
import sys
from urllib.parse import urlsplit
from urllib.request import urlopen

FONT_URLS = [
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-Thin.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-ThinItalic.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-ExtraLight.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-ExtraLightItalic.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-Light.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-LightItalic.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-Regular.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-Italic.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-Medium.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-MediumItalic.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-SemiBold.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-SemiBoldItalic.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-Bold.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-BoldItalic.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-ExtraBold.ttf',
    'https://github.com/cadsondemak/Sarabun/raw/master/fonts/Sarabun-ExtraBoldItalic.ttf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Roman/FiraGO-ExtraLight.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Italic/FiraGO-ExtraLightItalic.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Roman/FiraGO-Light.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Italic/FiraGO-LightItalic.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Roman/FiraGO-Book.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Italic/FiraGO-BookItalic.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Roman/FiraGO-Regular.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Italic/FiraGO-Italic.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Roman/FiraGO-Medium.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Italic/FiraGO-MediumItalic.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Roman/FiraGO-SemiBold.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Italic/FiraGO-SemiBoldItalic.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Roman/FiraGO-Bold.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Italic/FiraGO-BoldItalic.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Roman/FiraGO-ExtraBold.otf',
    'https://github.com/bBoxType/FiraGO/raw/master/Fonts/FiraGO_OTF_1001/Italic/FiraGO-ExtraBoldItalic.otf',
    'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Light.ttf',
    'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Regular.ttf',
    'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Medium.ttf',
    'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-SemiBold.ttf',
    'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Bold.ttf',
    'https://github.com/tonsky/FiraCode/raw/master/distr/ttf/FiraCode-Retina.ttf',
]


def download_file(url):
    # Create local file path
    split_result = urlsplit(url)
    this_dir = os.path.dirname(os.path.abspath(__file__))
    local_path = os.path.join(this_dir, 'fonts', os.path.basename(split_result.path))

    # Ensure that directory exists
    os.makedirs(os.path.dirname(local_path), exist_ok=True)

    # Actual downloading
    print(f"Downloading to fonts/ directory: {url}", file=sys.stderr)
    with urlopen(url) as response, open(local_path, 'wb') as fobj:
        shutil.copyfileobj(response, fobj)


if __name__ == '__main__':
    for font_url in FONT_URLS:
        download_file(font_url)
