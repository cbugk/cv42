% -- setup vertical line according to config
\newcommand{\lineVerticalBanner}[1]{}
\iftoggle{togDrawLineVerticalBanner}{
    \iftoggle{togIsRightPlacementBanner}{
        \renewcommand{\lineVerticalBanner}[1]{\lineVerticalBannerRight{#1}}
    }{
        \renewcommand{\lineVerticalBanner}[1]{\lineVerticalBannerLeft{#1}}
    }
}{\null}

% -- setup horizontal line according to config
\newcommand{\lineHorizontalBanner}[2]{}
\iftoggle{togDrawLineHorizontalBanner}{
	\iftoggle{togIsRightPlacementBanner}
	{
	    \renewcommand{\lineHorizontalBanner}[2]{\lineHorizontalBannerRight{#1}{#2}
	    }
	}{
	    \renewcommand{\lineHorizontalBanner}[2]{\lineHorizontalBannerLeft{#1}{#2}}
    }
}{\null}

% +-----------------------------------------------------------------------------
% | sidebanner ELEMENTS
% |

% -- text in user-specific color
\newcommand{\sidetext}[1]{\textcolor{colortextside}{#1}}

% mandatory personal information
\newcommand*{\cvname}[1]{\renewcommand{\cvname}{#1}}
\newcommand*{\cvjobtitle}[1]{\renewcommand{\cvjobtitle}{#1}}

% profile picture (optional)
\newcommand{\plotprofilepicture}{}
\newcommand*{\cvprofilepic}[1]{
	\renewcommand{\cvprofilepic}{#1}
    
    \ifthenelse{\equal{\profilepicstyle}{profilerounded}}{
        \renewcommand{\plotprofilepicture}{\profileroundedcorners}
    }{
	    \ifthenelse{\equal{\profilepicstyle}{profilecircle}}{
    		\renewcommand{\plotprofilepicture}{\profilecircle}
	    }{
	        \renewcommand{\plotprofilepicture}{\profilesharpcorners}
    	}
    }	
}

% additional logo (optional)
\newcommand{\plotlogobefore}{}
\newcommand{\plotlogoafter}{}
\newcommand*{\cvlogopic}[1]{%
	% default = before; if any other (incl. 'after') --> after
	\ifthenelse{\equal{\logoposition}{before}}{%
		\renewcommand{\plotlogobefore}{%
			\begin{figure}\centering%
				\includegraphics[align=c, width=\logowidth]{#1}%
			\end{figure}
			\vspace*{\logospace}%
		}%
	}{%
		\renewcommand{\plotlogoafter}{%
			\vspace*{\logospace}%
			\begin{figure}\centering%
				\includegraphics[align=c, width=\logowidth]{#1}%
			\end{figure}
		}%
	}
}

% social network item; \social{<icon>}{<url>}{<text>}
\newcommand*{\social}[3]{%
	\socialicon{#1} & \cvHref{#2}{\sidetext{#3}}
	\\
}

% personal information item; \personal{<icon>}{<text>}
\newcommand*{\personal}[2]{%
	\circleicon{#1} & {\sidetext{#2}}\\%
}

% other personal information as macro that can be used later. Usage:
% \cvcustomdata{<Icon>}{<Text>}
% icon can be taken from FontAwesome or Academicon for example
\newcommand{\personaldata}{}
\newcommand*{\cvcustomdata}[2]{%
	\apptocmd{\personaldata}{\personal{#1}{#2}}{}{}%
}

% useful shortcuts
% NOTE: we use href instead of url so user can decide textformatting since url
% automatically uses \texttt{} as format for the url
\newcommand*{\cvbirthday}[1]{\cvcustomdata{\faUser}{\sidetext{#1}}}
\newcommand*{\cvaddress}[1]{\cvcustomdata{\faEnvelope}{\sidetext{#1}}}
\newcommand*{\cvphone}[1]{\cvcustomdata{\faPhone}{\cvHref{tel:#1}{\sidetext{#1}}}}
\newcommand*{\cvsite}[1]{\cvcustomdata{\faGlobe}{\cvHref{#1}{\sidetext{#1}}}}
\newcommand*{\cvmail}[1]{\cvcustomdata{\faAt}{\cvHref{mailto:#1}{\sidetext{#1}}}}
\newcommand*{\cvkey}[2]{\cvcustomdata{\faKey}{%
	\cvHref{insert_key_link_here}{\sidetext{#1}}%
}}

% TODO find a cleaner solution for consistent spacing
\newcommand{\nameandjob}{%
	{\Huge\color{colorname}\cvname}\par%
	\setlength{\parskip}{2ex}
    {\Large\color{colorjobtitle}\cvjobtitle}\par%
	\setlength{\parskip}{1ex}
}

\newcommand{\profileroundedcorners}{%
	\begin{figure}\centering
		% see TikZ/pgf v3.1.1 manual §2.11 (clipping), §14.5 (rounded corners),
		% §12 (scopes), §13.2 (coordinate systems)
		\begin{tikzpicture}[x=\profilepicsize, y=\profilepicsizey]
			\begin{scope}
				\path[clip]
					%(0, 0) [sharp corners] --
					(0, 0) [rounded corners=\profilepicrounding] --
					(0, 1) [rounded corners=\profilepicrounding] --
					%(1, 1) [sharp corners] --
					(1, 1) [rounded corners=\profilepicrounding] --
					(1, 0) [rounded corners=\profilepicrounding] -- cycle;
				\node[anchor=center, inner sep=0pt, xshift=\profilepicxshift,
						yshift=\profilepicyshift] (profilepic) at (0.5, 0.5)
					{\includegraphics[width=\profilepiczoom\profilepicsize]
						{\cvprofilepic}};
			\end{scope}
			\ifdim \profilepicborderwidth > 0pt
				\begin{scope}
					\draw[line width=\profilepicborderwidth, color=colorphotoframe]
					%(0, 0) [sharp corners] --
					(0, 0) [rounded corners=\profilepicrounding] --
					(0, 1) [rounded corners=\profilepicrounding] --
					%(1, 1) [sharp corners] --
					(1, 1) [rounded corners=\profilepicrounding] --
					(1, 0) [rounded corners=\profilepicrounding] -- cycle;
				\end{scope}
			\fi
		\end{tikzpicture}
	\end{figure}
}

\newcommand{\profilesharpcorners}{%
	\begin{figure}\centering
		% see TikZ/pgf v3.1.1 manual §2.11 (clipping), §14.5 (rounded corners),
		% §12 (scopes), §13.2 (coordinate systems)
		\begin{tikzpicture}[x=\profilepicsize, y=\profilepicsizey]
			\begin{scope}
				\path[clip]
					(0, 0) [sharp corners] --
					(0, 1) [sharp corners] --
					(1, 1) [sharp corners] --
					(1, 0) [sharp corners] -- cycle;
				\node[anchor=center, inner sep=0pt, xshift=\profilepicxshift,
						yshift=\profilepicyshift] (profilepic) at (0.5, 0.5)
					{\includegraphics[width=\profilepiczoom\profilepicsize]
						{\cvprofilepic}};
			\end{scope}
			\ifdim \profilepicborderwidth > 0pt
				\begin{scope}
					\draw[line width=\profilepicborderwidth, color=colorphotoframe]
					(0, 0) [sharp corners] --
					(0, 1) [sharp corners] --
					(1, 1) [sharp corners] --
					(1, 0) [sharp corners] -- cycle;
				\end{scope}
			\fi
		\end{tikzpicture}
	\end{figure}
}

\newcommand{\profilecircle}{%
	\begin{figure}\centering
		\begin{tikzpicture}[x=\profilepicsize, y=\profilepicsize]
			\begin{scope}
				\clip (0, 0) circle (0.5);
				\node[anchor=center, inner sep=0pt, outer sep=0pt,
						xshift=\profilepicxshift, yshift=\profilepicyshift]
					(profilepic) at (0,0) {
				\includegraphics[width=\profilepiczoom\profilepicsize]
					{\cvprofilepic}};
			\end{scope}
			\ifdim \profilepicborderwidth > 0pt
				\begin{scope}
					\draw[line width=\profilepicborderwidth, color=colorphotoframe]
						(0, 0) circle (0.5\profilepicsize);
				\end{scope}
			\fi
		\end{tikzpicture}
	\end{figure}
}

% table with 2 columns for icons and text
% \icontable{<width 1st column>}{<space between columns>}{<arraystretch>}
\newenvironment{icontable}[3][1]
{
	\renewcommand{\arraystretch}{#1}% increase linespacing in tables; default=1
	\iftoggle{tshowframes}
	{
		% https://tex.stackexchange.com/a/42331
		\tabularx{\widthBlockTextBanner}{|m{#2} | @{\hskip #3} | X|} \hline%
	}{
		\tabularx{\widthBlockTextBanner}{m{#2} @{\hskip #3} X}%
	}
}{
	\endtabularx%
}

% icon style for personal information
\newcommand*\circleicon[1]{%
	\tikz[baseline = (char.base)]{%
		\node[%
			shape=circle,%
			draw,%
			inner sep=1pt,%
			fill=coloricon,%
			coloricon,%
			text=colorbackgroundside,%
			minimum size=\hsize%
		] (char) {#1};%
	}%
}

% icon style for social network
\newcommand*{\socialicon}[1]{%
	\resizebox{\hsize}{!}{\textcolor{coloricon}{#1}}%
}

% make sure about me text stays in textbox frame
\newcommand{\aboutme}[1]{\parbox[b]{\linewidth}{\sidetext{#1}}}

% uniform icon style for all skill icons, e.g. flags or fontawesome icons
\newcommand{\cvIcon}[1]{\makebox[1em]{\color{coloricon} #1}}
\newcommand{\flag}[1]{\includegraphics[align=c, width=1em]{#1}}

% \pointskill[<indent>]{<icon>}{<description>}{<points>}[<maxpoints>] creates
% | [indent] [icon]  description  \hfill  ● ● ● ○ ○ |
% -- inspired by arravc.cls by LianTze Lim: https://github.com/liantze/AltaCV
\NewDocumentCommand{\pointskill}{ O{0em} m m m O{5} }{%
	\hspace{#1} \cvIcon{#2} ~ \sidetext{#3} \hfill%
	\foreach \x in {1,...,#5}{%
		\space%
		{\ifnumgreater{\x}{#4}{\color{colorpointskillunfilled}}{\color{colorpointskillfilled}}% from etoolbox
		% don't use totalheight; see https://tex.stackexchange.com/a/41014
		\raisebox{0.5\height-0.4ex}{\scriptsize\faCircle}%
		}
	}\par%
}

\newcommand{\barskill}[4][1ex]{
	% remove 1pt in width to prevent overfull box warnings
	\begin{tikzpicture}[x=\widthBlockTextBanner-1pt, y=#1]
			\draw[fill, colorbarskillunfilled, rounded corners=0.25em]
				(0, 0) rectangle (1, 1);
			\draw[fill, colorbarskillfilled, rounded corners=0.25em]
				(0, 0) rectangle (#4/100, 1);
			\node[above right] at (0, 1) {\cvIcon{#2} ~ \sidetext{#3}};
	\end{tikzpicture}
	\par
}

% \skill[<indent>]{<icon>}{<description>} creates in sidebanner
% | [indent] [icon]  some longer skill description  |
\newcommand{\skill}[3][0em]{
	\hspace{#1} \parbox{0.5em}{\cvIcon{#2}} \parbox{1em}{\char32} \parbox{\linewidth-#1-2.5em}{\sidetext{#3}}%
	\hfill \par%
}
\newcommand{\skillcircle}[3][0em]{
	\hspace{#1} \parbox{0.5em}{\cvIcon{\circleicon{#2}}} \parbox{1em}{\char32} \parbox{\linewidth-#1-2.5em}{\sidetext{#3}}%
	\hfill \par%
}


% label for wheel charts
\newcommand{\recticlebean}[2][colorrecticlebackground]{%
	\begin{tikzpicture}
	\node[
		fill=#1, % interior color
		anchor=base,
		draw=#1, % line color
		rounded corners,
		inner xsep=1ex, % distance from left/right border to text
		inner ysep=0.75ex, % distance top/bottom border to text
		text height=1.5ex, % align text vertically in box (at least as resulting
		text depth=.25ex   % effect)
	]{#2};%
	\end{tikzpicture}
}


\newenvironment{sidebannerminipage}%
	{\begin{minipage}{\widthBlockTextBanner}}%
	{\end{minipage}}%


\newenvironment{memberships}[1][1em]%
{%
	\iftoggle{tshowframes}{%
		\tabularx{\widthBlockTextBanner}{|l | @{\hskip #1} | X|} \hline%
	}{%
		\tabularx{\widthBlockTextBanner}{l @{\hskip #1} X}%
	}
}{%
	\endtabularx%
}%


\newcommand{\membership}[3][4em]{
	\includegraphics[align=c,width=#1]{#2} & \sidetext{#3} \\[3ex]
}

% adapted from https://tex.stackexchange.com/a/82729
\newcommand{\wheelchart}[4][-90]{%
	\def\outerradius{#2}%
	\def\innerradius{#3}%
	% Calculate total
	\pgfmathsetmacro{\totalnum}{0}%
	\foreach\value/\colour/\name in {#4} {%
		\pgfmathparse{\value+\totalnum}%
		\global\let\totalnum=\pgfmathresult%
	}%
	\begin{tikzpicture}

		% Calculate the thickness and the middle line of the wheel
		\pgfmathsetmacro{\wheelwidth}{\outerradius-\innerradius}
		\pgfmathsetmacro{\midradius}{(\outerradius+\innerradius)/2}

		% Rotate so we start from the top
		\begin{scope}[rotate=#1, on background layer]
		% Loop through each value set. \cumnum keeps track of where we are in the
		% wheel
		\pgfmathsetmacro{\cumnum}{0}
		\foreach \value/\width/\colour/\name in {#4} {
			\pgfmathsetmacro{\newcumnum}{\cumnum + \value/\totalnum*360}

			% Calculate the percent value
			\pgfmathsetmacro{\percentage}{\value/\totalnum*100}
			% Calculate the mid angle of the colour segments to place the labels
			\pgfmathsetmacro{\midangle}{-(\cumnum+\newcumnum)/2}

			% This is necessary for the labels to align nicely
			\pgfmathparse{
				(-\midangle>180?"west":"east")
			} \edef\textanchor{\pgfmathresult}
			\pgfmathparse{
				(-\midangle>180?"flush left":"flush right")
			} \edef\textalign{\pgfmathresult}
			\pgfmathsetmacro\labelshiftdir{1-2*(-\midangle<180)}

			% Draw the color segments. Somehow, the \midrow units got lost, so
			% we add 'pt' at the end. Not nice...
			\filldraw[draw=white,fill=\colour]
				(-\cumnum:\outerradius)
				arc (-\cumnum:-(\newcumnum):\outerradius)
				-- (-\newcumnum:\innerradius)
				arc (-\newcumnum:-(\cumnum):\innerradius)
				-- cycle;

			% Draw the data labels
			\draw [*-,thin,colorrecticlebackground] node [append after command={
				(\midangle:\midradius pt) --
				(\midangle:\outerradius + 1ex) --
				(\tikzlastnode)}] at (\midangle:\outerradius + 1ex) [
				xshift=\labelshiftdir*0.5cm,inner sep=1ex,
				outer sep=0pt,
				text width=\width,
				anchor=\textanchor,
				align=\textalign,
				font=\small,
				text=colorrecticletext
			]{\name};
			% Set the old cumulated angle to the new value
			\global\let\cumnum=\newcumnum
		}
		\end{scope}
	\end{tikzpicture}\par
}

\newcommand{\cvsignature}{
	\vfill
	{\large\bfseries\color{colorsignature}\today \hfill \cvname}
}

% skill recticles with pre-set colors
\newcommand{\recticlepoor}[1]{\recticlebean[colorpoorbackground]{{\color{colorpoortext}#1}}}
\newcommand{\recticlesubpar}[1]{\recticlebean[colorsubparbackground]{{\color{colorsubpartext}#1}}}
\newcommand{\recticlefair}[1]{\recticlebean[colorfairbackground]{{\color{colorfairtext}#1}}}
\newcommand{\recticlegood}[1]{\recticlebean[colorgoodbackground]{{\color{colorgoodtext}#1}}}
\newcommand{\recticlegreat}[1]{\recticlebean[colorgreatbackground]{{\color{colorgreattext}#1}}}
% L_____________________________________________________________________________