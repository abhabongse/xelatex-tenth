%% tenth.cls
%% Author: Abhabongse Janthong
%
% This document class provides preloaded most common packages and most common
% configurations of the document according to my own taste.
%
% It is released under MIT License because the author thinks that the
% LaTeX Project Public License is annoying and life is complicated.
\NeedsTeXFormat{LaTeX2e}[2016/02/01]
\ProvidesClass{tenth}[2017/04/28 v0.1.1 (Abhabongse Janthong)]

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

\newbool{isthmsec}  % whether theorem env will have section numbering
\DeclareOption{thmsec}{%
    \booltrue{isthmsec}}

%%  Pass along all other options not captured above
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptions\relax

%%  Now load the base class
\LoadClass{article}

%%------------------------------------------------------------------
%%  Setup paper margin and marginnote command.
%%------------------------------------------------------------------
\RequirePackage[%
    top=1in,bottom=1in,outer=1.75in,inner=1in,heightrounded,%
    marginparwidth=1.25in, marginparsep=1pc]{geometry}

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
\setstretch{1.2}
\setlength{\headheight}{27.5pt}
\setlength{\parskip}{0pc}
\setlength{\parindent}{2pc}
\setlength{\abovedisplayskip}{0.75pc}
\setlength{\belowdisplayskip}{0.75pc}

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
    \renewcommand{\baselinestretch}{1.333}
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

%%------------------------------------------------------------------
%%  Setup color choices
%%------------------------------------------------------------------
\RequirePackage[dvipsnames,svgnames,table,fixpdftex,hyperref]{xcolor}
\definecolor{VeryDarkGray}{gray}{0.1}
\definecolor{DarkGray}{gray}{0.25}
\definecolor{Gray}{gray}{0.5}
\definecolor{LightGray}{gray}{0.65}
\definecolor{VeryLightGray}{gray}{0.9}
\definecolor{GrayBG}{gray}{0.9}
\definecolor{LightGrayBG}{gray}{0.935}
\definecolor{VeryLightGrayBG}{gray}{0.97}
\definecolor{DarkLavender}{rgb}{0.45,0.31,0.59}
\definecolor{DeepCarrotOrange}{rgb}{0.88,0.38,0.14}
\definecolor{Fandango}{rgb}{0.71,0.2,0.54}

% Color settings for mdframed
\definecolor{ShadeColor}{gray}{0.935}
\definecolor{BorderColor}{gray}{0.785}

% Color settings for listings
\colorlet{PrimaryKeyword}{MidnightBlue!80}
\colorlet{SecondaryKeyword}{teal!90}
\colorlet{Identifier}{DeepCarrotOrange}
\colorlet{String}{red}
\colorlet{Comment}{ForestGreen!90}

% Commands for colored squares
\newrobustcmd{\colorsq}[1]{{%
    \hspace{0.1pc}\color{#1}\rule[-0.02pc]{0.6pc}{0.6pc}\hspace{0.1pc}}}
\newrobustcmd{\redsq}{\colorsq{red}}
\newrobustcmd{\greensq}{\colorsq{green}}
\newrobustcmd{\bluesq}{\colorsq{blue}}

%%------------------------------------------------------------------
%%  Setup math equations and symbols
%%------------------------------------------------------------------
\RequirePackage{amsmath, amssymb, amsfonts}
\RequirePackage{mathtools}
\RequirePackage{chemarrow}
\RequirePackage{fdsymbol}  % nicer looking standard symbols
\RequirePackage{textcomp}
\renewrobustcmd{\qedsymbol}{$\blacksquare$}

%%------------------------------------------------------------------
%%  Setup mdframed environment
%%------------------------------------------------------------------
\RequirePackage{mdframed}
\mdfdefinestyle{standard}{%
    backgroundcolor=ShadeColor,linecolor=BorderColor,%
    skipabove=0.75pc,skipbelow=0.25pc}
\mdfdefinestyle{mathbox}{%
    backgroundcolor=ShadeColor,linecolor=BorderColor,%
    skipabove=0.75pc,skipbelow=0.25pc,innertopmargin=0pc}

%%------------------------------------------------------------------
%%  Setup math theorem environments
%%------------------------------------------------------------------
\theoremstyle{plain}
    \ifbool{isthmsec}{%
        \newmdtheoremenv[style=mathbox]{theorem}{Theorem}[section]}%
    {%else
        \newmdtheoremenv[style=mathbox]{theorem}{Theorem}}
    \newmdtheoremenv[style=mathbox]{lemma}[theorem]{Lemma}
    \newmdtheoremenv[style=mathbox]{proposition}[theorem]{Proposition}
    \newmdtheoremenv[style=mathbox]{corollary}[theorem]{Corollary}
    \newmdtheoremenv[style=mathbox]{claim}[theorem]{Claim}
    \newmdtheoremenv[style=mathbox]{conjecture}[theorem]{Conjecture}

\theoremstyle{definition}
    \newmdtheoremenv[style=mathbox]{definition}[theorem]{Definition}
    \newmdtheoremenv[style=mathbox]{fact}[theorem]{Fact}
    \newmdtheoremenv[style=mathbox]{example}[theorem]{Example}
    \newmdtheoremenv[style=mathbox]{question}[theorem]{Question}
    \newmdtheoremenv[style=mathbox]{problem}[theorem]{Problem}

\theoremstyle{remark}
    \newtheorem*{remark}{Remark}
    \renewcommand{\endremark}{\hfill$\Diamond$\endtrivlist}
    \newtheorem*{note}{Note}
    \newtheorem*{hint}{Hint}

%%------------------------------------------------------------------
%%  Enumeration package
%%------------------------------------------------------------------
\RequirePackage{enumitem}
\RequirePackage{alphalph}
\ifbool{isthai}{%
    \RequirePackage{thaienum}}{} % local package supporting Thai labels
\setlist[enumerate,1]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[itemize,1]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[description,1]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=-2pc}
\setlist[enumerate,2]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[itemize,2]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[description,2]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=-2pc}
\setlist[enumerate,3]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[itemize,3]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[description,3]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=-2pc}
\setlist[enumerate,4]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[itemize,4]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[description,4]{%
    topsep=1pc,partopsep=0pc,parsep=0pc,itemsep=1pc,listparindent=2pc,%
    itemindent=-2pc}

%%------------------------------------------------------------------
%%  Professional looking tabular styles
%%------------------------------------------------------------------
\RequirePackage{array, booktabs}

%%------------------------------------------------------------------
%%  Graphics and figures packages
%%------------------------------------------------------------------
\RequirePackage[pdftex]{graphicx}
\RequirePackage[%
    margin=2pc,font={footnotesize,sf},labelfont={bf},labelsep=period,%
    format=plain,indention=2pc,justification=justified]{caption}
\RequirePackage{subcaption}
% \DeclareCaptionFormat{llap}{\llap{#1#2}#3\par}
% \captionsetup{format=llap,labelsep=quad,singlelinecheck=no}

%%------------------------------------------------------------------
%%  Code listings package and settings
%%------------------------------------------------------------------
\RequirePackage{listings}
\lstset{%
    % Basic Settings
    basicstyle={\footnotesize\ttfamily\color{VeryDarkGray}{}},%
    captionpos=b,%
    % Margins and Background
    xleftmargin=0.5pc,%
    xrightmargin=0.5pc,%
    rulesep=2pc,%
    frame=trbl,%
    framesep=0.5pc,%
    framextopmargin=0pc,%
    framexbottommargin=0pc,%
    framexleftmargin=0.125pc,%
    framexrightmargin=0pc,%
    backgroundcolor=\color{ShadeColor},%
    rulecolor=\color{BorderColor},%
    % Spacing and Horizontal Flow
    showspaces=false,%
    showstringspaces=false,%
    showtabs=false,%
    tabsize=2,%
    breaklines=true,%
    columns=fullflexible,%
    keepspaces=true,%
    % Vertical Flow
    aboveskip=\bigskipamount,%
    belowskip=\bigskipamount,%
    lineskip=0.0001pt,
    % Line Numbers
    stepnumber=1,%
    numbers=left,%
    numbersep=1.25pc,%
    numberstyle=\ttfamily\color{Gray},%
    % Special Keyword Format
    stringstyle=\color{String},%
    commentstyle=\color{Comment},%
    identifierstyle=\color{Identifier},%
    keywordstyle=[1]{\bfseries\color{PrimaryKeyword}},%
    keywordstyle=[2]{\bfseries\color{SecondaryKeyword}},%
    extendedchars=true}

\lstdefinelanguage{pseudocode}{%
    morekeywords={[1],if,then,else,while,do,end,loop,until,for,to,downto,%
        return,print,def},%
    morekeywords={[2],true,false,null,nil},%
    sensitive=false,%
    morestring=[b]",%
    morestring=[b]',%
    morecomment=[l]{//}}

%%------------------------------------------------------------------
%%  Page header package and settings
%%------------------------------------------------------------------
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}
\newrobustcmd{\innerheader}{}  % renew to set inner header
\newrobustcmd{\outerheader}{}  % renew to set outer header

% Set up page header and footer for first page
\fancypagestyle{plain}{%
    \fancyhf{}  % clear all header and footer fields
    \fancyfoot[R]{\sffamily\small \thepage}}

% Set up page header and footer for all other pages
\fancyhf{}  % clear all header and footer fields
\fancyhead[LO,RE]{\sffamily\small \innerheader}
\fancyhead[LE,RO]{\sffamily\small \outerheader}
\fancyfoot[LE,RO]{\sffamily\small \thepage}
\pagestyle{fancy}

% Remove lines
\renewrobustcmd{\headrulewidth}{0pt}
\renewrobustcmd{\footrulewidth}{0pt}

%%------------------------------------------------------------------
%%  Additional definitions
%%------------------------------------------------------------------
% Define hair space
\newrobustcmd{\hrsp}{\ifmmode\mskip1mu\else\kern0.0625em\fi}

% Define shorthands for mathematical sets
\newrobustcmd{\Algebraic}{\mathbb{A}}
\newrobustcmd{\Complex}{\mathbb{C}}
\newrobustcmd{\Field}{\mathbb{F}}
\newrobustcmd{\N}{\mathbb{N}}
\newrobustcmd{\Q}{\mathbb{Q}}
\newrobustcmd{\R}{\mathbb{R}}
\newrobustcmd{\Z}{\mathbb{Z}}

% Define shorthand for overline
\newrobustcmd{\ol}{\overline}

% Define shorthand for blocks
\newrobustcmd{\hl}[2][LightGrayBG]{%
    \ifmmode{\mathchoice%
        {\colorbox{#1}{$\displaystyle #2$}}%
        {\colorbox{#1}{$\textstyle #2$}}%
        {\colorbox{#1}{$\scriptstyle #2$}}%
        {\colorbox{#1}{$\scriptscriptstyle #2$}}}%
    \else%
        {\colorbox{#1}{#2}}%
    \fi}
\newrobustcmd{\rhl}[1]{\hl[Red!20]{#1}}
\newrobustcmd{\ghl}[1]{\hl[LimeGreen!30]{#1}}
\newrobustcmd{\bhl}[1]{\hl[ProcessBlue!30]{#1}}
\newrobustcmd{\yhl}[1]{\hl[Goldenrod!30]{#1}}

% Define some more math operators
\DeclareMathOperator{\sgn}{sgn}
\DeclareMathOperator*{\argmax}{arg{\hrsp}max}
\DeclareMathOperator*{\argmin}{arg{\hrsp}min}

%%------------------------------------------------------------------
%%  Tikz package for drawing
%%------------------------------------------------------------------
% These are no longer included since it returns lots of errors/warnings
% \RequirePackage{tikz}
% \RequirePackage{pstricks}
% \RequirePackage{epsfig,pst-node}
% \RequirePackage{pst-grad,pst-plot}
% \usetikzlibrary{positioning}

%%------------------------------------------------------------------
%%  Final hyperref package
%%------------------------------------------------------------------
% Include this package to allow cross-reference hyperlink
% PEOPLE SAY THIS SHOULD BE ADDED LAST
\RequirePackage[bookmarks=true,pdftex]{hyperref}
