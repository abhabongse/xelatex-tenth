# XeLaTeX Template

Preconfigured template for XeLaTeX documents.
Codename `tenth` used to stand for for **T**emplate for **En**glish and **Th**ai as it was historically set up for pdfLaTeX, but no more!
It even supports more scripts with `fontspec` package.

Other preconfigurations are according to my own taste, of course.
Feel free to look at or modify `tenth.sty` as you wish.

## Fonts

This template is preconfigured with the following fonts: 

- [Google Font variant of Sarabun](https://github.com/cadsondemak/Sarabun) as the main font (represented as `\rmfamily`)
- [FiraGO](https://github.com/bBoxType/FiraGO) as the loopless font (represented as `\sffamily`)
- [FiraCode](https://github.com/tonsky/FiraCode) as the monospaced font (represented as `\ttfamily`)

In case you are wondering, all fonts mentioned above are released under [SIL Open Font License](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).

However, they are not provided along with this template.
You will need to visit each link provided above and download them to your machine.
See below for the exhaustive list of fonts filenames.

There are two possible places where you can put these font files:

1.  Inside `fonts/` subdirectory; in this particular case, you will also need to use `tenth` package with option `localfonts=true`.
    ```tex
    \usepackage[localfonts=true]{tenth}
    ```
2.  Installed normally into your computer, then include this package.
    ```tex
    \usepackage{tenth}
    ```

### List of font filenames

- `Sarabun-BoldItalic.ttf`
- `Sarabun-Bold.ttf`
- `Sarabun-ExtraBoldItalic.ttf`
- `Sarabun-ExtraBold.ttf`
- `Sarabun-ExtraLightItalic.ttf`
- `Sarabun-ExtraLight.ttf`
- `Sarabun-Italic.ttf`
- `Sarabun-LightItalic.ttf`
- `Sarabun-Light.ttf`
- `Sarabun-MediumItalic.ttf`
- `Sarabun-Medium.ttf`
- `Sarabun-Regular.ttf`
- `Sarabun-SemiBoldItalic.ttf`
- `Sarabun-SemiBold.ttf`
- `Sarabun-ThinItalic.ttf`
- `Sarabun-Thin.ttf`
- `FiraGO-BoldItalic.otf`
- `FiraGO-Bold.otf`
- `FiraGO-BookItalic.otf`
- `FiraGO-Book.otf`
- `FiraGO-ExtraBoldItalic.otf`
- `FiraGO-ExtraBold.otf`
- `FiraGO-ExtraLightItalic.otf`
- `FiraGO-ExtraLight.otf`
- `FiraGO-Italic.otf`
- `FiraGO-LightItalic.otf`
- `FiraGO-Light.otf`
- `FiraGO-MediumItalic.otf`
- `FiraGO-Medium.otf`
- `FiraGO-Regular.otf`
- `FiraGO-SemiBoldItalic.otf`
- `FiraGO-SemiBold.otf`
- `FiraCode-Bold.ttf`
- `FiraCode-Light.ttf`
- `FiraCode-Medium.ttf`
- `FiraCode-Regular.ttf`
- `FiraCode-SemiBold.ttf`
