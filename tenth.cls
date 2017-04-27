%% straightdoc.cls
%% Author: Abhabongse Janthong
%
% This document class provides preloaded most common packages and most common
% configurations of the document according to my own taste.
% It is released under MIT License because the author thinks that the
% LaTeX Project Public License is annoying and life is complicated.
\NeedsTeXFormat{LaTeX2e}[2016/02/01]
\ProvidesClass{straightdoc}[2017/04/24 v0.1 (Abhabongse Janthong)]

%%------------------------------------------------------------------
%%  Very important utility package
%%------------------------------------------------------------------
\RequirePackage{etoolbox}

%%------------------------------------------------------------------
%%  Define and process variables and options for this document
%%  class. This has to be done before base class is loaded.
%%------------------------------------------------------------------
\newbool{istwoside}  % whether 'twoside' option is loaded (default: false)
\DeclareOption{twoside}{%
    \booltrue{istwoside}%
    \PassOptionsToClass{twoside}{article}}

\newbool{isthai}  % whether the document is written in Thai
\DeclareOption{thai}{%
    \booltrue{isthai}}

\newbool{istypistdisabled}  % whether Thai Typist font should be disabled
\DeclareOption{notypist}{%
    \booltrue{istypistdisabled}}

\newbool{issansthai}  % whether use sans serif as default for Thai only
    \DeclareOption{sansthai}{%
    \booltrue{issansthai}}

%%  Pass along all other options not captured above
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%  Now load the base class
\LoadClass{article}

%%------------------------------------------------------------------
%%  Setup paper margin and marginnote command.
%%------------------------------------------------------------------
\RequirePackage[%
    top=1in,bottom=1in,outer=2.25in,inner=0.75in,heightrounded,%
    marginparwidth=1.5in, marginparsep=1.5pc]{geometry}

%%------------------------------------------------------------------
%%  Setup marginnote command.
%%------------------------------------------------------------------
\RequirePackage{marginnote}
% \newrobustcmd{\marginnote}[1]{\marginpar{%
%     \ifnumodd{\thepage}%
%         {\flushleft #1}%
%         {\ifbool{istwoside}{\flushright #1}{\flushleft #1}}}}

%%------------------------------------------------------------------
%%  Setup constant lengths for parts of document.
%%------------------------------------------------------------------
\RequirePackage{setspace}
\setstretch{1.17}
\setlength{\headheight}{27.5pt}
\setlength{\parskip}{0pc}
\setlength{\parindent}{2pc}

%%------------------------------------------------------------------
%%  Setup font families (including for math)
%%------------------------------------------------------------------
\RequirePackage[T1]{fontenc}
\RequirePackage{libertine}
\RequirePackage[varqu,varl]{inconsolata}
%% Include math fonts.
\RequirePackage{amsthm}
\RequirePackage[libertine]{newtxmath}
% \RequirePackage{lib­ert­i­nust1­math}

%% Setup font names
\newrobustcmd{\linuxlib}{LinuxLibertineT-TLF}
\newrobustcmd{\linuxbio}{LinuxBiolinumT-TLF}
\newrobustcmd{\inconsol}{zi4}

%% Setup Thai fonts is 'thai' option is specified.
\ifbool{isthai}{%
    \RequirePackage[thai]{babel}%
    \RequirePackage[utf8x]{inputenc}%
    \RequirePackage[rmnorasi,sflaksaman]{fonts-tlwg}%
    \renewcommand{\baselinestretch}{1.5}
    \renewrobustcmd{\englishrmdefault}{\linuxlib}%
    \renewrobustcmd{\englishsfdefault}{\linuxbio}%
    \renewrobustcmd{\englishttdefault}{\inconsol}%
    \ifbool{issansthai}{%
        \renewrobustcmd{\thaifamilydefault}{\thaisfdefault}}{}%
    \ifbool{istypistdisabled}{%
        \renewrobustcmd{\thaittdefault}{\inconsol}
        \renewrobustcmd{\ttfamily}{%
            \fontencoding{\latinencoding}%
            \fontfamily{\ttdefault}%
            \selectfont}}{}}{}

%% TODO: use relsize to control the scale of Thai fonts

%%------------------------------------------------------------------
%%  Load 'microtype' which is the best package ever
%%------------------------------------------------------------------
\RequirePackage[%
    activate={true,nocompatibility},final,tracking=true,letterspace=100,%
    kerning=true,spacing=true,factor=1150,stretch=15,shrink=15]{microtype}
\microtypecontext{spacing=nonfrench}
\SetExtraKerning[unit=space]%
    {encoding={*},family={\linuxlib},series={*},%
        size={footnotesize,small,normalsize}}%
    {\textendash={600,600},      % en-dash, add more space around it
     \textemdash={600,600},      % en-dash, add more space around it
     "28={,150},                 % left bracket, add space from right
     "29={150,},                 % right bracket, add space from left
     \textquotedblleft={,150},   % left quotation mark, space from right
     \textquotedblright={150,}}  % right quotation mark, space from left

%% TODO: clean-up code below

% %% Include this package for better font selection
% % \RequirePackage{libertine}
% %% Include math fonts.
% \RequirePackage{amsthm}
% % \RequirePackage[libertine]{newtxmath}
% % \renewcommand*\ttdefault{cmtt}
% % \RequirePackage[T1]{fontenc}
%
% %% LANGUAGE: thai
% \RequirePackage[main=thai,english]{babel}
% \RequirePackage[utf8x]{inputenc}
% \RequirePackage[sans,rmnorasi,sflaksaman]{fonts-tlwg}
% \RequirePackage{inconsolata}
% \RequirePackage[libertine]{newtxmath}
% \RequirePackage[T1]{fontenc}
% \DeclareRobustCommand{\en}{\selectlanguage{english}}
%
% %% THE MOST AWESOME PACKAGE AVARRR!
% \RequirePackage[
%     activate={true,nocompatibility},final,tracking=true,letterspace=250,
%     kerning=true,spacing=true,factor=1100,stretch=15,shrink=15]{microtype}
% \microtypecontext{spacing=nonfrench}
%
% %% Include this package to be able to set font colors
% \RequirePackage[usenames,dvipsnames]{color}
% \RequirePackage[dvipsnames]{xcolor}
% \definecolor{VeryLightGrayBackground}{gray}{0.96875}
% \definecolor{LightGrayBackground}{gray}{0.9375}
% \definecolor{DarkGray}{gray}{0.25}
% \definecolor{Gray}{gray}{0.5}
% \definecolor{LightGray}{gray}{0.75}
% \definecolor{ShadeColor}{gray}{0.9}
% \definecolor{BorderColor}{gray}{0.8}
% \definecolor{ProcessBlue}{cmyk}{0.96,0,0,0}
%
% %% Include necessary math packages
% \RequirePackage{amsmath, amssymb, amsfonts, mathtools, chemarrow}
% \RequirePackage{fdsymbol}
% \RequirePackage{mdframed}
% \renewcommand\qedsymbol{$\blacksquare$}
%
%
% %% Framed environment
% \mdfdefinestyle{standard}{backgroundcolor=LightGrayBackground,linecolor=BorderColor}
% \mdfdefinestyle{codebox}{innertopmargin=0em,skipabove=0.75em}
%
% \let\orig@maketag@@@\maketag@@@
% \renewcommand{\eqref}[1]{\textup{\let\maketag@@@\orig@maketag@@@\tagform@{\ref{#1}}}}
% \def\maketag@@@#1{\hbox{\rlap{\kern\marginparsep\m@th\normalfont#1}\kern1sp}}
% \makeatother
%
% \theoremstyle{plain}
%   \newtheorem{theorem}{Theorem}[section]
%   \newtheorem{lemma}[theorem]{Lemma}
%   \newtheorem{corollary}[theorem]{Corollary}
%   \newtheorem{claim}[theorem]{Claim}
%   \newtheorem{observation}[theorem]{Observation}
%   \newtheorem{conjecture}[theorem]{Conjecture}
%   \newtheorem{fact}[theorem]{Fact}
%
% \theoremstyle{definition}
%   \newtheorem{definition}[theorem]{Definition}
%     \renewcommand{\enddefinition}{\hfill$\Diamond$\endtrivlist}
%   \newtheorem{example}[theorem]{Example}
%   \newtheorem{protocol}[theorem]{Protocol}
%   \newtheorem{game}[theorem]{Game}
%   \newmdtheoremenv[style=standard,innertopmargin=0em]{question}{Question}[section]
%
% \theoremstyle{remark}
%   \newtheorem{remark}[theorem]{Remark}
%     \renewcommand{\endremark}{\hfill$\Diamond$\endtrivlist}
%   \newtheorem{note}[theorem]{Note}
%   \newtheorem{hint}[theorem]{Hint}
%
%
% %% Include this package to be able to set the line space
% \RequirePackage{setspace}
% \setstretch{1.333}
%
% %% Include this package to be able to insert .eps file
% \RequirePackage[pdftex]{graphicx}
%
% %% Include this package to use more symbols
% \RequirePackage{textcomp}
%
% %% Include this package to customize item numbers
% %\RequirePackage{enumerate}
% \RequirePackage{enumitem}
% \RequirePackage{alphalph}
% \setlist[enumerate,1]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=0em}
% \setlist[itemize,1]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=0em}
% \setlist[description,1]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=-2em}
% \setlist[enumerate,2]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=0em}
% \setlist[itemize,2]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=0em}
% \setlist[description,2]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=-2em}
% \setlist[enumerate,3]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=0em}
% \setlist[itemize,3]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=0em}
% \setlist[description,3]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=-2em}
% \setlist[enumerate,4]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=0em}
% \setlist[itemize,4]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=0em}
% \setlist[description,4]{topsep=1em, partopsep=0em, parsep=0em, itemsep=1em, listparindent=2em, itemindent=-2em}
%
% %% Extra enumerate labels
% \makeatletter
% \newcommand*{\single@thai}[1]{%
%   \expandafter\@single@thai\csname c@#1\endcsname%
% }
% \newcommand*{\@single@thai}[1]{%
%   \ifcase#1\orก\orข\orค\orฆ\orง\orจ\orฉ\orช\orซ\orฌ\orญ\orฎ\orฏ\orฐ\orฑ\orฒ\orณ\orด\orต\orถ\orท\orธ\orน\orบ\orป\orผ\orฝ\orพ\orฟ\orภ\orม\orย\orร\orล\orว\orศ\orษ\orส\orห\orฬ\orอ\orฮ\else\@ctrerr\fi%
% }
% \newalphalph{\@thai}[alph]{\@single@thai}{24}
% \newcommand*{\thai}[1]{%
%   \expandafter\@thai\csname c@#1\endcsname%
% }
% \AddEnumerateCounter{\thai}{\@thai}{ณ}
%
%
% %% Include this package for professional table style
% \RequirePackage{array, booktabs}
%
% %% Include this package for different styles of a figure
% \RequirePackage[margin=1em, font={footnotesize,sf}, labelfont=bf, labelsep=period, format=plain, indention=1em, justification=justified]{caption}
% \RequirePackage{subcaption}
% % \DeclareCaptionFormat{llap}{\llap{#1#2}#3\par}
% % \captionsetup{format=llap,labelsep=quad,singlelinecheck=no}
%
% %% Include this package for formatting the date and time
% \RequirePackage{datetime}
%
% %% Include this package to allow verbatim input
% \RequirePackage{fancyvrb}
%
% %% Include this package to include beautiful pseudocode
% \RequirePackage{clrscode3e}
%
% %% Include the code formatter.
% \RequirePackage{listings}
% \lstset{
%   % Basic Settings
%   basicstyle=\footnotesize\ttfamily,
%   captionpos=b,
%   % Margins and Background
%   xleftmargin=3em,
%   xrightmargin=1em,
%   rulesep=1em,
%   framextopmargin=5em,
%   framexbottommargin=5em,
%   framexleftmargin=1em,
%   framexrightmargin=1em,
%   backgroundcolor=\color{LightGrayBackground},
%   % Spacing and Horizontal Flow
%   showspaces=false,
%   showstringspaces=false,
%   showtabs=false,
%   tabsize=2,
%   breaklines=true,
%   columns=fullflexible,
%   keepspaces=true,
%   % Vertical Flow
%   aboveskip=\bigskipamount,
%   belowskip=\bigskipamount,
%   lineskip=0.00001pt,
%   % Line Numbers
%   stepnumber=1,
%   numbers=left,
%   numbersep=2em,
%   numberstyle=\ttfamily\color{Gray},
%   % Special Keyword Format
%   stringstyle=\color{Maroon},
%   keywordstyle=\color{NavyBlue},
%   keywordstyle={[2]\color{teal}},
%   commentstyle=\color{ForestGreen},
%   extendedchars=true
%  }
% \lstdefinelanguage{pseudocode}{
%     morekeywords={,if,then,else,while,do,end,loop,until,for,to,downto,return,print,def},
%     morekeywords={[2],true,false},
%     sensitive=false,
%     morestring=[b]",
%     morecomment=[l]{//},
%   }
%
% %% Include this package for a fancy header
% \RequirePackage{fancyhdr}
% \RequirePackage{lastpage}
% % Reset the header and footer
% \pagestyle{fancy}
% \fancyhead{} % clear all header fields
% \fancyhead[L]{\sffamily\small \topleft \\ \bottomleft}
% \fancyhead[R]{\sffamily\small \topright \\ \bottomright}
% \fancyhead[C]{}
% \fancyfoot{} % clear all footer fields
% \fancyfoot[L]{}
% \fancyfoot[R]{\sffamily\small \thepage}
% \fancyfoot[C]{}
% \renewcommand{\headrulewidth}{0pt}
% \renewcommand{\footrulewidth}{0pt}
% \setlength{\parskip}{0pt}
% \setlength{\parindent}{2em}
%
% %% Set the title, author, and date
% \title{}
% \author{}
% \date{}
%
% %% Spaces
% \DeclareRobustCommand{\HairSp}{\ifmmode\mskip1mu\else\kern0.0625em\fi}
%
% %% Mathematical symbol
% \DeclareRobustCommand{\Algebraic}{\mathbb{A}}
% \DeclareRobustCommand{\Complex}{\mathbb{C}}
% \DeclareRobustCommand{\Field}{\mathbb{F}}
% \DeclareRobustCommand{\N}{\mathbb{N}}
% \DeclareRobustCommand{\Q}{\mathbb{Q}}
% \DeclareRobustCommand{\R}{\mathbb{R}}
% \DeclareRobustCommand{\Z}{\mathbb{Z}}
%
% \DeclareRobustCommand{\ol}[1]{\overline{#1}}
%
% \DeclareRobustCommand{\hl}[1]{\mathchoice%
%   {\colorbox{Goldenrod!30}{\color{black}$\displaystyle#1$}}%
%   {\colorbox{Goldenrod!30}{\color{black}$\textstyle#1$}}%
%   {\colorbox{Goldenrod!30}{\color{black}$\scriptstyle#1$}}%
%   {\colorbox{Goldenrod!30}{\color{black}$\scriptscriptstyle#1$}}}
% \DeclareRobustCommand{\bhl}[1]{\mathchoice%
%   {\colorbox{LimeGreen!30}{\color{black}$\displaystyle#1$}}%
%   {\colorbox{LimeGreen!30}{\color{black}$\textstyle#1$}}%
%   {\colorbox{LimeGreen!30}{\color{black}$\scriptstyle#1$}}%
%   {\colorbox{LimeGreen!30}{\color{black}$\scriptscriptstyle#1$}}}
% \DeclareRobustCommand{\grayed}[1]{\mathchoice%
%   {\colorbox{VeryLightGrayBackground}{\color{Gray}$\displaystyle#1$}}%
%   {\colorbox{VeryLightGrayBackground}{\color{Gray}$\textstyle#1$}}%
%   {\colorbox{VeryLightGrayBackground}{\color{Gray}$\scriptstyle#1$}}%
%   {\colorbox{VeryLightGrayBackground}{\color{Gray}$\scriptscriptstyle#1$}}}
%
% \DeclareRobustCommand{\colorsq}[1]{{\color{#1}\rule{0.625em}{0.625em}}}
% \DeclareRobustCommand{\redsq}{\colorsq{red}}
% \DeclareRobustCommand{\greensq}{\colorsq{green}}
% \DeclareRobustCommand{\bluesq}{\colorsq{blue}}
%
% %% Drawings
% \RequirePackage{tikz}
% \RequirePackage[usenames,dvipsnames]{pstricks}
% \RequirePackage{epsfig,pst-grad,pst-plot}
% \usetikzlibrary{positioning}
%
% %% Unfinished tag
% \DeclareRobustCommand{\unfinished}{\colorbox{red}{\sffamily\bfseries\color{white}unfinished}}
%
% %% Include this package to allow cross-reference hyperlink
% %% PEOPLE SAY THIS SHOULD BE ADDED LAST
% \RequirePackage[bookmarks=true,pdftex]{hyperref}
