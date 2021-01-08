# XeLaTeX Template

Preconfigured template for XeLaTeX documents.
Codename `tenth` used to stand for for **T**emplate for **En**glish and **Th**ai 
as it was historically set up for pdfLaTeX, but no more!
It even supports more scripts with `fontspec` package.

Other preconfigurations are according to my own taste, of course.
Feel free to look at or modify `tenth.sty` as you wish.


## Diagrams

Please see [a separate README](diagrams/README.md)
on how to use the software called IPE
to draw diagrams and embed them in XeLaTeX documents. 


## Fonts

This template is preconfigured with the following fonts: 

-   [Google Font variant of Sarabun](https://github.com/cadsondemak/Sarabun) 
    as the main font (represented as `\rmfamily`)
-   [FiraGO](https://github.com/bBoxType/FiraGO)
    as the loopless font (represented as `\sffamily`)
-   [FiraCode](https://github.com/tonsky/FiraCode)
    as the monospaced font (represented as `\ttfamily`)

In case you are wondering, all fonts mentioned above are released 
under [SIL Open Font License](https://scripts.sil.org/cms/scripts/page.php?site_id=nrsi&id=OFL).
See below for the exhaustive list of fonts filenames.

However, these font files do not come with this template;
you will need to download them either by visiting each link provided above,
or simply use the prepared download script:
```bash
$ ./download_fonts.py
```

Next, you have two options of what to do with the downloaded fonts:
1.  Keep them inside `fonts/` directory.
    For this particular case, you will need to supply the `localfonts=true`
    to the loading of `tenth` xelatex package:
    ```tex
    \usepackage[localfonts=true]{tenth}
    ```
2.  Install them (located in `fonts/` directory) into your computer,
    and include the following package:
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
