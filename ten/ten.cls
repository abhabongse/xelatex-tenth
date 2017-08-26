%% tenth.cls
%% Author: Abhabongse Janthong
%
% This document class provides preloaded most common packages and most common
% configurations of the document according to my own taste.
%
% It is released under MIT License because the author thinks that the
% LaTeX Project Public License is annoying and life is complicated.
\NeedsTeXFormat{LaTeX2e}[2016/02/01]
\ProvidesClass{tenth}[2017/07/16 v0.1.2 (Abhabongse Janthong)]

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
\renewrobustcmd*\marginnotevadjust{4.33pt}
\renewrobustcmd*\marginfont{\color{OrangeRed4}\footnotesize\setstretch{1}}
\newrobustcmd{\marginhead}[1]{\marginnote{\color{black}\itshape{}#1}}

\RequirePackage[hang,flushmargin]{footmisc}
\setlength{\footnotemargin}{0.5pc}

%%------------------------------------------------------------------
%%  Setup constant lengths for parts of document.
%%------------------------------------------------------------------
\RequirePackage{setspace}
\setstretch{1.33}
\setlength{\parskip}{0pc}
\setlength{\parindent}{2pc}
\setlength{\abovedisplayskip}{0.75pc plus 0.25pc minus 0.25pc}
\setlength{\belowdisplayskip}{0.75pc plus 0.25pc minus 0.25pc}
\setlength{\abovedisplayshortskip}{0.75pc plus 0.25pc minus 0.25pc}
\setlength{\belowdisplayshortskip}{0.75pc plus 0.25pc minus 0.25pc}

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
\newrobustcmd\linuxlib{LinuxLibertineT-TLF}
\newrobustcmd\linuxbio{LinuxBiolinumT-TLF}
\newrobustcmd\inconsol{zi4}
\newrobustcmd\norasi{norasi}
\newrobustcmd\laksaman{laksaman}

%% TODO: use relsize to control the scale of Thai fonts

%%------------------------------------------------------------------
%%  Load 'microtype' which is the best package ever
%%------------------------------------------------------------------
\RequirePackage[%
    activate={true,nocompatibility},final,tracking=true,letterspace=60,%
    kerning=true,spacing=true,factor=1150,stretch=15,shrink=15]{microtype}
\microtypecontext{spacing=nonfrench}
\SetExtraKerning[unit=space]%
    {encoding={*},family={\linuxlib},series={*},%
        size={footnotesize,small,normalsize}}%
    {\textendash={250,250},      % en-dash, add more space around it
     \textemdash={250,250},      % en-dash, add more space around it
     "28={,150},                 % left bracket, add space from right
     "29={150,},                 % right bracket, add space from left
     \textquotedblleft={,150},   % left quotation mark, space from right
     \textquotedblright={150,}}  % right quotation mark, space from left

%%------------------------------------------------------------------
%%  Setup color choices
%%------------------------------------------------------------------
\RequirePackage[dvipsnames,svgnames,x11names,table,fixpdftex,hyperref]{xcolor}

% Color settings for mdframed
\definecolor{DefaultShade}{gray}{0.975}
\definecolor{DefaultBorder}{gray}{0.75}
\colorlet{ExampleShade}{LightYellow1!50}
\colorlet{ExampleBorder}{LightYellow4!40}
\colorlet{AlgorithmShade}{DarkSeaGreen1!50}
\colorlet{AlgorithmBorder}{DarkSeaGreen4!40}

% Color settings for listings
\colorlet{PrimaryKeyword}{RoyalBlue3}
\colorlet{SecondaryKeyword}{Red3}
\colorlet{TertiaryKeyword}{TealBlue}
\colorlet{Identifier}{black}
\colorlet{String}{Red3}
\colorlet{Symbol}{Ivory4!60!Gold4}
\colorlet{Comment}{Green4}

% Commands for colored squares
\newrobustcmd{\redsq}{{\textcolor{red}{$\blacksquare$}}}
\newrobustcmd{\greensq}{{\textcolor{green}{$\blacksquare$}}}
\newrobustcmd{\bluesq}{{\textcolor{blue}{$\blacksquare$}}}
\newrobustcmd{\yellowsq}{{\textcolor{yellow}{$\blacksquare$}}}

%%------------------------------------------------------------------
%%  Setup math equations and symbols
%%------------------------------------------------------------------
\RequirePackage{amsmath}
\RequirePackage{IEEEtrantools}
\RequirePackage{mathtools}
\RequirePackage{chemarrow}
\RequirePackage{fdsymbol}  % Nicer looking standard symbols
\RequirePackage{fontawesome}  % FontAwesome symbols package
\RequirePackage{adforn}  % Ornaments package
\RequirePackage{textcomp}
\RequirePackage{aliascnt}
\renewrobustcmd{\qedsymbol}{$\blacksquare$}
\def\tagform@#1{\maketag@@@{(\ignorespaces{\footnotesize\faPaperPlane}\,\textbf{#1}\unskip\@@italiccorr)}}
\renewcommand{\eqref}[1]{(\hyperref[#1]{{\footnotesize\faPaperPlane}\,\textbf{\ref*{#1}}})}

%%------------------------------------------------------------------
%%  Setup mdframed environment
%%------------------------------------------------------------------
\RequirePackage[xcolor]{mdframed}

\mdfdefinestyle{standard}{%
    backgroundcolor=DefaultShade,linecolor=DefaultBorder,%
    skipabove=0.5pc,skipbelow=0.25pc}
\mdfdefinestyle{mathbox}{style=standard,%
    splitbottomskip=0.75pc,splittopskip=1.25pc,%
    innertopmargin=0pc,footnoteinside=true,%
    nobreak=false}
\mdfdefinestyle{mathbox-example}{style=mathbox,%
    backgroundcolor=ExampleShade,linecolor=ExampleBorder}
\mdfdefinestyle{mathbox-algorithm}{style=mathbox,%
    backgroundcolor=AlgorithmShade,linecolor=AlgorithmBorder}

%%------------------------------------------------------------------
%%  Setup math theorem environments
%%------------------------------------------------------------------
%% Set the shortcut to create new alias and define new theorem environment
\newrobustcmd\newaliasandtheorem[3][mathbox]{%
    \newmdtheoremenv[style=#1]{#2}{#3}%
    \expandafter\providerobustcmd\csname#2autorefname\endcsname{#3}}
\newrobustcmd\newblanktheorem[2]{%
    \newtheorem*{#1}{#2}%
    \expandafter\providerobustcmd\csname#1autorefname\endcsname{#2}%
    \expandafter\renewrobustcmd\csname end#1\endcsname%
        {\hfill$\Diamond$\endtrivlist}%
    \BeforeBeginEnvironment{#1}{\smallskip}
    \AfterEndEnvironment{#1}{\smallskip}}%

\theoremstyle{plain}
\newaliasandtheorem{theorem}{Theorem}
\newaliasandtheorem{lemma}{Lemma}
\newaliasandtheorem{corollary}{Corollary}
\newaliasandtheorem{proposition}{Proposition}
\newaliasandtheorem{conjecture}{Conjecture}
\newaliasandtheorem{criterion}{Criterion}
\newaliasandtheorem{assertion}{Assertion}

\theoremstyle{definition}
\newaliasandtheorem{definition}{Definition}
\newaliasandtheorem{condition}{Condition}
\newaliasandtheorem{problem}{Problem}
\newaliasandtheorem[mathbox-example]{example}{Example}
\newaliasandtheorem{exercise}{Exercise}
\newaliasandtheorem[mathbox-algorithm]{algorithm}{Algorithm}
\newaliasandtheorem[mathbox-algorithm]{procedure}{Procedure}
\newaliasandtheorem{question}{Question}
\newaliasandtheorem{axiom}{Axiom}
\newaliasandtheorem{property}{Property}
\newaliasandtheorem{assumption}{Assumption}
\newaliasandtheorem{hypothesis}{Hypothesis}
\newaliasandtheorem{fact}{Fact}

\theoremstyle{remark}
\newblanktheorem{remark}{Remark}
\newblanktheorem{note}{Note}
\newblanktheorem{notation}{Notation}
\newblanktheorem{claim}{Claim}
\newblanktheorem{summary}{Summary}
\newblanktheorem{acknowledgement}{Acknowledgement}
\newblanktheorem{case}{Case}
\newblanktheorem{conclusion}{Conclusion}
\newblanktheorem{hint}{Hint}

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
% FontAwesome replacement for bullet points
\setlist[itemize,1]{label={\small\faChevronCircleRight}}

%%------------------------------------------------------------------
%%  Set numbering of pages and enumerations
%%------------------------------------------------------------------
\newrobustcmd{\footerpage}{\arabic{page}}

%%------------------------------------------------------------------
%%  Professional looking tabular styles
%%------------------------------------------------------------------
\RequirePackage{array, booktabs}

%%------------------------------------------------------------------
%%  Graphics and figures packages
%%------------------------------------------------------------------
\RequirePackage[pdftex]{graphicx}
\RequirePackage[%
    margin=1pc,font={footnotesize},labelfont={bf},labelsep=period,%
    format=plain,indention=1pc,justification=justified]{caption}
\RequirePackage{subcaption}
% \DeclareCaptionFormat{llap}{\llap{#1#2}#3\par}
% \captionsetup{format=llap,labelsep=quad,singlelinecheck=no}

%%------------------------------------------------------------------
%%  Code listings package and settings
%%------------------------------------------------------------------
\RequirePackage{listings}
\lstset{%
    % Basic Settings
    basicstyle={\small\ttfamily},%
    captionpos=b,%
    % Margins and Background
    xleftmargin=2.5pc,%
    xrightmargin=1.5pc,%
    frame=none,%
    framesep=0.5pc,%
    framextopmargin=0pc,%
    framexbottommargin=0pc,%
    framexleftmargin=0pc,%
    framexrightmargin=0pc,%
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
    belowskip=\medskipamount,%
    abovecaptionskip=\medskipamount,%
    belowcaptionskip=\smallskipamount,%
    lineskip=0.0001pt,
    % Line Numbers
    stepnumber=1,%
    numbers=left,%
    numbersep=1pc,%
    numberstyle=\ttfamily\color{DarkGray},%
    % Special Keyword Format
    stringstyle=\color{String},%
    commentstyle=\color{Comment},%
    identifierstyle=\color{Identifier},%
    keywordstyle=[1]{\bfseries\color{PrimaryKeyword}},%
    keywordstyle=[2]{\bfseries\color{SecondaryKeyword}},%
    keywordstyle=[3]{\bfseries\color{TertiaryKeyword}},%
    extendedchars=true}
\captionsetup[lstlisting]{margin={2pc,-3.00001pc},oneside}
\renewrobustcmd\lstlistingname{Source Code}
\newrobustcmd{\lstnumberautorefname}{Line}

\let\origthelstnumber\thelstnumber
\newrobustcmd*\SuppressNumber{%
    \lst@AddToHook{OnNewLine}{%
        \let\thelstnumber\relax%
        \advance\c@lstnumber-\@ne\relax}}
\newrobustcmd*\ReactivateNumber{%
    \lst@AddToHook{OnNewLine}{%
        \let\thelstnumber\origthelstnumber%
        \advance\c@lstnumber\@ne\relax}}
\newrobustcmd*\ActivateNumber[1]{%
    \setcounter{lstnumber}{\numexpr#1-1\relax}
    \lst@AddToHook{OnNewLine}{%
        \let\thelstnumber\origthelstnumber%
        \refstepcounter{lstnumber}}}

\lstdefinelanguage{pseudocode}{%
    keywordstyle=[1]{\bfseries\color{PrimaryKeyword}},%
    keywordstyle=[2]{\bfseries\color{SecondaryKeyword}},%
    keywordstyle=[3]{\color{TertiaryKeyword}},%
    morekeywords={[1],if,then,else,while,do,end,loop,until,for,to,downto,%
        return,print,def},%
    morekeywords={[2],true,false,null,nil},%
    sensitive=false,%
    morestring=[b]",%
    morestring=[b]',%
    morecomment=[l]{//},%
    literate=*%
        %% Single character
        {:}{{{\bfseries\color{Symbol}{:}}}}1
        ,
    mathescape=true}

%%------------------------------------------------------------------
%%  Page header package and settings
%%------------------------------------------------------------------
\RequirePackage{fancyhdr}
\newrobustcmd{\leftheader}{}  % renew to set inner header
\newrobustcmd{\rightheader}{}  % renew to set outer header

% Set up page header and footer for first page
\fancypagestyle{plain}{%
    \fancyhf{}  % clear all header and footer fields
    \fancyfoot[R]{\color{DarkGray}\small \footerpage}}

% Set up page header and footer for all other pages
\fancyhf{}  % clear all header and footer fields
\ifbool{istwoside}{%
    \fancyhead[LE]{\color{Gray}\scshape\textls[120]{\leftheader}}
    \fancyhead[RO]{\color{Gray}\scshape\textls[120]{\rightheader}}
    \fancyfoot[LE,RO]{\color{Gray}\small \footerpage}}%
{%else
    \fancyhead[L]{\color{Gray}\scshape\textls[120]{\leftheader}}
    \fancyhead[R]{\color{Gray}\scshape\textls[120]{\rightheader}}
    \fancyfoot[R]{\color{Gray}\small \footerpage}}

\pagestyle{fancy}

% Remove lines
\renewrobustcmd{\headrulewidth}{0pt}
\renewrobustcmd{\footrulewidth}{0pt}

%%------------------------------------------------------------------
%%  Special underline package
%%------------------------------------------------------------------
\RequirePackage{ulem}
\normalem

%%------------------------------------------------------------------
%%  Additional definitions
%%------------------------------------------------------------------
% Define hair space
\newrobustcmd{\hrsp}{\ifmmode\mskip1mu\else\kern0.0625em\fi}

% Define shorthands for mathematical sets
\newrobustcmd{\Algebraic}{\mathbb{A}}
\newrobustcmd{\Complex}{\mathbb{C}}
\newrobustcmd{\Field}{\mathbb{F}}
\newrobustcmd{\Natural}{\mathbb{N}}
\newrobustcmd{\Quotient}{\mathbb{Q}}
\newrobustcmd{\Real}{\mathbb{R}}
\newrobustcmd{\Zahlen}{\mathbb{Z}}

% Define shorthand for overline
\newrobustcmd{\ol}{\overline}

% Define shorthand for blocks
\newrobustcmd{\hl}[2][LightGray!20]{%
    \ifmmode{\mathchoice%
        {\colorbox{#1}{$\displaystyle #2$}}%
        {\colorbox{#1}{$\textstyle #2$}}%
        {\colorbox{#1}{$\scriptstyle #2$}}%
        {\colorbox{#1}{$\scriptscriptstyle #2$}}}%
    \else%
        {\colorbox{#1}{#2}}%
    \fi}
\newrobustcmd{\rhl}[1]{\hl[Red1!25]{#1}}
\newrobustcmd{\ghl}[1]{\hl[Chartreuse3!25]{#1}}
\newrobustcmd{\bhl}[1]{\hl[Blue1!10]{#1}}
\newrobustcmd{\yhl}[1]{\hl[Yellow2!30]{#1}}

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
\newrobustcmd\sectionref[1]{\hyperref[#1]{\S\ref*{#1}}}
