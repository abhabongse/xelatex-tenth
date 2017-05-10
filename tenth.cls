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

%%  Whether 'twoside' option is loaded (default: false)
\newbool{istwoside}
\DeclareOption{twoside}{%
    \booltrue{istwoside}%
    \PassOptionsToClass{twoside}{article}}

%%  Whether the document is written in Thai
\newbool{isthai}
\DeclareOption{thai}{%
    \booltrue{isthai}}

%%  Whether use serif as default instead of sans-serif (for Thai only)
%$  This takes no effect is `thai` option is not specified
\newbool{isthaiserif}
\DeclareOption{thaiserif}{%
    \booltrue{isthaiserif}}

%%  Whether thai numbering should be used for pages, sections,
%%  and enumeration by default
%$  This takes no effect is `thai` option is not specified
\newbool{isthainumbering}
\DeclareOption{thainumbering}{%
    \booltrue{isthainumbering}}

%%  Whether theorem environment will have section numbering
\newbool{isthmsec}
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
    top=1.25in,bottom=1.25in,outer=1.75in,inner=1in,heightrounded,%
    marginparwidth=1in,marginparsep=1.25pc,head=2pc,foot=3.5pc]{geometry}

%%------------------------------------------------------------------
%%  Setup marginnote command.
%%------------------------------------------------------------------
\RequirePackage[heightadjust]{marginnote}
\renewrobustcmd*\marginnotevadjust{3.5pt}
\renewrobustcmd*\marginfont{\color{DarkGray}\footnotesize\setstretch{1}}
%% LEGACY CODE
% \newrobustcmd{\marginnote}[1]{\marginpar{%
%     \ifnumodd{\thepage}%
%         {\flushleft #1}%
%         {\ifbool{istwoside}{\flushright #1}{\flushleft #1}}}}

%%------------------------------------------------------------------
%%  Setup constant lengths for parts of document.
%%------------------------------------------------------------------
\RequirePackage{setspace}
\setstretch{1.2}
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
    \RequirePackage[main=thai,thai,english]{babel}%
    \RequirePackage[utf8x]{inputenc}%
    \RequirePackage[rmnorasi,sflaksaman]{fonts-tlwg}%
    \renewcommand{\baselinestretch}{1.333}
    \renewrobustcmd{\englishrmdefault}{\linuxlib}%
    \renewrobustcmd{\englishsfdefault}{\linuxbio}%
    \renewrobustcmd{\englishttdefault}{\inconsol}%
    \renewrobustcmd{\thaittdefault}{\inconsol}%
    % This command below allows users to use the following commands
    % where <lang> ISO 639-2 language code in three characters.
    % For example,
    %   \texteng{some text}, {\eng some text}, and
    %   \begin{eng} some text \end{eng}  for English; and
    %   \texttha{some text}, {\tha some text}, and
    %   \begin{tha} some text \end{tha}  for Thai.
    \babeltags{eng = english,tha = thai}%
    % Additional hardwired texts for hyperref
    \addto\captionsthai{%
        \def\partautorefname{\thaiPhoSamphao\thaiSaraAa\thaiKhoKhwai%
            \thaiThoThahan\thaiSaraIi\thaiMaiEk}%
        \def\equationautorefname{%
            \thaiSoSua\thaiMoMa\thaiKoKai\thaiSaraAa\thaiRoRua\thaiThoThahan%
            \thaiSaraIi\thaiMaiEk}%
        \def\Itemautorefname{%
            \thaiWoWaen\thaiRoRua\thaiRoRua\thaiKhoKhwai\thaiThoThahan%
            \thaiSaraIi\thaiMaiEk}%
        \def\sectionautorefname{%
            \thaiHoHip\thaiMaiHanakat\thaiWoWaen\thaiKhoKhai\thaiMaiTho%
            \thaiOAng\thaiThoThahan\thaiSaraIi\thaiMaiEk}%
        \def\subsectionautorefname{%
            \thaiHoHip\thaiMaiHanakat\thaiWoWaen\thaiKhoKhai\thaiMaiTho%
            \thaiOAng\thaiYoYak\thaiMaiEk\thaiOAng\thaiYoYak\thaiThoThahan%
            \thaiSaraIi\thaiMaiEk}%
        \def\subsubsectionautorefname{%
            \thaiHoHip\thaiMaiHanakat\thaiWoWaen\thaiKhoKhai\thaiMaiTho%
            \thaiOAng\thaiYoYak\thaiMaiEk\thaiOAng\thaiYoYak\thaiThoThahan%
            \thaiSaraIi\thaiMaiEk}%
        \def\paragraphautorefname{%
            \thaiYoYak\thaiMaiEk\thaiOAng\thaiHoHip\thaiNoNu\thaiMaiTho%
            \thaiSaraAa\thaiThoThahan\thaiSaraIi\thaiMaiEk}%
        \def\Hfootnoteautorefname{%
            \thaiSaraE\thaiChoChang\thaiSaraI\thaiNgoNgu\thaiOAng\thaiRoRua%
            \thaiRoRua\thaiThoThung\thaiThoThahan\thaiSaraIi\thaiMaiEk}%
        \def\AMSautorefname{%
            \thaiSoSua\thaiMoMa\thaiKoKai\thaiSaraAa\thaiRoRua\thaiThoThahan%
            \thaiSaraIi\thaiMaiEk}%
        \def\theoremautorefname{%
            \thaiThoThahan\thaiRu\thaiSoRusi\thaiDoChada\thaiSaraIi%
            \thaiBoBaimai\thaiThoThahan\thaiThoThahan\thaiSaraIi\thaiMaiEk}%
        }
    \renewrobustcmd{\ttfamily}{%
        \fontencoding{\latinencoding}%
        \fontfamily{\ttdefault}%
        \selectfont}%
    \ifbool{isthaiserif}{}{%
        \renewrobustcmd{\thaifamilydefault}{\thaisfdefault}}}{}

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
\definecolor{TealBlue}{rgb}{0.21, 0.46, 0.53}
\definecolor{CrimsonGlory}{rgb}{0.75, 0.0, 0.2}
\definecolor{DeepCarrotOrange}{rgb}{0.91, 0.41, 0.17}
\definecolor{Eggplant}{rgb}{0.38, 0.25, 0.32}

% Color settings for mdframed
\definecolor{ShadeColor}{gray}{0.95}
\definecolor{BorderColor}{gray}{0.75}

% Color settings for listings
\colorlet{PrimaryKeyword}{MidnightBlue!80}
\colorlet{SecondaryKeyword}{CrimsonGlory}
\colorlet{TertiaryKeyword}{TealBlue}
\colorlet{Identifier}{Eggplant!85}
\colorlet{String}{DeepCarrotOrange}
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
    skipabove=0.125pc,skipbelow=0.125pc,innertopmargin=0pc}

%%------------------------------------------------------------------
%%  Setup math theorem environments
%%------------------------------------------------------------------
% TODO: make autoref works with these theorem
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
\setlist{%
    topsep=0.25pc,itemsep=0.25pc,partopsep=0pc,parsep=0pc,listparindent=2pc,%
    itemindent=0pc}
\setlist[description]{itemindent=-2pc}
\setlist[2]{topsep=0.5pc,itemsep=0.5pc}
\setlist[1]{topsep=1pc,itemsep=1pc}

%%------------------------------------------------------------------
%%  Set numbering of pages and enumerations
%%------------------------------------------------------------------
\newrobustcmd{\footerpage}{\arabic{page}}
\ifbool{isthai}{%
    \RequirePackage{thaienum}% local package supporting Thai labels
    \ifbool{isthainumbering}{%
        \renewrobustcmd{\footerpage}{\thainum{page}}
        % TODO: make sure the thai numbering works for hyperref
        \setlist[enumerate,1]{label={\thainum*.}}
        \setlist[enumerate,2]{label={\thaimultialph*.}}
        \setlist[enumerate,3]{label={(\arabic*)}}
        \setlist[enumerate,4]{label={\alph*.}}
    }{}}{} % local package supporting Thai labels

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
    basicstyle={\small\ttfamily\color{VeryDarkGray}},%
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
    keywordstyle=[3]{\bfseries\color{TertiaryKeyword}},%
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
\newrobustcmd{\innerheader}{}  % renew to set inner header
\newrobustcmd{\outerheader}{}  % renew to set outer header

% Set up page header and footer for first page
\fancypagestyle{plain}{%
    \fancyhf{}  % clear all header and footer fields
    \fancyfoot[R]{\sffamily\small \footerpage}}

% Set up page header and footer for all other pages
\fancyhf{}  % clear all header and footer fields
\ifbool{istwoside}{%
    \fancyhead[LO,RE]{\sffamily\small \innerheader}
    \fancyhead[LE,RO]{\sffamily\small \outerheader}
    \fancyfoot[LE,RO]{\sffamily\small \footerpage}}%
{%else
    \fancyhead[L]{\sffamily\small \innerheader}
    \fancyhead[R]{\sffamily\small \outerheader}
    \fancyfoot[R]{\sffamily\small \footerpage}}

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
\newrobustcmd{\bhl}[1]{\hl[Cerulean!20]{#1}}
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
\RequirePackage[pdftex,unicode]{hyperref}
