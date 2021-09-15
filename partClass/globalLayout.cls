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