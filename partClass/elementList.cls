% +-----------------------------------------------------------------------------
% | LIST ENVIRONMENTS
% |

% reduce space between table columns to minimum
\setlength{\tabcolsep}{0pt}

% cv list environment --> table, left aligned, width=textwidth
% tabular starred version adds space to make table as wide as \textwidth here
\newenvironment{cvtable}[1][1]{%
	\renewcommand{\arraystretch}{#1}%
	\begin{tabular*}{\textwidth}{@{\extracolsep{\fill}}ll}%
}{%
	\end{tabular*}%
}

% | <keyword>      <one-line description>            |
% use parbox if text needs to use multiple lines
\newcommand{\cvItemShort}[2]{%
	\parbox[t]{0.17\textwidth}{\raggedright #1}
	& \parbox[t]{0.81\textwidth}{#2} \\}

% | <date>         <bold-title>  \hfill  <location>  |
% |                <longer description>              |
% or, if description is empty:
% | <date>         <title>       \hfill  <location>  |
\newcommand{\cvItemLegacy}[4]{%
	\parbox[t]{0.17\textwidth}{\raggedright #1} &%
	\parbox[t]{0.81\textwidth}{%
		\if\relax\detokenize{#4}\relax%
			\parbox[t]{\linewidth-\widthof{\footnotesize #3}-1em}{\raggedright #2}%
			\hfill {\footnotesize#3}%
		\else%
			\parbox[t]{\linewidth-\widthof{\footnotesize #3}-1em}{\raggedright \textbf{#2}}%
			\hfill {\footnotesize#3} \\%
			\textcolor{colortextbody}{#4}%\vspace{\parsep}%
		\fi%
	}\\
}

% | <date>         <bold-title>  \par\hfill  <location>  |
% |                <longer description>              |
% or, if description is empty:
% | <date>         <title>       \par\hfill  <location>  |
\newcommand{\cvItemPar}[4]{%
	\parbox[t]{0.17\textwidth}{\raggedright #1} &%
	\parbox[t]{0.81\textwidth}{%
		\if\relax\detokenize{#4}\relax%
			\parbox[t]{\textwidth}{\raggedright #2}%
			\par\hfill {\footnotesize#3}%
		\else%
			\parbox[t]{\textwidth}{\raggedright \textbf{#2}}%
			\par\hfill {\footnotesize#3} \\%
			\textcolor{colortextbody}{#4}%\vspace{\parsep}%
		\fi%
	}\\
}

% Creates two side-by-side parboxes, left being indentation and
% right having the content
\newcommand{\cvIndent}[3]{
    % empty spacer of given ratio. ASCII for space so that parbox not empty
    \parbox{#1\textwidth}{\char32}
    % the rest
    \parbox{#2\textwidth}{#3}
    \\
}

% 
\newcommand{\cvItemAdvHead}[6]{
	\parbox{#1\textwidth}{\flushleft  #4}
	\parbox{#2\textwidth}{\flushleft  #5}
	\parbox{#3\textwidth}{\flushright #6}
	\\
}

\newcommand{\cvItemAdvBody}[4]{
    \vspace{#1}
    \cvIndent{#2}{#3}{\textcolor{colortextbody} #4}
}

\newcommand{\cvItemBoxed}[5]{
    % 2mm less beacuse of fbox
    \parbox{\rindent\textwidth - 2mm}{\char32}
    \fbox{
        \parbox{\rblock\textwidth}{
            \parbox{\linewidth}{\vspace{0.5\valvspace}}
            \par
            \parbox{\ronefirst\textwidth}{#1}
            \parbox{\ronesecond\textwidth}{\char32}
            \parbox{\ronethird\textwidth}{\small \hfill #2}
            \par
            
            \vspace{0.5\valvspace}
            \parbox{\rtwofirst\textwidth}{\large #3}
            \parbox{\rtwosecond\textwidth}{\char32}
            \parbox{\rtwothird\textwidth}{\hfill #4}
            \par
            
            \vspace{\valvspace}
            \parbox{\rdescindent\textwidth}{\char32}
            \parbox{\rdesc\textwidth}{#5}
            \\
        }
    }
    \vspace{\valvspace}
    \\
}

\newcommand{\cvItemDocDuo}[5]{
    \parbox{\rindent\textwidth}{\char32}
    \parbox{\rblock\textwidth}{
        \parbox{\linewidth}{\vspace{0.5\valvspace}}
        \par
        \parbox[t]{\rdoneleft\textwidth}{#1}
        \parbox[t]{\rdoneright\textwidth}{\hfill #2}
        \par
        
        \vspace{0.5\valvspace}
        \parbox[t]{\rdtwoleft\textwidth}{\large #3}
        \parbox[t]{\rdtworight\textwidth}{\hfill #4}
        \par
    
        \vspace{\valvspace}
        %\parbox{\rdescindent\textwidth}{\char32}
        \parbox{\rdesc\textwidth}{#5}
        \par
    }
    \vspace{\valvspace}
    \\   
}

\newcommand{\cvItemDocDuoHead}[4]{
    \parbox{\rindent\textwidth}{\char32}
    \parbox{\rblock\textwidth}{
        \parbox{\linewidth}{\vspace{0.5\valvspace}}
        \par
        \parbox{\rdoneleft\textwidth}{#1}
        \parbox{\rdoneright\textwidth}{\hfill #2}
        \par
        
        \vspace{0.5\valvspace}
        \parbox{\rdtwoleft\textwidth}{\large #3}
        \parbox{\rdtworight\textwidth}{\hfill #4}
        \par
    }
    \vspace{\valvspace}
    \\   
}

\newcommand{\cvItemSkill}[3]{
    \parbox{\fpeval{\rindent + 0.5\rskillfirst}\textwidth}{\char32}
    \parbox{\fpeval{\rblock - 0.5\rskillfirst}\textwidth}
    {
        \parbox{\rskillfirst\textwidth}{\cvIcon{#1}}
        \parbox{\rskillsecond\textwidth}{#2}
        \parbox{\rskillthird\textwidth}{\small \hfill #3}
        \par
        \\
    }
    \vspace{\valvspace}
    \\   
}
\newcommand{\cvItemSkillCircle}[3]{
    \parbox{\fpeval{\rindent + 0.5\rskillfirst}\textwidth}{\char32}
    \parbox{\fpeval{\rblock - 0.5\rskillfirst}\textwidth}
    {
        \parbox[c][\rskillfirst\textwidth][c]{\rskillfirst\textwidth}{\cvIcon{\circleicon{\small #1}}}
        \parbox{\rskillsecond\textwidth}{#2}
        \parbox{\rskillthird\textwidth}{\small \hfill #3}
        \par
        \\
    }
    \vspace{\valvspace}
    \\   
}


\newcommand{\cvSectionDoc}[1]{
    %\cvIndent
    %{\fpeval{floor{0.00 * \rindent}}} % you can lend proportions of \rindent
    %{\fpeval{1.0 * \rindent + \rblock}}
    {\cvSectionLegacy{#1}}
}


% publication item
% \cvItemPub{<title>}{<author>}{<journal>}{<year>} will produce
% | <year>         <bold title>                      |
% |                <italic author>                   |
% |                <journal>                         |
\newcommand{\cvItemPub}[4]{%
	\parbox[t]{0.17\textwidth}{\raggedright #4} &
	\parbox[t]{0.81\textwidth}{%
		\textbf{#1} \par \textit{#2} \par #3 \vspace{\parsep}%
	}\\
}
% L_____________________________________________________________________________