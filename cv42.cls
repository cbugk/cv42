% ANY IMPORT IS PERFORMED ON "cv42.cls" OR "cv42.tex" (FLAT TREE)

% +-----------------------------------------------------------------------------
% | CLASS NAME AND VERSION
% |
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv42}[2021/08/16 CV class]
% L_____________________________________________________________________________

\newlength{\unknownTextBlockAdjustLengt}
\setlength{\unknownTextBlockAdjustLengt}{2mm}

% +-----------------------------------------------------------------------------
% | REQUIRED PACKAGES
% |
%% first load all packages absolutely required to parse class options
% for easy color definitions; provides \definecolor; load before background pkg
\RequirePackage[dvipsnames, svgnames, x11names]{xcolor}
% for positioning text within the side column | use showboxes for visible frame
\RequirePackage[absolute,overlay]{textpos}
% provides key-value class options via \DeclareOptionX
\RequirePackage{xkeyval}
% provides \ifnumgreater{<int expr.>}{<int expr.>}{<true>}{<false>},
% \apptocmd{<command>}{<code>}{<success>}{<failure>} and \newtoggle{<name>}
\RequirePackage{etoolbox}
% provides basic conditional expressions
\RequirePackage{ifthen}
% enable simple math like +/- etc. on lengths
\RequirePackage{calc}
% change page margins
\RequirePackage[
	nohead,
	nofoot,
	nomarginpar,
]{geometry}

% for seperated files
\RequirePackage{import}

% use as workaround for spacing problem when TikZ picture is not in paragraph;
% details: https://tex.stackexchange.com/a/435790
\RequirePackage[texcoord]{eso-pic}

% for easy section style definitions
\RequirePackage{titlesec}

% loads graphicx, provides align=c option for vertical alignment w.r.t. text
\RequirePackage{graphbox}

% provides X column type for automatic length calculations
\RequirePackage{tabularx}

% take care of compiler-specific packages
\RequirePackage{ifluatex}
\RequirePackage{ifxetex}
\newif\ifxetexorluatex
\ifxetex
	\xetexorluatextrue
\else
	\ifluatex
		\xetexorluatextrue
	\else
		\xetexorluatexfalse
	\fi
\fi

%% pictures, icons and drawings
\ifxetexorluatex
	\RequirePackage{academicons}
\fi
\RequirePackage{fontawesome5}
\RequirePackage{tikz}
\usetikzlibrary{arrows, backgrounds}

% provides \xrfill for horizontal rules
\RequirePackage{xhfill}

% enable multiple optional arguments in macros
\RequirePackage{xparse}

% enable links
\RequirePackage[hidelinks]{hyperref}
% L_____________________________________________________________________________


% +-----------------------------------------------------------------------------
% | CONFIGURATION CONSTANTS - under "config" directory, always ".tex" files
% |

%% -- INDEPENDENTS --

% -- independent
% -- import banner placement and decoration toggles
\import{./config/}{bannerToggle.tex}

% -- independent
% -- import widthRatio definitions
\import{./config/}{widthRatio.tex}

% -- independent
% -- imports defined color catalog
\import{./config/color/}{colorDefinition.tex}

% -- independent
% -- import fontsizes
\import{./config/}{fontsize.tex}

% -- independent
% -- logo settings
\import{./config/}{logo.tex}

%% -- DEPENDENTS --

% -- dependent on "bannerToggle.tex"
% -- import margin for paper, document, and banner
\import{./config/}{margin.tex}

% -- dependent on "colorDefinition.tex"
% -- imports color settings
\import{./config/color/}{colorMacroClass.tex}

% -- dependent on "colorDefinition.tex"
% -- imports color settings for macros defined by user (not the template)
% -- imports document specific colors (if any)
\import{./config/color/}{colorMacroPaper.tex}

% -- dependent on "margin.tex"
% -- import banner settings
\import{./config/}{banner.tex}

% -- dependent on "margin.tex"
% -- document column settings
\import{./config/}{document.tex}

% -- profile picture settings
\import{./config/}{picture.tex}
% L_____________________________________________________________________________


% +-----------------------------------------------------------------------------
% | PROCESS CLASS OPTIONS
% |

% show Banner and page margins
\newtoggle{tshowframes}
\togglefalse{tshowframes}
\DeclareOptionX{showframes}{
	\geometry{showframe}
	\TPoptions{showboxes=true}
	\toggletrue{tshowframes}
	% adding \hline in \newenvironment directly doesn't work, so do it here...
	\AtBeginDocument{\apptocmd{\personaldata}{\hline}{}{}}
}

% draw vertical guideline
\newcommand{\plotvline}{}
\DeclareOptionX{vline}{%
	% must be defined here as macro, b/c tikz won't expand absolute length in
	% \backgroundsetup -- BUG?
	\renewcommand{\plotvline}{%
		\draw [thick, red, opacity=0.7]
		(\widthMarginLeft + #1, 0) -- (\widthMarginLeft + #1, -\heightPaper);
	}
}

% pass further options to base class and load it
\DeclareOptionX*{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessOptionsX\relax
\LoadClass{article}



% let geometry package perform the changes;
% must come after loading the base class to prevent overwriting
\iftoggle{togIsRightPlacementBanner}{
	\geometry{
	    a4paper,
		top=\heightMarginPaperTop + \heightMarginDocumentTop,
		bottom=\heightMarginPaperBottom + \heightMarginDocumentBottom,
		left=\widthMarginPaperLeft + \widthMarginDocumentLeft,
		right=\widthMarginDocumentRight + \widthBanner + \widthMarginPaperRight,
	}
}{% else
	\geometry{
	    a4paper,
		top=\heightMarginPaperTop + \heightMarginDocumentTop,
		bottom=\heightMarginPaperBottom + \heightMarginDocumentBottom,
		left=\widthMarginPaperLeft + \widthBanner + \widthMarginDocumentLeft,
		right=\widthMarginPaperRight + \widthMarginDocumentRight,
	}
}
% L_____________________________________________________________________________


% +-----------------------------------------------------------------------------
% | GLOBAL LAYOUT AND HEADINGS STYLE
% |
% remove headers and footers
\pagestyle{empty}

% globally disable paragraph indentation
\setlength{\parindent}{0pt}

% set space between paragraphs
% \setlength{\parskip}{1ex}

% creates a rule after some text using remaining line width
% usage: \xrfill[<raise>]{<width>}
\newcommand*{\sectionline}[1]{#1~\xrfill[.5ex]{1pt}[colorsectionlineside]}

% section style for cv table headings in right column
% \titleformat{<command>}[<shape>]{<format>}{<label>}{<sep>}{<before>}[<after>]
\newcommand*{\cvSectionLegacy}[1]{\section*{#1}}
\titleformat{\section}%
	{\color{colorsectionbody}\normalfont\bfseries\LARGE}{}{0pt}{}
\titlespacing*{\section}{0pt}{1.5ex}{1ex}

% grey subsection style for right column
\newcommand*{\cvSubSection}[1]{\subsection*{#1}}
\titleformat{\subsection}%
	{\color{colorsubsectionbody}\normalfont\large}{}{0pt}{}

% for compatibility with older versions
\newcommand*{\profilesection}[1]{\subsubsection*{#1}}
% abuse subsubsection as sidesection in left column
\newcommand*{\sidesection}[1]{\subsubsection*{#1}}
\titleformat{\subsubsection}%
	{\color{colorsectionside}\normalfont\sizeSectionBanner}{}{0pt}%
	{\color{colorsectionside}\sizeSectionBanner\sectionline}%
% set spaces before and after sidesections: <left><before><after>
% "starred version kills the indentation of the paragraph following the title"
\titlespacing*{\subsubsection}{0pt}{1ex}{1ex}

% add centered version of sidesection
% maintitle from belo link was renamed
% https://tex.stackexchange.com/questions/374422/how-can-i-draw-horizontal-lines-right-and-left-from-title
\newcommand{\sidesectioncentered}[1]{%
    {
        {
            \quitvmode
            \hb@xt@\linewidth{%
                \color{colorsectionlineside}
                \dimen@=1ex
                \advance\dimen@-1pt
                \leaders\hrule \@height1ex \@depth-\dimen@\hfill
                \enskip
                {\color{colorsectionside} \sizeSectionBanner #1}%
                \enskip
                \leaders\hrule \@height1ex \@depth-\dimen@\hfill
            }
        }%
    }
    \par
}

% Left alligned subsection for Banner without following line unlike sidesection
\newcommand{\sidesubsection}[2]{
    {\flushLeft \color{colorsubsectionside} \sizeSubsectionBanner #1}
    \par
    \parbox{\linewidth}{#2}
    \par
    \vspace{1.5mm}
}

% colored href, source below:
% https://tex.stackexchange.com/questions/61015/how-to-use-different-colors-for-different-href-commands
\newcommand{\cvHref}[3][colorhref]{\href{#2}{\textit{\color{#1}{#3}}}}
% L_____________________________________________________________________________


% standard-ish vspace
\newcommand{\vertfiller}{\vspace*{0.5ex}}

% +-----------------------------------------------------------------------------
% | PARTIAL CLS FILES - under "partClass" directory, always ".cls" files
% |

% banner and bannerline settings
\import{./partClass/}{banner.cls}

\import{./partClass/}{layoutBanner.cls}

\import{./partClass/}{elementList.cls}

\import{./partClass/}{document.cls}
% L_____________________________________________________________________________

% EOF - fortysecondscv.cls
