% +-----------------------------------------------------------------------------
% | sidebanner LAYOUT
% |

% draw seperator line for sidebanner and document body, inspired from:
% https://tex.stackexchange.com/questions/453715/how-to-draw-vertical-line-in-precise-position
\newcommand{\lineVerticalBannerRight}[1]{
    \begin{tikzpicture}[remember picture,overlay]
        \color{#1}
        \draw[,dash pattern=off 10pt off 3pt,line width=2pt]
            ($(current page.north east)+(-\widthMarginPaperRight -\widthBanner , -\heightMarginPaperTop)$)
            --
            ($(current page.south east)+(-\widthMarginPaperRight -\widthBanner , \heightMarginPaperBottom)$);
    \end{tikzpicture}
}

\newcommand{\lineVerticalBannerLeft}[1]{
    \begin{tikzpicture}[remember picture,overlay]
        \color{#1}
        \draw[,dash pattern=off 10pt off 3pt,line width=2pt]
            ($(current page.north west)+(\widthMarginPaperLeft + \widthBanner , -\heightMarginPaperTop)$)
            --
            ($(current page.south west)+(\widthMarginPaperLeft + \widthBanner  , \heightMarginPaperBottom)$);
    \end{tikzpicture}
}

\newcommand{\lineHorizontalBannerRight}[2]{
    \begin{tikzpicture}[remember picture,overlay]
        \color{#1}
        \draw[,dash pattern=off 10pt off 3pt,line width=2pt]
            ($(current page.north east)+(-\widthMarginPaperRight -\widthBanner , -#2)$)
            --
            ($(current page.north east)+(-\widthMarginPaperRight, -#2)$);
    \end{tikzpicture}
}

\newcommand{\lineHorizontalBannerLeft}[2]{
    \begin{tikzpicture}[remember picture,overlay]
        \color{#1}
        \draw[,dash pattern=off 10pt off 3pt,line width=2pt]
            ($(current page.north west)+(\widthMarginPaperLeft, -#2)$)
            --
            ($(current page.north west)+(\widthMarginPaperLeft + \widthBanner , -#2)$);
    \end{tikzpicture}
}

% draw sidebanner background on current page
\newcommand{\drawsidebannerBG}{%
	\AddToShipoutPictureBG*{%
		\iftoggle{togIsRightPlacementBanner}{%
			\begin{tikzpicture}[remember picture, overlay]
				\node at ($(current page.north west)+(\widthPaper -\widthMarginPaperRight -\widthBanner -\widthMarginBannerBackgroundExtraLeft ,
				    -\heightMarginPaperTop +\heightMarginBannerBackgroundExtraTop)$)[
					rectangle,
					fill=colorbackgroundside,
					anchor=north west,
					minimum width=\widthBanner +\widthMarginBannerBackgroundExtraLeft +\widthMarginBannerBackgroundExtraRight,
					minimum height=\heightBanner +\heightMarginBannerBackgroundExtraTop +\heightMarginBannerBackgroundExtraBottom,
				]{};%
				% plot vertical red guideline
				\plotvline%
			\end{tikzpicture}%
		}{% else
			\begin{tikzpicture}[remember picture, overlay]
				\node at ($(current page.north west)+(\widthMarginPaperLeft -\widthMarginBannerBackgroundExtraLeft  ,
				    -\heightMarginPaperTop +\heightMarginBannerBackgroundExtraTop)$)[
					rectangle,
					fill=colorbackgroundside,
					anchor=north west,
					minimum width=\widthBanner +\widthMarginBannerBackgroundExtraLeft +\widthMarginBannerBackgroundExtraRight,
					minimum height=\heightBanner +\heightMarginBannerBackgroundExtraTop +\heightMarginBannerBackgroundExtraBottom,
				]{};%
				% plot vertical red guideline
				\plotvline%
			\end{tikzpicture}%
		}%
	}%
}%

% use textpos to position textblock within TikZ background; we have to use
% the starred version for absolute values here, b/c we use \pagewidth directly
% instead of \setlength{\TPHorizModule}{<dimen>}, which seems to be "absolute"
% as opposed to "relative" - strange but true.
\newenvironment{sidebanner}{%
	\drawsidebannerBG
	
	% -- for some reason 5mm shift to top and 5mm deacrease in width is necessary
	% to fit almost exatly on banner (without extras)
	% -- another 1.15mm raise is necessary for another unknown reason as well.
	\TPGrid[0mm, -2.0\unknownTextBlockAdjustLengt]{210}{290}
	\iftoggle{togIsRightPlacementBanner}{%
		\begin{textblock*}
		{
		    \widthBlockTextBanner
		}
		(
		    \widthPaper -\widthMarginPaperRight -\widthBanner +\widthMarginBannerLeft  ,
		    \heightMarginPaperTop + \heightMarginBannerTop
		)
	}{% else
		\begin{textblock*}
		{
		    \widthBlockTextBanner
		}
		(
		    \widthMarginPaperLeft +\widthMarginBannerLeft ,
		    \heightMarginPaperTop +\heightMarginBannerTop
		)
	}%
}{%
	\end{textblock*}%
}


% provide user interface for easily adding new sections in side bars
% default: empty sidebanner
\newcommand{\frontsidebanner}{}
\newcommand{\backsidebanner}{}
\newcommand{\addtofrontsidebanner}[1]{\apptocmd{\frontsidebanner}{#1}{}{}}
\newcommand{\addtobacksidebanner}[1]{\apptocmd{\backsidebanner}{#1}{}{}}

\newcommand{\makefrontsidebanner}{%
	\begin{sidebanner}
		% user definitions
		\frontsidebanner
	\end{sidebanner}
}

\newcommand{\makebacksidebanner}{%
	\begin{sidebanner}
		% user definitions
		\backsidebanner
	\end{sidebanner}
}
% L_____________________________________________________________________________