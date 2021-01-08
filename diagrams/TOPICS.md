# Help Topics

## Table of Contents

-   [Show IPE configurations](#show-ipe-configurations)
-   [Adding new stylesheet](#adding-new-stylesheet)
-   [Updating stylesheet](#updating-stylesheet)
-   [Master preamble](#master-preamble)
-   [Choosing text editor](#choosing-text-editor)


## Show IPE configuration

If you are wondering where to find system-wide directory of IPE,
the best way to figure out is to look at IPE configurations.

Select `Help > Show configuration` from the software menu
or use the following command in terminal:
```bash
$ ipe -show-configuration
```


## Adding new stylesheet

Select `Edit > Style sheets`
(shortcut: <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>S</kbd>)
and browse for a new `*.isy` file followed by clicking `Add`.

Another way is to use the following command from terminal:
```bash
$ ipescript add-style sheet.isy my-drawings.xml
```

Ideally, the added stylesheet file should be located 
within the same directory as the main `*.xml` (drawing) file 
so that stylesheet reloading is easier later own.


## Updating stylesheet

Any changes to a stylesheet file after it has been added to the main drawing file
will not be immediately reflected in the drawing file.
To force apply changes from the stylesheet to the main file,
you will need to tell IPE to do so for you.

Select `Edit > Update style sheets`
(shortcut: <kbd>Ctrl</kbd>+<kbd>Shift</kbd>+<kbd>U</kbd>) 
then do not forget to render the content again
with the `File > Run Latex` menu (shortcut: <kbd>Ctrl</kbd>+<kbd>L</kbd>).

Or from command line, type in the following:
```bash
$ ipescript update-styles my-drawings.xml
```


## Master preamble

This is a preferred way to add LaTeX preamble into an IPE document file.

First, write LaTeX preamble between `%%BeginIpePreamble` and `%%EndIpePreamble`
inside the `master-preamble.tex` file.
Then compile it into `master-preamble.isy` IPE stylesheet file
with the following command:
```bash
$ ipescript update-master master-preamble.tex
```

If you wish to also apply the stylesheet with existing IPE document:
```bash
$ ipescript update-master master-preamble.tex my-drawings.xml
```


## Choosing text editor

Before launching `ipe` software,
set the environment variable to `EDITOR=code`
(or other text editor of your choice; example uses Microsoft Visual Studio Code).
