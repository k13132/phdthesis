\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{phdthesis}[2015/01/01 v0.1 (Ing. Milos Kozak - milos.kozak@fel.cvut.cz)]

\newif\if@literature \@literaturefalse
\DeclareOption{literature}{\@literaturetrue}

\newif\if@statement \@statementfalse
\DeclareOption{statement}{\@statementtrue}

\newif\if@print \@printfalse
\DeclareOption{print}{\@printtrue}


\ProcessOptions \relax

% Volba rozlozeni stranky na zaklade zda se jedna o tezi nebo plnou disertaci
\if@statement
	\LoadClass[twoside,a4paper,11pt]{article}
	\RequirePackage[margin=2cm, bottom=2.5cm, top=2cm, right=2cm]{geometry}
	% Fancy header for main text
	%\RequirePackage{fancyhdr}
	
	% Delimiter of front ad main text
	\newcommand{\mainmatter}{
		\newpage
		\pagenumbering{arabic}
		%\pagestyle{fancy}
	}
	
\else
	\LoadClass[12pt, oneside, a4paper]{book}
	\RequirePackage[margin=2cm, left=3cm, top=3cm]{geometry}
\fi


\RequirePackage{graphicx}

% Informace o skole - mozno menit dynamicky skrze optiony
\newcommand\University{Czech Technical University in Prague}
\newcommand\Faculty{Faculty of Electrical Engineering}
\newcommand\Department{Department of Telecommunication Engineering}
\newcommand\PhDProgram{Electrical Engineering and Information Technology}
\newcommand\PhDBranch{Telecommunication Engineering}

% Makra pro definici vedouciho prace
\def \@supervisor{Unknown}
\newcommand{\supervisor}[1]{ \def \@supervisor{#1} }

\def \@authorAffiliation{Unknown}
\newcommand{\authorAffiliation}[1]{ \def \@authorAffiliation{#1} }

\def \@supervisorAffiliation{Unknown}
\newcommand{\supervisorAffiliation}[1]{ \def \@supervisorAffiliation{#1} }

\def \@placeyear{Prague, June 2015}
\newcommand{\placeyear}[1]{ \def \@placeyear{#1} }




% Makra pro rychlejsi reference
\newcommand{\figref}[1]{\figurename~\ref{#1}}
\newcommand{\tabref}[1]{Table \ref{#1}}
\newcommand{\secref}[1]{Section \ref{#1}}


% Uvodni stranka
\renewcommand\maketitle{\par
	% Volba stylu uvodni stranky
	\if@literature
		\@literaturetitle
	\else
		\if@statement
		\@statementtitle
		\else
		\@fullthesis
		\fi
	\fi

	\global\let\thanks\relax
	\global\let\maketitle\relax
	\global\let\@maketitle\relax
	\global\let\@thanks\@empty
	\global\let\@author\@empty
	\global\let\@date\@empty
	\global\let\@title\@empty
	\global\let\title\relax
	\global\let\author\relax
	\global\let\date\relax
	\global\let\and\relax
}

% Predni stranka pro vlastni disertacni praci
\def\@fullthesis{%
	\frontmatter
	\begin{center}%		
		\large\sffamily
		\University\\
		\Faculty\\
		\Department\\
		\vglue 20mm
		\includegraphics[width=50mm]{images/LogoCVUT}
		\vglue 30mm
		{\Large\bfseries\@title}\\
		\vglue 5mm
		{\large\sffamily Disertation thesis} \\
		\vglue 10mm	
		{\large\emph{\@author}}\\
		\vglue 30mm
		{\large 
		{Ph.D. programme: \PhDProgram} \\
		{Branch of study: \PhDBranch} \\
		{Supervisor: \@supervisor} \\
		} 
		\vglue 30mm
		\@placeyear \\
				
	\end{center}%
	\thispagestyle{empty}
	% Strana 2
	\newpage
	
	\rule{0pt}{0pt}
	\vfill
	\begin{description}
		\item[Thesis Supervisor:] ~\\
		\@supervisor\\
		\@supervisorAffiliation
	\end{description}
	Copyright {\copyright} {\@date} {\@author}
	
	% Page with declaration
	\chapter*{Declaration}
	I hereby declare I have written this doctoral thesis independently and quoted all the sources of information used in accordance with methodological instructions on ethical principles for writing an academic thesis. Moreover, I state that this thesis has neither been submitted nor accepted for any other degree.
	
	\vspace{5mm}
	\noindent
	In \@placeyear
	
	\vspace{10mm}
	\hfill\parbox[t]{8cm}{%
		\centering
		............................................ \\
		\@author \\
	}
	
}

% Predni stranka pro tezi
\def\@statementtitle{%
	\pagenumbering{Roman}
	\begin{center}%		
		{\LARGE\sffamily
		\University\\
		\Faculty\\
		\Department\\
		\vglue 50mm
		\includegraphics[width=130mm]{images/LogoCVUT}
		\vfill
		{\LARGE\bfseries DISSERTATION THESIS STATEMENT}
		}
	\end{center}%
	\thispagestyle{empty}
	
	% Strana 2
	\newpage
	\if@print
		~ \thispagestyle{empty}
		\newpage
	\fi
	
	\begin{center}
	{\Large\sffamily
		\University\\
		\Faculty\\
		\Department
		\vfill
	
		{\sffamily\bfseries\@title}\\
		\bigskip
		{by}\\
		\bigskip
		{\large\emph{\@author}}\\
		\vfill
		
		{\large
		Ph.D. Programme: \PhDProgram \\
		Branch of study: \PhDBranch} \\
		
		\vglue 1cm
		\ifx\PhDSpecialization\undefined\relax\else{Specialization: \PhDSpecialization}\fi
		\vfill
		Dissertation thesis statement for obtaining \\ the academic title of ``Doctor'' abbreviated to ``Ph.D.''
		\vglue 1cm
		\@placeyear
	}
	\end{center}
	\thispagestyle{empty}
	\frontmatter
	\newpage
		
	% Strana 3 - autori a vedouci
	\pagenumbering{roman}
	
{\small
\noindent The dissertation thesis was written during full-time, part-time doctoral study at the \Department, \Faculty of the Czech Technical University in Prague.
	\vglue .5cm
	\noindent\hbox to 3cm{\hbox{Ph.D. Candidate:}\hss}\parbox[t]{8cm}{
		\textbf{\@author} \\
		\@authorAffiliation}
	\vglue .5cm
	\noindent\hbox to 3cm{\hbox{Supervisor:}\hss}\parbox[t]{8cm}{%
		\textbf{\@supervisor} \\
		\@supervisorAffiliation}
	\vglue 1cm
	
	\noindent\hbox to 3cm{\hbox{Reviewers:}\hss}\parbox[t]{8cm}{%
		\vrule width 5cm height 0pt depth 0.5pt\\[.5cm]
		\vrule width 5cm height 0pt depth 0.5pt\\[.5cm]
		\vrule width 5cm height 0pt depth 0.5pt
	}
	\bigskip\bigskip
	
	\noindent The dissertation thesis statement was distributed on ................ 
	\bigskip
	
	\noindent The defence of the dissertation thesis will be held before the Committee for the presentation and defence of the dissertation thesis in the doctoral degree study program \PhDBranch
	\ifx\PhDSpecialization\undefined\relax\else{in the \PhDSpecialization{} specialization}\fi\\ 
	on ............................ at .......................... in the meeting room No. ............... .
	\bigskip
	
	\noindent Those interested may get acquainted with the doctoral thesis concerned at the Dean Office of the Faculty of Electrical Engineering of the CTU in Prague, at the Department for Science and Research, Technick{\' a}~2, Praha~6.
	
	\vfill
	\begin{center}
		\bigskip
		\bigskip
		............................................................................\\
		\medskip
		Chairman of the Board for the Defence of the Doctoral Thesis in the branch \\ of study \PhDBranch
		\\
		\Department\\
		\Faculty\\
		\University\\
		\Address
	\end{center}}
	\newpage	
}


\def\@literaturetitle{%
	
	\begin{center}%		
		{\Large\sffamily
			\University\\
			\Faculty\\
			\Department\\
			\vglue 30mm
			\includegraphics[width=50mm]{images/LogoCVUT}
			\vglue 20mm
			{\Large\bfseries LIST OF PERSONAL PUBLICATIONS}
			\vglue 30mm
			\textit{\@author}
			\vglue 10mm
			\@placeyear
			\vfill
			{\footnotesize All the provided information are based on VVVS listed on\currenttime~\today}
		}
	\end{center}%
	\thispagestyle{empty}
	
	% Strana 2
	\newpage
	\pagenumbering{arabic}
}

% Biblatex rutina pro pohodlne vkladani celych citaci do sekce Autorova citace
\RequirePackage[style=ieee,backend=bibtex]{biblatex}
\DeclareBibliographyCategory{fullcited}
\newcommand{\bibentry}[1]{\fullcite{#1}\addtocategory{fullcited}{#1}}

%% Par zakladnich veci 
% Pro pridavani polozek do TOC
\RequirePackage[nottoc]{tocbibind}

% Hrani si s radkovanim
\RequirePackage{setspace}

% Odkazy na reference, udelano tak, aby odkazy vypadaly jako bezny text, jen je mozne na ne kliknout
\RequirePackage{xcolor}
\RequirePackage[pdftex]{hyperref}
\hypersetup{
	colorlinks   = true,
	citecolor    = black,
	linkcolor	 = black,
	urlcolor	 = black,
}

% Zapsani metadat do PDF souboru
\makeatletter
\AtBeginDocument{
	\hypersetup{
		pdftitle = {\@title},
		pdfauthor = {\@author},
		pdfsubject = {Dissertation thesis},
	}
}
\makeatother
