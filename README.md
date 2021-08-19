# cv42

## Description

My two cents on a LaTeX based CV (LaTeX, because I can. Also how cool is producing a pdf via code!)

I recommend actually giving a shot to original projects attributed below, if more customization is required. However, if this is good enough as is, then jump on. After a few major updates, that suggestion might fade away.

Feel free to scrap whatever code back into the upstreams.

## How to use
Development is done on a free account at [Overleaf](https://overleaf.com). Uploading a zip archive of this repo should suffice. You can deploy your own Overleaf site via their docker image. Using your prefered way of LaTeX programming is of course possible.

## Attributions

* cv42 is based and inspired by
  [FortySecondsCV class](https://github.com/PandaScience/FortySecondsCV)
  by René Wirnata
* FortySecondsCV was based on the style ideas of the
  [twentysecondscv class](https://github.com/spagnuolocarmine/TwentySecondsCurriculumVitae-LaTex)
  by Carmine Spagnuolo
* Language icons in the template are taken from [gosquared's repository](https://github.com/gosquared/flags)


## Requirements

You need to compile your document with XeLaTeX or LuaLaTeX in order to have
the latest Font Awesome icons (`fontawesome5`) and Academicons. If you still
want to compile with pdfLaTeX for whatever reason, cv42 will fall
back to the older icon package (`fontawesome`), where some icons look
different and some others are not even included~~ Academicons won't be
available.

## License

cv42 is distributed under the BSD 3-Clause license. See LICENSE
file for more information.

## User Interface

Class options are replaced with good old config files.


Function names have been changed, and alternative versions produced. Currently documentation is not offered, yet the structure is somewhat decriptable if one follows the order of imports in cv42.cls and cv42.tex files. Those two are the only files by which others can be imported.
