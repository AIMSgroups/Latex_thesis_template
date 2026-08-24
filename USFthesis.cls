%%
%% USFthesis.cls 2026 version V1.0
%%   derived from SJSUthesis.cls 2018-12-21 V0.2 by David C. Anastasiu,
%%   which was itself derived from IEEEtran.cls 2015/08/26 version V1.8b
%%   by Michael Shell.
%%
%% MODIFIED FILE NOTICE (per LPPL 1.3): this file is a modified version of
%% SJSUthesis.cls. It has been renamed and adapted for theses and
%% dissertations at the University of South Florida. It is NOT the original
%% SJSU class and is not endorsed by its original authors.
%%
%% Adapted for USF by: Nima Karimian
%%   Bellini College of Artificial Intelligence, Cybersecurity and Computing
%%   University of South Florida
%%
%%*************************************************************************
%% Legal Notice:
%% This code is offered as-is without any warranty either expressed or
%% implied; without even the implied warranty of MERCHANTABILITY or
%% FITNESS FOR A PARTICULAR PURPOSE!
%% User assumes all risk.
%%
%% This work is distributed under the LaTeX Project Public License (LPPL)
%% ( http://www.latex-project.org/ ) version 1.3, and may be freely used,
%% distributed and modified. A copy of the LPPL, version 1.3, is included
%% in the base LaTeX documentation of all distributions of LaTeX released
%% 2003/12/01 or later.
%% Retain all contribution notices and credits.
%%
%% File list of work: USFthesis.cls, IEEEtran.cls, main.tex, references.bib
%%
%%*************************************************************************
%%
%
% IMPORTANT: this class implements the USF College of Engineering /
% Graduate Studies front-matter conventions (title page carrying the
% degree statement, committee list, date of approval, keywords, and the
% copyright line; separate Certificate of Approval is filed by the
% Graduate School and is NOT typeset here). Always check the current USF
% ETD format guide before submitting and correct any discrepancies.
%
% Available class options
% e.g., \documentclass[12pt,dissertation]{USFthesis}
%
%             *** choose only one from each category ***
%
% 9pt, 10pt, 11pt, 12pt
%    Sets normal font size. The default is 12pt.
%
% dissertation, thesis, project
%    Determines format mode. "dissertation" is used for a doctoral
%    dissertation, "thesis" for a master's thesis, "project" for a
%    capstone project. The default is dissertation.
%
% 3committee, 4committee, 5committee
%    Number of committee members: 3, 4, or 5. The default is 4.
%
% copyrightpage, nocopyrightpage
%    Whether to also print a standalone copyright page in addition to the
%    copyright line on the title page. The default is nocopyrightpage,
%    which matches USF practice.
%
% tables
%    Add list of tables page (default for thesis/dissertation).
%
% figures
%    Add list of figures page (default for thesis/dissertation).
%
% Examples:
%
%   For a doctoral dissertation with 5 committee members:
%     \documentclass[dissertation,5committee]{USFthesis}
%
%   For a master's thesis:
%     \documentclass[thesis]{USFthesis}
%
%
% Notes:
%
%   The acknowledgments, dedication, abbreviations, appendices, and
%   about-the-author sections are optional; the abstract is required.
%

\ProvidesClass{USFthesis}[2026/01/01 V1.0 USF thesis and dissertation class]
\typeout{-- USFthesis: University of South Florida thesis/dissertation class.}
\typeout{-- Adapted from SJSUthesis.cls (D. C. Anastasiu), which derives from IEEEtran.cls V1.8b (M. Shell).}
\typeout{-- Verify against the current USF ETD format guide before submitting.}

% current version
\def\USFthesisversionmajor{1}
\def\USFthesisversionminor{0}

% default class options
\def\@optdoctype{dissertation}
\def\@optptsize{12pt}
\def\@optnumside{oneside}
\def\@optnumcolumn{onecolumn}
\def\@optfinish{final}
\def\@optspacing{double}

%%%%%%
% Declare options
%%%%%%

% Font size
\DeclareOption{9pt}{\def\@optptsize{9pt}}
\DeclareOption{10pt}{\def\@optptsize{10pt}}
\DeclareOption{11pt}{\def\@optptsize{11pt}}
\DeclareOption{12pt}{\def\@optptsize{12pt}}

% Draft or final
\DeclareOption{draft}{\def\@optfinish{draftclsnofoot}}
\DeclareOption{final}{\def\@optfinish{final}}

% Spacing
\newif\if@doublespacing \@doublespacingtrue
\DeclareOption{double}{\def\@optspacing{double}\@doublespacingtrue}
\DeclareOption{single}{\def\@optspacing{single}\@doublespacingfalse}

% Margins
\newif \if@optwidemargins \@optwidemarginsfalse
\DeclareOption{wide}{\@optwidemarginstrue}

% List of tables
\newif \if@optlisttables \@optlisttablesfalse
\DeclareOption{tables}{\@optlisttablestrue}

% List of figures
\newif \if@optlistfigures \@optlistfiguresfalse
\DeclareOption{figures}{\@optlistfigurestrue}

% One or two sided printing
\DeclareOption{oneside}{\def\@optnumside{oneside}}
\DeclareOption{twoside}{\def\@optnumside{twoside}}

% One or two columns
\DeclareOption{onecolumn}{\def\@optnumcolumn{onecolumn}}
\DeclareOption{twocolumn}{\def\@optnumcolumn{twocolumn}}

% number of committee members
\newif\if@fourcommittee \@fourcommitteetrue
\newif\if@fivecommittee \@fivecommitteefalse
\DeclareOption{3committee}{\@fourcommitteefalse \@fivecommitteefalse}
\DeclareOption{4committee}{\@fourcommitteetrue \@fivecommitteefalse}
\DeclareOption{5committee}{\@fourcommitteetrue \@fivecommitteetrue}

% standalone copyright page (USF puts the copyright line on the title page)
\newif\if@optcopyrightpage \@optcopyrightpagefalse
\DeclareOption{copyrightpage}{\@optcopyrightpagetrue}
\DeclareOption{nocopyrightpage}{\@optcopyrightpagefalse}
% retained for backward compatibility with the SJSU class; unused at USF
\newif\if@libraryrightspage \@libraryrightspagefalse

% Document type
\DeclareOption{dissertation}{\def\@optdoctype{dissertation}
					   \def\@optspacing{double}
                       \def\@optnumcolumn{onecolumn}
                       \@optlisttablestrue
                       \@optlistfigurestrue
}
\DeclareOption{thesis}{\def\@optdoctype{thesis}
					   \def\@optspacing{double}
                       \def\@optnumcolumn{onecolumn}
                       \@optlisttablestrue
                       \@optlistfigurestrue
}
\DeclareOption{project}{\def\@optdoctype{project}
 					   \def\@optspacing{single}\@doublespacingfalse
                       \def\@optnumcolumn{twocolumn}
                       \@optwidemarginstrue
}

% Pass other options to IEEEtran
\DeclareOption{romanappendices}{\PassOptionsToClass{romanappendices}{IEEEtran}}
\DeclareOption{nofonttune}{\PassOptionsToClass{nofonttune}{IEEEtran}}


\DeclareOption*{\PassOptionsToClass{\CurrentOption}{IEEEtran}}
\ProcessOptions\relax
% default to US letter paper, 12pt, onecolumn, one sided, final, draft with no footer
\LoadClass[letterpaper,\@optptsize,
			\@optnumside,\@optnumcolumn,\@optfinish,
            journal,compsoc]{IEEEtran}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set some default values for certain things.
\def\@title{}
\def\@author{Nima Karimian}
\def\@dept{Computer Science and Engineering}
\def\@college{Bellini College of Artificial Intelligence, Cybersecurity and Computing}
\def\@university{University of South Florida}
\def\@degree{Doctor of Philosophy}
\def\@concentration{}
\def\@approvaldate{}
\def\@keywords{}
\def\@graduationmonth{May}
\def\@copyrightyear{\number\the\year}
\def\@copyrightholder{Nima Karimian}
\def\@abstract{abstract}  % Default file name for abstract
\def\@references{references}  % Default file name for references


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Basic packages and definitions

\RequirePackage{ifthen}
\RequirePackage{times}
\RequirePackage{etoolbox} % needed for AfterEndPreamble
\RequirePackage{setspace} % needed for single- and double-space
\RequirePackage[letterpaper, vmargin={1.25in, 1.25in}, hmargin={1.5in, 1in}, includeheadfoot]{geometry}  % set page margins
\RequirePackage{microtype}
\RequirePackage[all]{nowidow}   % prevent widows and orphans
\RequirePackage[compress,sort,nobreak]{cite}
\RequirePackage{hyperref} % Creates links in the PDF document.
\hypersetup{hidelinks} % Do not include boxes around links
\PassOptionsToPackage{hyphens}{url}
\RequirePackage{mfirstuc} % Capitalize single word
\RequirePackage{indentfirst} % Indent the first paragraph after section or chapter heading
\RequirePackage{xspace} % ensure spaces where needed
\RequirePackage{layout}

% Set no limit on percentage of floats per page
\renewcommand{\floatpagefraction}{1.0}
\renewcommand{\topfraction}{1.0}
\renewcommand{\textfraction}{0.0}

% used to make correct pdf index for hyperref
\def\addcustomcontentsline{}

% Set \@worktype to "Dissertation", "Thesis", or "Project", based on doc type
\def\@worktype{%
  \xmakefirstuc{\@optdoctype}\xspace
}
% lowercase form used in the running prose of the title page
\def\@worktypelc{\@optdoctype\xspace}

% Disable full paper if only wanting library page
\if@libraryrightspage
  \@noprelimtrue
  \@simplereftrue
  \@wantchapterreffalse
  \@sequentialtrue
  \@nobibtrue
  \def\@include#1 {}%
\fi

% -- Custom functions --

\let\IEEEappendices \appendices
\def\dept#1{\gdef\@dept{#1}}
\def\department#1{\gdef\@dept{#1}}
\def\college#1{\gdef\@college{#1}}
\def\university#1{\gdef\@university{#1}}
\def\degreename#1{\gdef\@degree{#1}}
\def\concentration#1{\gdef\@concentration{#1}}
\def\approvaldate#1{\gdef\@approvaldate{#1}}
\def\keywords#1{\gdef\@keywords{#1}}
\def\copyrightholder#1{\gdef\@copyrightholder{#1}}
\def\aboutauthor#1{\gdef\@aboutauthor{#1}}
\def\graduationmonth#1{\gdef\@graduationmonth{#1}}
\def\copyrightyear#1{\gdef\@copyrightyear{#1}}
\def\references#1{\gdef\@references{#1}}
\def\abstract#1{\gdef\@abstract{#1}}
\def\acknowledgments#1{\gdef\@acknowledgments{#1}}
\def\dedication#1{\gdef\@dedication{#1}}
\def\abbreviations#1{\gdef\@abbreviations{#1}}
\def\appendices#1{\gdef\@appendices{#1}}

\def\committee#1#2{
  \@ifundefined{@committeeA}{%
    \gdef\@committeeA{#1}
    \gdef\@affiliationA{#2}
  }{
  \@ifundefined{@committeeB}{%
    \gdef\@committeeB{#1}
    \gdef\@affiliationB{#2}
  }{
  \@ifundefined{@committeeC}{%
    \gdef\@committeeC{#1}
    \gdef\@affiliationC{#2}
  }{
  \@ifundefined{@committeeD}{%
    \gdef\@committeeD{#1}
    \gdef\@affiliationD{#2}
  }{
    \gdef\@committeeE{#1}
    \gdef\@affiliationE{#2}
  }}}}
}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Set page dimensions.
\setlength{\oddsidemargin}{.5in}
\setlength{\textwidth}{5.95in}
\setlength{\textheight}{8.5in}
\setlength{\topmargin}{-0.25in}
\setlength{\footskip}{0.5in}

\newlength{\@realheadsep}
\newlength{\@realtextheight}
\setlength{\@realheadsep}{0.4in}
\setlength{\@realtextheight}{8.5in}
\setlength{\headsep}{\@realheadsep}
\setlength{\textheight}{\@realtextheight}

% Lengths used by preambleheadings where we expand the header and shrink
% the text body to allow the heading on each page within original margins.
\newlength{\@headerextra}
\setlength{\@headerextra}{0.25in}

\newlength{\@altheadsep}
\setlength{\@altheadsep}{\@realheadsep}

\newlength{\@alttextheight}
\setlength{\@alttextheight}{\@realtextheight}

\newlength{\@fullheadheight}
\setlength{\@fullheadheight}{\headheight}
\addtolength{\@fullheadheight}{\@realheadsep}

\newlength{\@headtofootheight}
\setlength{\@headtofootheight}{\@alttextheight}
\addtolength{\@headtofootheight}{\@realheadsep}


% set paragraph indentation to 0.25in
\raggedright
\setlength{\parindent}{0.25in}

% Set double spacing command for 12pt font.
\def\doublespace{%
  \renewcommand{\baselinestretch}{1.66}
  \renewcommand{\arraystretch}{0.602}
  \normalsize%
}

% Set double spacing command for 11pt font.
\def\@tmppt{2}
\ifx\@ptsize\@tmppt
  \def\doublespace{%
    \renewcommand{\baselinestretch}{1.62}
    \renewcommand{\arraystretch}{0.617}
    \normalsize%
  }
\fi

% Set double spacing command for 10pt font.
\def\@tmppt{1}
\ifx\@ptsize\@tmppt
  \def\doublespace{%
    \renewcommand{\baselinestretch}{1.67}%
    \renewcommand{\arraystretch}{0.599}%
    \normalsize%
  }
\fi

% fixes hyperref warning
\providecommand*{\toclevel@sectionx}{0}

\if@doublespacing
  \doublespace
\fi


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deal with sections -- should have same spacing and font as the rest of the thesis

% compsoc
\ifCLASSOPTIONcompsoc
\ifCLASSOPTIONconference
% compsoc conference
\def\section{\@startsection{section}{1}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\normalsize\bfseries}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}{\normalfont\normalsize\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{1\baselineskip plus 0.25\baselineskip minus 0.25\baselineskip}%
{0ex}{\normalfont\normalsize\bfseries}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{0ex plus 0.1ex minus 0.1ex}%
{0ex}{\normalfont\normalsize}}%
\else% compsoc journals
% % use negative top separation as compsoc journals do not indent paragraphs after section titles
\def\section{\@startsection{section}{1}{\z@}{-1.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus 0.5ex minus 0ex}{\normalfont\normalsize\bfseries\uppercase}}%
\def\subsection{\@startsection{subsection}{2}{\z@}{-1.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus 0.5ex minus 0ex}{\normalfont\normalsize\bfseries}}%
\def\subsubsection{\@startsection{subsubsection}{3}{\z@}{-1.5ex plus -1.5ex minus -1.5ex}%
{0.7ex plus 0.5ex minus 0ex}{\normalfont\normalsize\itshape}}%
\def\paragraph{\@startsection{paragraph}{4}{2\parindent}{-0ex plus -0.1ex minus -0.1ex}%
{0ex}{\normalfont\normalsize}}%
\fi\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Deal with figures and tables - the description should be in the same font type and size as the thesis
\ifCLASSOPTIONcompsoc
% V1.7 compsoc \@makecaption
\ifCLASSOPTIONconference% compsoc conference
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@IEEEtablestring%
% if a table, do table caption
\footnotesize\bgroup\par\centering\@IEEEtabletopskipstrut{\normalfont\normalsize {#1.}\nobreakspace #2}\par\addvspace{0.5\baselineskip}\egroup%
\@IEEEtablecaptionsepspace
% if not a table, format it as a figure
\else
\@IEEEfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\normalsize {#1.}\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\normalsize {#1.}\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\normalsize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, center
\else%
\hbox to\hsize{\normalfont\normalsize\hfil\box\@tempboxa\hfil}%
\fi\fi}
%
\else% nonconference compsoc
\long\def\@makecaption#1#2{%
% test if is a for a figure or table
\ifx\@captype\@IEEEtablestring%
% if a table, do table caption
\normalsize\bgroup\par\centering\@IEEEtabletopskipstrut{\normalfont\normalsize #1}\\{\normalfont\normalsize #2}\par\addvspace{0.5\baselineskip}\egroup%
\@IEEEtablecaptionsepspace
% if not a table, format it as a figure
\else
\@IEEEfigurecaptionsepspace
\setbox\@tempboxa\hbox{\normalfont\normalsize {#1.}\nobreakspace #2}%
\ifdim \wd\@tempboxa >\hsize%
% if caption is longer than a line, let it wrap around
\setbox\@tempboxa\hbox{\normalfont\normalsize {#1.}\nobreakspace}%
\parbox[t]{\hsize}{\normalfont\normalsize \noindent\unhbox\@tempboxa#2}%
% if caption is shorter than a line, left justify
\else%
\hbox to\hsize{\normalfont\normalsize\box\@tempboxa\hfil}%
\fi\fi}
\fi
\fi



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fix some standard labels

% Sets name of bibliography file to main.bbl assuming the
% main.tex file was not renamed.
\def\@bibliofileext{bib}
\def\@bibliofile{\jobname\@bibliofileext}

% Set some names used as chapter headings.
\renewcommand\contentsname{\normalfont\normalsize Table of Contents}
\renewcommand\listtablename{\normalfont\normalsize List of Tables}
\renewcommand\listfigurename{\normalfont\normalsize List of Figures}
\renewcommand\refname{Literature Cited}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% These two things must be done after all other packages are included,
% specifically cite and/or overcite.
\AfterEndPreamble{
  % Redefine nocite so it writes to the bibliography only, and
  % doesn't complain about undefined references since bibtex
  % will complain anyway.  It came from latex.ltx.
  \def\nocite#1{\@bsphack
    \@for\@citeb:=#1\do{%
      \edef\@citeb{\expandafter\@firstofone\@citeb}%
      \if@filesw\immediate\write12{\string\citation{\@citeb}}\fi
    }\@esphack}

  % Redefine \bibliographystyle and \bibliography to do nothing 
  % They should not be used by the user.
  \bibliographystyle{ieeetr}
  \def\bibliographystyle#1{}
  \let \USFbibliography \bibliography
  \def\bibliography#1{}
  % Reset Bibliography font to normalsize and make space between items doublespace
  \IEEEtriggercmd{\reset@font\normalfont\normalsize\singlespace\vspace{-5pt}}
  \IEEEtriggeratref{1}
  \def\IEEEbibitemsep{\baselineskip}
}




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Fix TOC, LOT, LOF formatting
%
%% LOF and LOT require more customization to match template in Guidelines -- using tocbasic package
\RequirePackage{tocbasic}

\renewcommand\@dotsep{1}
\setcounter{tocdepth}{4}
\renewcommand*\l@section{%
    \vspace{\baselineskip}
	\@dottedtocline{1}{0.25in}{0.25in}
    }
\renewcommand*\l@subsection{
	\@dottedtocline{2}{0.5in}{0.5in}
    }
\renewcommand*\l@subsubsection{
	\@dottedtocline{3}{0.75in}{0.6in}
    }
\renewcommand*\l@paragraph{
	\@dottedtocline{4}{1.00in}{0.7in}
    }
\renewcommand*\l@subparagraph{
	\@dottedtocline{5}{1.25in}{1.0in}
    }
% NOTE (USF adaptation): the upstream class wrote these headings as
% \MakeUppercase\contentsname, \MakeUppercase\listfigurename, and
% \MakeUppercase\listtablename. Under current LaTeX releases, applying
% \MakeUppercase to those IEEEtran-defined names sends the compiler into an
% infinite loop -- the build stalls silently right after the abstract page.
% The headings are written out literally instead, which also matches the
% wording USF requires for major headings.
\def\tableofcontents{%
	\section*{\centering\normalfont{TABLE OF CONTENTS}\vspace{-1em}}%
	{{ \singlespace\@starttoc{toc} }}%
    }% end \tableofcontents
    
\newcommand\entrynumberwithprefix[2]{#1\enspace#2.\hfill}
\DeclareTOCStyleEntry[
  entrynumberformat=\entrynumberwithprefix{Fig.},
  beforeskip=1em plus 1pt,
  dynnumwidth,
  numsep=1em
]{tocline}{figure}
\DeclareTOCStyleEntry[
  entrynumberformat=\entrynumberwithprefix{Table},
  beforeskip=1em plus 1pt,
  dynnumwidth,
  numsep=1em
]{tocline}{table}
\renewcommand\listoffigures{%
    \section*{\centering\normalfont{LIST OF FIGURES}\vspace{-\baselineskip}}%
	{{%
      \singlespace\@starttoc{lof}%
    }}%
    \addcontentsline{toc}{section}{\listfigurename}%
    }% end \listoffigures
\renewcommand\listoftables{%
    \section*{\centering\normalfont{LIST OF TABLES}\vspace{-\baselineskip}}%
	{{ \singlespace\@starttoc{lot} }}%
    \addcontentsline{toc}{section}{\listtablename}%
    }% end \listoftables


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Preamble headings
% This is the heading used for list of figures and list of tables.
% The header actually generates both the header and the page number
% on the bottom of the page because \textheight may be incorrect on
% the last page of the list if there is a single entry that gets pushed
% to the next page.
\def\ps@preambleheadings{%
  \let\@mkboth\@gobbletwo%
  \let\@oddfoot\@empty%
  \let\@evenfoot\@empty%
  \let\@evenhead\@empty%
  \def\@oddhead{%
     \settoheight{\@tmpheighta}{\rightmark}%
     \settoheight{\@tmpheightb}{\thepage}%
     \shortstack{%
        \rule{0in}{\@fullheadheight}\rule{\textwidth}{0in}\\%
        \rightmark\\%
        \rule{0in}{\@headtofootheight}%
          \vspace{-\@tmpheighta}\vspace{-\@tmpheightb}\\%
        \thepage}}%
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Adjust spacing for captions and related environments.

% Set single spacing in figures, tables, etc.  This is from latex.ltx.
\def \@floatboxreset {%
        \singlespace
        \reset@font
        \normalsize
        \@setminipage
}

% Set single spacing in footnotes.
\let\ele@footnotetext\@footnotetext
\def\@footnotetext#1{{\singlespace%
                      \ele@footnotetext{#1}}}

% Set single spacing in quote and quotation environment.
% These are from report.cls.
\renewenvironment{quotation}
                 {\list{}{\singlespace%
                          \listparindent 1.5em%
                          \itemindent    \listparindent
                          \rightmargin   \leftmargin
                          \parsep        \z@ \@plus\p@}%
                  \item\relax}
                 {\endlist}
\renewenvironment{quote}
                 {\list{}{\singlespace%
                          \rightmargin\leftmargin}%
                  \item\relax}
                 {\endlist}

% Set single spacing in the verbatim environment.
% This is from latex.ltx.
\def\verbatim{\singlespace%
      \@verbatim \frenchspacing\@vobeyspaces \@xverbatim}

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Create pages of the thesis/project.

% NOTE: the SJSU "Library Rights Statement" page has been removed. USF does
% not use it; distribution rights are handled through the ETD submission
% agreement in ProQuest/Digital Commons.

% Create the title page (USF format).
%   2" top margin, everything centered, copyright line at the foot.
\def\titlepage{%
\thispagestyle{empty}%
\begin{center}
  \singlespace
  \vspace*{0.75in}

  {\MakeUppercase{\@title}}

  \vspace{3\baselineskip}

  by

  \vspace{3\baselineskip}

  {\@author}

  \vspace{3\baselineskip}

  A \@worktypelc submitted in partial fulfillment

  of the requirements for the degree of

  \@degree

  \ifthenelse{\equal{\@concentration}{}}{}{with a concentration in \@concentration}

  Department of \@dept

  \@college

  \@university

  \vspace{3\baselineskip}

  {\renewcommand{\arraystretch}{1}
  \begin{tabular}{c}
    \@committeeA \\
    \@committeeB \\
    \@committeeC \\
    \if@fourcommittee \@committeeD \\ \fi
    \if@fivecommittee \@committeeE \\ \fi
  \end{tabular}}

  \vspace{2\baselineskip}

  Date of Approval:\ \@approvaldate

  \vspace{2\baselineskip}

  \begin{minipage}{0.85\linewidth}\centering
  Keywords:\ \@keywords
  \end{minipage}

  \vspace{2\baselineskip}

  Copyright \copyright~\@copyrightyear, \@copyrightholder
\end{center}
\newpage
}


% Create the optional standalone copyright page.
%   Off by default: USF places the copyright line on the title page.
%   Enable with the "copyrightpage" class option.
\def\copyrightpage{%
  \if@optcopyrightpage
    \thispagestyle{empty}%
    \null
    \vfill
    \begin{center}
    \doublespace
    Copyright \copyright~{\@copyrightyear}, {\@copyrightholder}

    ALL RIGHTS RESERVED

    \vspace{0.5\baselineskip}
    \end{center}
    \newpage
  \fi
}

% NOTE: USF uses a separately signed Certificate of Approval filed with the
% Graduate School; it is not typeset as part of the manuscript. The committee
% is listed on the title page instead. \committeepage is defined as a no-op so
% that older documents continue to compile.
\def\committeepage{}

% Create abstract page(s), counted, not numbered.
\def\abstractpage{\@ifundefined{@abstract}{}{
  \newpage
  \pagestyle{empty}
  \vspace*{-1.5\baselineskip}
  \section*{\centering {\normalfont\normalsize\singlespace ABSTRACT\\
  			\vspace{0.5\baselineskip} {\MakeUppercase{\@title}}\\ 
            \MakeLowercase{by} \@author}}
  \input{\@abstract}
}}

% Create acknowledgments page, counted, numbered.
\def\acknowledgementpage{\@ifundefined{@acknowledgments}{}{
  \newpage
  \pagestyle{plain}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize ACKNOWLEDGMENTS}}
  \input{\@acknowledgments}
}}

% Create dedication page, not counted, not numbered.
\def\dedicationpage{\@ifundefined{@dedication}{}{
  \newpage
  \pagestyle{plain}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize DEDICATION}}
  \input{\@dedication}
}}

% Create abbreviations page, counted, numbered.
\def\abbreviationspage{\@ifundefined{@abbreviations}{}{
  \newpage
  \pagestyle{plain}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize LIST OF ABBREVIATIONS}}
  \input{\@abbreviations}
  \addcontentsline{toc}{section}{List of Abbreviations}
}}

% Create the optional "About the Author" page, not numbered (USF requirement).
\def\aboutauthorpage{\@ifundefined{@aboutauthor}{}{
  \newpage
  \thispagestyle{empty}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize ABOUT THE AUTHOR}}
  \input{\@aboutauthor}
}}

% Create appendices page, counted, numbered.
\def\appendixpages{\@ifundefined{@appendices}{}{
  \newpage
  \IEEEappendices
  \input{\@appendices}
}}

% Create preface page(s), counted, numbered.
\def\prefacepages{\@ifundefined{@preface}{}{
  \newpage
  \pagestyle{plain}
  \vspace*{-1.5\baselineskip}
  \section*{\centering{\normalfont\normalsize PREFACE}}
  \addcontentsline{toc}{section}{Preface}
  \input{\@preface}
}}

% Create Table of Contents page(s), counted, numbered.
\def\tocpages{%
  \setlength{\textheight}{\@alttextheight}%
  \newpage
  \pagestyle{plain}
  \setlength{\headsep}{\@altheadsep}%
  \tableofcontents
  \setlength{\textheight}{\@realtextheight}%
}%

% Create List of Tables page(s), counted, numbered.
\def\lotpages{%
  \if@optlisttables
    \setlength{\textheight}{\@alttextheight}%
    \newpage
    \pagestyle{preambleheadings}%
    \setlength{\headsep}{\@altheadsep}%
    \listoftables
    \setlength{\textheight}{\@realtextheight}%
  \fi
}%

% Create List of Figures page(s), counted, numbered.
\def\lofpages{%
  \if@optlistfigures
    \setlength{\textheight}{\@alttextheight}%
    \newpage
    \pagestyle{preambleheadings}%
    \setlength{\headsep}{\@altheadsep}%
    \listoffigures
    \setlength{\textheight}{\@realtextheight}%
  \fi
}%

% Produce all of the pages up to the start of section 1.
\def\startingpages{%
  \pagenumbering{arabic}
  \setcounter{page}{0}
  \pagenumbering{roman}
  \pagestyle{plain}
  \titlepage
  \copyrightpage
  \dedicationpage
  \acknowledgementpage
  \abstractpage
  \prefacepages
  \tocpages
  \lotpages
  \lofpages
  \abbreviationspage
  % Finalize preamble pages
  \addtocontents{toc}{ }
  \newpage
  \setlength{\headsep}{\@realheadsep}%
}

% Allow for wide margins in the project
\def\widemargins{
  \if@optwidemargins
	\newgeometry{left=0.75in,right=0.75in,top=0.75in,bottom=0.75in}
  \fi
}


\AfterEndPreamble{
  % Preamble should always be onecolumn
  \newif\iftwocol
  \if@twocolumn
    \onecolumn
    \twocoltrue
  \fi
  % open the aux file for the bibliography
  \immediate\openout12=\@bibliofile.aux
  \immediate\write12{\string\bibstyle{ieeetr}}
  \immediate\write12{\string\bibdata{\@references}}
  \newcounter{@tmppage}
  \newlength{\@tmpheighta}
  \newlength{\@tmpheightb}
  \if@libraryrightspage
  	% Print only the library page
    \libraryrightspage
  \else
    % Include the starting pages
    \startingpages
    % Reset page numbering and page type
    \pagenumbering{arabic}
    \pagestyle{plain}
    % Reset back to twocolumn and wide margins if need be
    \iftwocol \twocolumn \fi
    \widemargins
    \newgeometry{left=1.5in,right=1.05in,top=1.25in,bottom=1.25in}
    % Add page break after each section
    \let\oldsection\section
	\renewcommand\section{\clearpage\oldsection}
    % Add sections
    \include{sections}
    % Include the bibliography
    \USFbibliography{references}
    % Include appendices if they exist
    \appendixpages
    % Include the About the Author page if it exists
    \aboutauthorpage
  \fi%
}

\endinput


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% End of USFthesis.cls  %%%%%%%%%%%%%%%%%%%%%%%%%%%%
% That's all folks!

