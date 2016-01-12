\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{shortpaper}%[Short Paper Format 9/2003 (ngf)]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}}

\ProcessOptions

\LoadClass{article}

\RequirePackage{chapterbib}
\RequirePackage{graphicx}



% I was trying to move the page numbers to the foot, but it looked ugly:
%
%\let\ps@myheadings@orig\ps@myheadings
%\def\ps@myheadings{%
%  \ps@myheadings@orig%
%  \def\@oddhead{\hfil{\slshape\leftmark}}%
%  \def\@evenhead{{\slshape\leftmark}\hfil}%
%  \def\@oddfoot{\hfil\thepage}%
%  \def\@evenfoot{\thepage\hfil}%
%}

\newcommand{\fp}{\vspace*{0.06in}\noindent}
\renewcommand{\b}{$\bullet$}
\renewcommand{\paragraph}[1]{\fp {\bf #1}}

\renewenvironment{thebibliography}[1]
     {\formatsection{References}\penalty4000
       \vspace*{-0.1in}
      \list{\@biblabel{\@arabic\c@enumiv}}%
           {\settowidth\labelwidth{\@biblabel{#1}}%
            \leftmargin\labelwidth
            \advance\leftmargin\labelsep
            \@openbib@code
            \usecounter{enumiv}%
            \let\p@enumiv\@empty
            \renewcommand\theenumiv{\@arabic\c@enumiv}}%
      \sloppy
      \clubpenalty4000
      \@clubpenalty \clubpenalty
      \widowpenalty4000%
      \setlength{\itemsep}{-1pt}%
      \sfcode`\.\@m}
     {\def\@noitemerr
       {\@latex@warning{Empty `thebibliography' environment}}%
      \endlist}

\renewcommand{\thefigure}{\@arabic\c@figure}
\renewcommand{\thetable}{\@arabic\c@table}
\renewcommand{\theequation}{\@arabic\c@equation}

\newcommand{\formattitle}[2]{%
  \cleardoublepage%
  \suppressfloats[t]%
  \setcounter{figure}{0}%
  \setcounter{table}{0}%
  \setcounter{equation}{0}%
  \setcounter{footnote}{0}%
%  \begin{center}{\large\bf #1}\\\vspace{2ex plus  1ex}\textit{#2}\end{center}%
  \begin{center}{\Large\bf #1}\\\vspace{1ex}\textit{#2}\end{center}%
%  \vspace{2ex plus 1ex}%
}

\newcommand{\formatcontents}[2]{%
  \addtocontents{toc}{\protect\contentsline{section}{#1}{\thepage}}%
  \addtocontents{toc}{%
    \protect\begin{quotation}%
      \vskip-\topsep\noindent%
      \protect\it#2%
    \protect\end{quotation}%
  }%
}

\newcommand{\formattitlecontents}[2]{%
  \formattitle{#1}{#2}%
  \formatcontents{#1}{#2}%
}

\def\formatsection#1{\vspace{12pt}\noindent\textbf{#1}\vspace{5pt}}

\setlength{\topmargin}{-0.625in}    % really 0.375in
\setlength{\headsep}{0.50in}
\setlength{\footskip}{0.64in}
\setlength{\textheight}{9.2in}

\setlength\oddsidemargin{0.25in}   % really 1.25in
\setlength\evensidemargin{-0.25in} % really 0.75in
\setlength\textwidth{6.5in}

\setlength\parskip{1ex plus .5ex}

\newcommand{\bibtex}[1]{\bibliography{#1}\bibliographystyle{IEEE}}

\usepackage{fancyhdr}
\def\heading{Title, Date}
%\pagestyle{myheadings}
%\markboth{\heading}{\heading}
\pagestyle{fancyplain}
\lhead{{\em \heading}}
\cfoot{}

%% Only for submission
\setlength{\topmargin}{-0.625 in}
\setlength{\textheight}{9.5 in}
\setlength{\textwidth}{6.75 in}
\setlength{\textfloatsep}{4pt}
\setlength{\floatsep}{4pt}
\setlength{\intextsep}{10pt}
\setlength{\oddsidemargin}{0 in}
\setlength{\parskip}{0 ex}
%\setlength{\parindent}{0 ex}

%\renewcommand{\baselinestretch}{0.99}