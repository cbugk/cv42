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