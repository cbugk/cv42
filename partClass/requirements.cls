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