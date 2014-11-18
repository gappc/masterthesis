%% This class was build from Bernd Sint
%% for the master thesis
%% It was updated and modified by
%%   Thomas Zangerl
%%   Max Berger
%%
%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{dpsmthesis}[2008/12/11 DPS master theses document class]
%% For options see
%% ftp://ftp.dante.de/tex-archive/macros/latex/contrib/koma-script/scrguide.pdf
%%
%% Please DO NOT CHANGE ANY OPTIONS / STYLE WITHOUT CONSULTING YOUR ADVISOR FIRST!
\LoadClass[a4paper, twoside, openright, dcolumn,
					 11pt,
					 abstracton,
					 idxtotoc,
					 BCOR=20mm,
					 chapterprefix]{scrreprt}
\RequirePackage[english,ngerman]{babel}
%%\RequirePackage{glossaries}
\makeglossary
\RequirePackage{bibgerm}
\RequirePackage{url}
\RequirePackage{setspace}
\RequirePackage[komastyle]{scrpage2}
\RequirePackage[final]{pdfpages}
\RequirePackage[utf8]{inputenc}
\RequirePackage{graphicx}
\RequirePackage{dcolumn}
\RequirePackage{color}
\RequirePackage{listings}
%% Ensure PDF links are not of different color
\RequirePackage[colorlinks=true,
        linkcolor=black,
        citecolor=black,
        filecolor=black,
        pagecolor=black,
        urlcolor=black,
        bookmarks=true,
        bookmarksopen=true,
        bookmarksopenlevel=3,
        plainpages=false,
        pdfpagelabels=true]{hyperref}
\RequirePackage[nottoc]{tocbibind}
\DeclareOption{english}{\AtBeginDocument{\selectlanguage{english}}}
\DeclareOption{german}{\AtBeginDocument{\selectlanguage{ngerman}}}
\ExecuteOptions{english}
\ProcessOptions\relax

\AtBeginDocument{%
 \definetoday
}
\newcommand\definetoday{%
 \renewcommand*\today{%
  \iflanguage{english}{%
   \number\day\space \ifcase\month\or%
    January\or%
    February\or%
    March\or%
    April\or%
    May\or%
    June\or%
    July\or%
    August\or%
    September\or%
    October\or%
    November\or%
    December\or%
   \fi\space \number\year
  }{%
   \number\day.~\ifcase\month\or%
    J\"anner\or%
    Februar\or%
    M\"arz\or%
    April\or%
    Mai\or%
    Juni\or%
    Juli\or%
    August\or%
    September\or%
    Oktober\or%
    November\or%
    Dezember%
   \fi\space \number\year
 }%
 }
}
%% For easier reading
\renewcommand{\baselinestretch}{1.1}

%% Hurenkinder und Schusterjungen verbieten
\clubpenalty = 9999
\widowpenalty = 9999 
\displaywidowpenalty = 9999

%\newenvironment{listing}
%{\begin{list}{}{\setlength{\leftmargin}{0em}}\item\normalsize\bfseries}
%{\end{list}}



\newenvironment{tinylisting}
{\begin{framed}\begin{list}{}{\setlength{\leftmargin}{0em}}\item\tiny\bfseries}
{\end{list}\end{framed}}

\newcommand*\institute[1]{\gdef\@institute{#1}}
\global\let\@matriculationnumber\@empty
\newcommand*\mailaddress[1]{\gdef\@mailaddress{#1}}
\newcommand*\matriculationnumber[1]{\gdef\@matriculationnumber{#1}}
\newcommand*\plaintitle[1]{\gdef\@plaintitle{#1}}
\newcommand*\plainauthor[1]{\gdef\@plainauthor{#1}}
\newcommand\kindname{%
 \iflanguage{english}{Master~Thesis}{Diplomarbeit}%
}
\newcommand\supervisorname{%
 \iflanguage{english}{supervisor}{Betreuer}%
}
\newcommand\degreename{%
% \iflanguage{english}{Master of Science}{Diplom-Ingenieur}%
{Master of Science}
}
\subject{\kindname}
\newcommand{\supervisor}[1]{%
 \def\@supervisor{#1}
 \publishers{\textbf{\supervisorname:} #1}
}




\newcolumntype{d}[1]{D{.}{.}{#1}}

%% START HERE WITH THE TITLE PAGE
%% --------------------------------------------------------




\renewcommand*\maketitle[1][-1]{{%
 \setcounter{page}{#1}
 \pagestyle{empty}
 \begin{center}
 {\LARGE\textbf{\@plaintitle}\par}
 \vskip 3em
 {\Large\textbf{%
  \iflanguage{english}{%
   master thesis in computer science
  }{%
   Diplomarbeit in der Studienrichtung Informatik
  }
 }}
 \vskip 3em
 {\Large \iflanguage{english}{by}{von}}
 \vskip 3em
 {\LARGE\textbf{\@plainauthor}}\par
 \vskip 3em
 {\Large\vbox{%
  \iflanguage{english}{
   submitted to the Faculty of Mathematics, Computer \\
   Science and Physics of the University of Innsbruck
   \vskip 2em
   in partial fulfillment of the requirements \\
   for the degree of \degreename
  }{
   eingereicht an der \\
   Fakult\"at f\"ur Mathematik, Informatik und Physik \\
   der Universit\"at Innsbruck
   \vskip 2em
   zur Erlangung des akademischen Grades \\
   \degreename
  }
 }}\par
 \vfill
 {\Large
  \iflanguage{english}{%
   \expandafter\lowercase\expandafter{\supervisorname}%
  }{\supervisorname}%
  : \@supervisor, \@institute
 }\par
 \vfill
 {\Large\textbf{Innsbruck, \@date}}
 \end{center}


%% Second or alternative titel PAGE
%% --------------------------------------------------------
% \cleardoublepage
% \thispagestyle{empty}
% \let\footnotesize\small
% \let\footnoterule\relax
% \let\footnote\thanks
% \renewcommand*\thefootnote{\@fnsymbol\c@footnote}%
% \let\@oldmakefnmark\@makefnmark
% \renewcommand*{\@makefnmark}{\rlap\@oldmakefnmark}
% \newbox\dpsbox
% \newbox\ifibox
% \newbox\unibox
% \newdimen\logoheight
% \setbox\dpsbox=\hbox{\includegraphics[scale=0.5]{pics/dpsLogo.png}}
% \setbox\ifibox=\hbox{\includegraphics[scale=0.5]{pics/ifilogo.png}}
% \setbox\unibox=\hbox{\includegraphics[scale=1]{pics/unilogo.png}}
% \logoheight=\ht\dpsbox
% \begin{center}
% \hbox to \textwidth{%
%  \rlap{\box\dpsbox}
%  \hfill
%  \hbox{\vbox to \logoheight{\box\ifibox \vfill}}
%  \hfill
%  \llap{\box\unibox}
% }
% \ifx\@subject\@empty \else
%  {\Large \@subject \par}
%  \vskip 3em
% \fi
% {\titlefont\huge \@title\par}
% \vskip 3em
% {\Large \lineskip 0.75em
% \begin{tabular}[t]{c}
%  \@author{}
%  \ifx\@matriculationnumber\@empty{}\else(\@matriculationnumber)\fi \\
%  \texttt{\@mailaddress}
% \end{tabular}\par}
% \vskip 1.5em
% {\Large \@date \par}
% \vskip \z@ \@plus3fill
% {\Large \@publishers \par}
% \vskip 3em
% \end{center}\par
% \@thanks
% \global\let\@thanks\@empty
% \vfill\null
% \vskip 3em
% \@thanks
 
 
 \newpage
 \cleardoublepage
 \setcounter{footnote}{0}
 \pagenumbering{roman}\setcounter{page}{1}
 \pagestyle{scrheadings}
 \iflanguage{english}{
 \chapter*{Certificate of authorship/originality}
I certify that the work in this thesis has not previously been submitted for a
degree nor has it been submitted as part of requirements for a degree except as
fully acknowledged within the text.
\par
\bigskip
I also certify that the thesis has been written by me. Any help that I have
received in my research work and the preparation of the thesis itself has been
acknowledged. In addition, I certify that all information sources and
literature used are indicated in the thesis.
 \vskip 5em
 \begin{flushright}
 		\@plainauthor, Innsbruck on the \@date
 \end{flushright}
 }{
 \chapter*{Eidesstattliche Erkl"arung}
 Ich erkl"are an Eides statt, dass ich die vorliegende Arbeit selbst"andig und
 ohne fremde Hilfe verfasst, andere als die angegebenen Quellen nicht ben"utzt
 und die den benutzten Quellen w"ortlich oder inhaltlich entnommenen Stellen
 als solche kenntlich gemacht habe.
 \vskip 5em
 \begin{flushright}
 		\@plainauthor, Innsbruck am \@date
 \end{flushright}
 }
 \cleardoublepage
}
}

%% Force KOMAscript to re-calculate margins
\KOMAoptions{DIV=last}

%% avoid annoying text overflow
\setlength{\emergencystretch}{2em}
