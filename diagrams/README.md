# IPE Stylesheets

A curated collection of [IPE](http://ipe.otfried.org/) stylesheets 
and other utility files to help kickstart creating a new IPE drawing.

Everything inside this `diagrams/` subdirectory is self-contained
and is independent from the root of the repository.

## What is IPE?

IPE is the vector graphics editing software developed by Prof. Otfried Cheong.
It specializes in drawing geometrical shapes and diagrams for the mathematically inclined.
It can also render LaTeX code and is powerful enough to create full-fledged presentation PDF. [So please give this a try!](http://ipe.otfried.org/)


## Color Choices

New versions of IPE comes with stylesheet with pre-defined colors
from [`xcolor`](https://www.ctan.org/pkg/xcolor) LaTeX package
(particularly those provided via `svgnames` and `x11names` options).
They are available as `colors.isy` stylesheet
which is located in system-wide stylesheet directory
and is _not_ loaded by default.
Include them as stylesheet in your IPE document
and these colors will be available in the drop-down menus.

[Follow this step](TOPICS.md#show-ipe-configuration)
to see where the system-wide directory for IPE is located 
and do not forget to  [add them to your document file](TOPICS.md#adding-new-stylesheet) as well.


## Presentation

:warning: Stylesheet `presentation-16x9.isy` is undergoing makeover
and is not yet ready for development.


## Best Practice

-   All stylesheets (`*.isy`) should be put within the same directory
    as the main drawing file (`*.ipe`).
-   Use master preamble to embed custom LaTeX definitions into main drawing file.
-   More will be updated soon.


## Help Topics

[Go to a separate page.](TOPICS.md)
