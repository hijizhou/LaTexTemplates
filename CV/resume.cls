%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Professional CV - CLASS FILE
%
% Original header:
% Copyright (C) 2017
%
% The MIT License
%
% Permission is hereby granted, free of charge, to any person obtaining a copy
% of this software and associated documentation files (the "Software"), to deal
% in the Software without restriction, including without limitation the rights
% to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
% copies of the Software, and to permit persons to whom the Software is
% furnished to do so, subject to the following conditions:
%
% The above copyright notice and this permission notice shall be included in
% all copies or substantial portions of the Software.
%
% THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
% IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
% FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
% AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
% LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
% OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
% SOFTWARE.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\ProvidesClass{resume}[2017/06/24]

\LoadClass[11pt,letterpaper]{article} % Font size and paper type

\usepackage[parfill]{parskip} % Remove paragraph indentation
\usepackage{array} % Required for boldface (\bf and \bfseries) tabular columns
\usepackage{ifthen} % Required for ifthenelse statements

\pagestyle{empty} % Suppress page numbers

% To finetune lists with a inline heading and indented content.
% See the Experiences section in the example.
\usepackage{mdwlist}

% For multiple column text.
\usepackage{multicol}

% For \textscale, which I prefer over \sc (small caps).
% See the \acr command definition below.
\usepackage{relsize}

% Setup the hyperrefs witht he right color.
\usepackage{hyperref}  
\usepackage{xcolor}
\definecolor{dark-blue}{rgb}{0.15,0.15,0.4}
\hypersetup{colorlinks,linkcolor={dark-blue},citecolor={dark-blue},urlcolor={dark-blue}}

% XeTeX specific stuff with fall-back.
\usepackage{ifxetex}
\ifxetex

\usepackage{fontspec}

% the main font, with all features on
\setmainfont
[ ExternalLocation ,
Mapping          = tex-text ,
Numbers          = OldStyle ,
Ligatures        = {Common,Contextual} ,
BoldFont         = texgyrepagella-bold.otf ,
ItalicFont       = texgyrepagella-italic.otf ,
BoldItalicFont   = texgyrepagella-bolditalic.otf ]
{texgyrepagella-regular.otf}

% same like the main font, but without old-style nums
\newfontfamily\newnums
[ ExternalLocation ,
Mapping          = tex-text ,
Ligatures        = {Common,Contextual} ,
BoldFont         = texgyrepagella-bold.otf ,
ItalicFont       = texgyrepagella-italic.otf ,
BoldItalicFont   = texgyrepagella-bolditalic.otf ]
{texgyrepagella-regular.otf}
% Comment out the previous statement and uncomment the following line to use the
% Linux Libertine font (it has nice lignatures).
% Make sure to have the `ttf-linux-libertine` package installed on Ubuntu.
%  \setmainfont[Mapping=tex-text, Numbers=OldStyle, Ligatures={Common,Contextual}]{Linux Libertine O}

% needs an experimental and impossible to find package for xetex
\usepackage[protrusion]{microtype}

\else

% this case we likely use the `pdftex` back-end
% therefor we lack:
%  * lower case numbers,
%  * ligatures and
%  * some typographic niceties
% We do make use of the possibility to use `microtype`
\usepackage{tgpagella}
\usepackage[expansion,protrusion]{microtype}

\fi



%%% DOCUMENT WIDE STYLING

\pagestyle{empty}
\setlength{\tabcolsep}{0em}
\xspaceskip7pt  % some more spacing between sentences (use "i.e.\ " or "with SQL\@. " in case of errors)



%%% CUSTOM COMMANDS

% main title (name) with subtitle (date)
\newcommand\maintitle[3]{\vbox to 0pt{\hfill\scriptsize\color{gray} #3}\vspace{-0.4em}\noindent{\LARGE \textbf{#1}}\ \ \ \emph{#2}}

% title for the root sections (experience, education, etc) of the resume
\newcommand*\roottitle[1]{\subsection*{#1}\vspace{-0.3em}\nopagebreak[4]}

% acr command, to quickly mark acronyms for special formatting
\newcommand*\acr[1]{\textscale{.85}{#1}}

% pretty bullet (created from a much smaller centerdot), \sbull contains its spacing
\newcommand*\bull{\raisebox{-0.365em}[-1em][-1em]{\textscale{4}{$\cdot$}}}
\newcommand*\sbull{\ \ \bull \ \ }

% it seems not to work when simply using \parindent...
\newlength{\newparindent}
\addtolength{\newparindent}{\parindent}

% a double \parindent...
\newlength{\doubleparindent}
\addtolength{\doubleparindent}{\parindent}
\addtolength{\doubleparindent}{\parindent}

% indentsection style, used for sections that aren't already in lists
% that need indentation to the level of all text in the document
\newenvironment{indentsection}%
{\begin{list}{}%
		{\setlength{\leftmargin}{\newparindent}\setlength{\parsep}{0pt}\setlength{\parskip}{0pt}\setlength{\itemsep}{0pt}\setlength{\topsep}{0pt}}%
	}
	{\end{list}}

% headerrow command, used for a new employer
\newcommand{\headedsection}[3]{\nopagebreak[4]\begin{indentsection}\item[]\textscale{1.1}{#1}\hfill#2#3\end{indentsection}\nopagebreak[4]}

% subheaderrow command, used for a new position
\newcommand{\headedsubsection}[3]{\nopagebreak[4]\begin{indentsection}\item[]\textbf{#1}\hfill\emph{#2}#3\end{indentsection}\nopagebreak[4]}

% body text (indented)
\newcommand{\bodytext}[1]{\nopagebreak[4]\begin{indentsection}\item[]#1\end{indentsection}\pagebreak[2]}

% \vspace variaties
\newcommand{\breakvspace}[1]{\pagebreak[2]\vspace{#1}\pagebreak[2]}
\newcommand{\nobreakvspace}[1]{\nopagebreak[4]\vspace{#1}\nopagebreak[4]}

% \spacedhrule a horizontal line with some vertical space before and after it
\newcommand{\spacedhrule}[2]{\breakvspace{#1}\hrule\nobreakvspace{#2}}

% \inlineheadsection command, used for a new employer
\newcommand{\inlineheadsection}[2]{\begin{basedescript}{\setlength{\leftmargin}{\doubleparindent}}\item[\hspace{\newparindent}\textbf{#1}]#2\end{basedescript}\vspace{-1.7em}}

% apo command, for an apostrophe that looks good on old style nums
\newcommand{\apo}{\raisebox{-.18ex}{'}{\hspace{-.1em}}}

% non space that allows line breaks
\newcommand*{\nsp}{\hskip0pt}



%%% MORE SPECIFIC COMMANDS

% CPP command (found it in some corner of the internet and decided to use it)
\newcommand{\CPP}{C\nolinebreak[4]\hspace{-.04em}\raisebox{.20ex}{\footnotesize\bf++}}

%----------------------------------------------------------------------------------------
%	HEADINGS COMMANDS: Commands for printing name and address
%----------------------------------------------------------------------------------------

\def \name#1{\def\@name{#1}} % Defines the \name command to set name
\def \@name {} % Sets \@name to empty by default

\def \addressSep {$\diamond$} % Set default address separator to a diamond

% One, two or three address lines can be specified 
\let \@addressone \relax
\let \@addresstwo \relax
\let \@addressthree \relax

% \address command can be used to set the first, second, and third address (last 2 optional)
\def \address #1{
  \@ifundefined{@addresstwo}{
    \def \@addresstwo {#1}
  }{
  \@ifundefined{@addressthree}{
  \def \@addressthree {#1}
  }{
     \def \@addressone {#1}
  }}
}

% \printaddress is used to style an address line (given as input)
\def \printaddress #1{
  \begingroup
    \def \\ {\addressSep\ }
    \centerline{#1}
  \endgroup
  \par
  \addressskip
}

% \printname is used to print the name as a page header
\def \printname {
  \begingroup
    \hfil{\MakeUppercase{\namesize\bf \@name}}\hfil
    \nameskip\break
  \endgroup
}

%----------------------------------------------------------------------------------------
%	PRINT THE HEADING LINES
%----------------------------------------------------------------------------------------

\let\ori@document=\document
\renewcommand{\document}{
  \ori@document  % Begin document
  \printname % Print the name specified with \name
  \@ifundefined{@addressone}{}{ % Print the first address if specified
    \printaddress{\@addressone}}
  \@ifundefined{@addresstwo}{}{ % Print the second address if specified
    \printaddress{\@addresstwo}}
     \@ifundefined{@addressthree}{}{ % Print the third address if specified
    \printaddress{\@addressthree}}
}

%----------------------------------------------------------------------------------------
%	SECTION FORMATTING
%----------------------------------------------------------------------------------------

% Defines the rSection environment for the large sections within the CV
\newenvironment{rSection}[1]{ % 1 input argument - section name
  \sectionskip
  \MakeUppercase{\bf #1} % Section title
  \sectionlineskip
  \hrule % Horizontal line
  \begin{list}{}{ % List for each individual item in the section
    \setlength{\leftmargin}{1.5em} % Margin within the section
  }
  \item[]
}{
  \end{list}
}
\newenvironment{rAward}[1]{ % 1 input argument - section name
	\sectionskip
	\MakeUppercase{\bf #1} % Section title
	\sectionlineskip
	\hrule % Horizontal line
	\begin{list}{}{ % List for each individual item in the section
			\setlength{\leftmargin}{0em} % Margin within the section
		}
		\item[]
	}{
	\end{list}
}
\newenvironment{rMember}[1]{ % 1 input argument - section name
	\sectionskip
	\MakeUppercase{\bf #1} % Section title
	\sectionlineskip
	\hrule % Horizontal line
	\begin{list}{}{ % List for each individual item in the section
			\setlength{\leftmargin}{0em} % Margin within the section
		}
		\item[]
	}{
	\end{list}
}

\newenvironment{rPublication}[1]{ % 1 input argument - section name
	\sectionskip
	\MakeUppercase{\bf #1} % Section title
	\sectionlineskip
	\hrule % Horizontal line
	\begin{list}{}{ % List for each individual item in the section
			\setlength{\leftmargin}{1.5em} % Margin within the section
		}
		\item[]
	}{
	\end{list}
}
\newenvironment{rSubpublication}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
	\hspace{-6mm}{\bf #1} \hfill {#2} % Bold company name and date on the right
	\ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
		\\
		{\hspace*{-6mm}\em #3} \hfill {\em #4} % Italic job title and location
	}\smallskip
	}{
	\vspace{0.5em} % Some space after the list of bullet points
}
%----------------------------------------------------------------------------------------
%	WORK EXPERIENCE FORMATTING
%----------------------------------------------------------------------------------------

\newenvironment{rSubsection}[4]{ % 4 input arguments - company name, year(s) employed, job title and location
 \hspace{-6mm}{\bf #1} \hfill {#2} % Bold company name and date on the right
 \ifthenelse{\equal{#3}{}}{}{ % If the third argument is not specified, don't print the job title and location line
  \\
  {\hspace*{-6mm}\em #3} \hfill {\em #4} % Italic job title and location
  }\smallskip
  \begin{list}{$\cdot$}{\leftmargin=0em} % \cdot used for bullets, no indentation
   \itemsep -0.5em \vspace{-0.5em} % Compress items in list together for aesthetics
  }{
  \end{list}
  \vspace{0.5em} % Some space after the list of bullet points
}

% The below commands define the whitespace after certain things in the document - they can be \smallskip, \medskip or \bigskip
\def\namesize{\huge} % Size of the name at the top of the document
\def\addressskip{\smallskip} % The space between the two address (or phone/email) lines
\def\sectionlineskip{\medskip} % The space above the horizontal line for each section 
\def\nameskip{\bigskip} % The space after your name at the top
\def\sectionskip{\medskip} % The space after the heading section