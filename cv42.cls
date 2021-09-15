% ANY IMPORT IS PERFORMED ON "cv42.cls" OR "cv42.tex" (FLAT TREE)

% +-----------------------------------------------------------------------------
% | CLASS NAME AND VERSION
% |
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{cv42}[2021/08/16 CV class]
% L_____________________________________________________________________________

% +-----------------------------------------------------------------------------
% | REQUIRED PACKAGES
% |
% for seperated files (one exception to requirements)
\RequirePackage{import}

\import{./partClass/}{requirements.cls}
% L_____________________________________________________________________________


% +-----------------------------------------------------------------------------
% | CONFIGURATION CONSTANTS - under "config" directory, always ".tex" files
% |

\newlength{\unknownTextBlockAdjustLengt}
\setlength{\unknownTextBlockAdjustLengt}{2mm}

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
\import{./partClass/}{classOptions.cls}
% L_____________________________________________________________________________


% +-----------------------------------------------------------------------------
% | GLOBAL LAYOUT AND HEADINGS STYLE
% |
\import{./partClass/}{globalLayout.cls}
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
