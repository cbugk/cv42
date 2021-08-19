\newcommand{\drawpagenumber}[2]{
    \begin{tikzpicture}[remember picture,overlay]
    \color{#1}
    \node at ($(current page.south)+(0mm, \heightMarginPaperBottom - 2mm)$)
    [anchor=north] {#2};
    \end{tikzpicture}
}


