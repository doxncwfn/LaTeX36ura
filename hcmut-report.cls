\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{hcmut-report}[20/11/24 v1.0 HCMUT Report Class]

\DeclareOption*{\PassOptionsToClass{\CurrentOption}{article}} % Move all options to 'article' class
\ProcessOptions\relax
\LoadClass[12pt,a4paper]{article}

\RequirePackage[utf8]{vntex,inputenc}
\RequirePackage[T5]{fontenc}
\RequirePackage{anyfontsize,amsmath,amssymb}
\RequirePackage{geometry,tikz,graphicx,indentfirst,setspace}
\RequirePackage{booktabs}
\RequirePackage[center]{caption}
\RequirePackage{fancyhdr,hyperref}
\RequirePackage[super,square,sort]{natbib}
\RequirePackage{makecell}
\RequirePackage{lastpage}

\RequirePackage[vietnamese]{babel}

% Return current date
\newcommand{\Month}{
  \ifcase \the\month
  \or tháng một
  \or tháng hai
  \or tháng ba
  \or tháng bốn
  \or tháng năm
  \or tháng sáu
  \or tháng bảy
  \or tháng tám
  \or tháng chín
  \or tháng mười
  \or tháng mười một
  \or tháng mười hai
  \fi % End of \ifcase
}
\newcommand{\DateToday}{
  \the\day\ \Month
}

% Custom commands
\newcommand{\@uniname}{Trường Đời 36}
\newcommand{\@deptname}{Nợ Con Mãi Đỉnh}
\newcommand{\deptname}[1]{\renewcommand{\@deptname}{#1}}
\newcommand{\@coursename}{Course name}
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}
\newcommand{\@reporttype}{Assignment Report}
\newcommand{\reporttype}[1]{\renewcommand{\@reporttype}{#1}}
\renewcommand{\@title}{Report title}
\newcommand{\advisor}[1]{\renewcommand{\@advisor}{#1}}
\newcommand{\@stuname}{STUDENT:\ H (xxxxxxx)}
\newcommand{\stuname}[1]{\renewcommand{\@stuname}{#1}}
\newcommand{\@reportplace}{Thành phố Hồ Chí Minh}
\newcommand{\reportplace}[1]{\renewcommand{\@reportplace}{#1}}
\newcommand{\@reporttime}{\the\day \Month \the\year}
\newcommand{\reporttime}[1]{\renewcommand{\@reporttime}{#1}}

% Configurations
\geometry{
  paper=a4paper,
  left=1.5cm,
  right=1.5cm,
  top=1.5cm,
  bottom=1.5cm,
  includeheadfoot=true,
  headheight=35pt
}
\onehalfspacing
\raggedbottom

% Table spacing settings
\renewcommand{\arraystretch}{1.2}
\renewcommand{\headrulewidth}{0.3pt}
\renewcommand{\footrulewidth}{0.3pt}

\setcounter{secnumdepth}{5}
\setcounter{tocdepth}{5}

\AtBeginDocument{\counterwithin{equation}{section}}
\AtBeginDocument{\counterwithin{table}{section}}
\AtBeginDocument{\counterwithin{figure}{section}}

\AtBeginDocument{\renewcommand*\bibname{References}}

\hypersetup{
  colorlinks=true,
  linkcolor=black,
  citecolor=red,
  urlcolor=blue
}

%Make cover page
\newcommand{\coverpage}{
  \begin{tikzpicture}[remember picture,overlay,inner sep=0,outer sep=0]
    \draw[blue!70!black,line width=4pt]
    ([xshift=-1.5cm,yshift=-2cm]current page.north east) coordinate (A)--
    ([xshift=1.5cm,yshift=-2cm]current page.north west) coordinate(B)--
    ([xshift=1.5cm,yshift=2cm]current page.south west) coordinate (C)--
    ([xshift=-1.5cm,yshift=2cm]current page.south east) coordinate(D)--cycle;

    \draw
    ([yshift=0.5cm,xshift=-0.5cm]A)--
    ([yshift=0.5cm,xshift=0.5cm]B)--
    ([yshift=-0.5cm,xshift=0.5cm]B) --
    ([yshift=-0.5cm,xshift=-0.5cm]B)--
    ([yshift=0.5cm,xshift=-0.5cm]C)--
    ([yshift=0.5cm,xshift=0.5cm]C)--
    ([yshift=-0.5cm,xshift=0.5cm]C)--
    ([yshift=-0.5cm,xshift=-0.5cm]D)--
    ([yshift=0.5cm,xshift=-0.5cm]D)--
    ([yshift=0.5cm,xshift=0.5cm]D)--
    ([yshift=-0.5cm,xshift=0.5cm]A)--
    ([yshift=-0.5cm,xshift=-0.5cm]A)--
    ([yshift=0.5cm,xshift=-0.5cm]A);

    \draw
    ([yshift=-0.3cm,xshift=0.3cm]A)--
    ([yshift=-0.3cm,xshift=-0.3cm]B)--
    ([yshift=0.3cm,xshift=-0.3cm]B) --
    ([yshift=0.3cm,xshift=0.3cm]B)--
    ([yshift=-0.3cm,xshift=0.3cm]C)--
    ([yshift=-0.3cm,xshift=-0.3cm]C)--
    ([yshift=0.3cm,xshift=-0.3cm]C)--
    ([yshift=0.3cm,xshift=0.3cm]D)--
    ([yshift=-0.3cm,xshift=0.3cm]D)--
    ([yshift=-0.3cm,xshift=-0.3cm]D)--
    ([yshift=0.3cm,xshift=-0.3cm]A)--
    ([yshift=0.3cm,xshift=0.3cm]A)--
    ([yshift=-0.3cm,xshift=0.3cm]A);
  \end{tikzpicture}

  \pagestyle{empty}
  \vspace*{-3\baselineskip}

  \begin{center}
    \MakeUppercase{\@uniname}

    \MakeUppercase{\@deptname}
    \vfill
    \includegraphics[scale=0.3]{images/hcmus-logo.png}
    \vfill
    \bfseries
    \begin{tabular}{c}
      \Large\@coursename                                 \\
      {}                                                 \\
      \midrule                                           \\
      \Large\@reporttype                                 \\
      {}                                                 \\
      \Huge\parbox[c]{0.8\linewidth}{\centering \@title} \\
      {}                                                 \\
      \midrule
    \end{tabular}
    \vfill
    \mdseries
    \begin{tabular}{rll}
      Nợ phó: \@stuname \\
    \end{tabular}
    \vfill

    \MakeUppercase{\@reportplace, \@reporttime}
  \end{center}

  \clearpage
  \pagestyle{fancy}
}

% Header and footer
\pagestyle{fancy}
\fancyhf{}

\if@twoside
  \fancyhead[EL]{
    \bfseries
    \begin{tabular}{rl}
      \begin{picture}(25pt,15pt)
        \put(0,-8pt){\includegraphics[width=35pt]{images/hcmut-logo.png}}
      \end{picture}
      \begin{tabular}{l}
        \ttfamily\@uniname  \\
        \ttfamily\@deptname \\
      \end{tabular}
    \end{tabular}
  }
  \fancyhead[OR]{
    \bfseries
    \begin{tabular}{rl}
      \begin{tabular}{r}
        \ttfamily\@uniname  \\
        \ttfamily\@deptname \\
      \end{tabular}
      \begin{picture}(25pt,15pt)
        \put(0,-8pt){\includegraphics[width=35pt]{images/hcmut-logo.png}}
      \end{picture}
    \end{tabular}
  }
\else
  \fancyhead[R]{
    \bfseries
    \begin{tabular}{rl}
      \begin{tabular}{r}
        \ttfamily\@uniname  \\
        \ttfamily\@deptname \\
      \end{tabular}
      \begin{picture}(25pt,15pt)
        \put(0,-8pt){\includegraphics[width=35pt]{hcmut-logo.png}}
      \end{picture}
    \end{tabular}
  }
\fi

% \fancyfoot[C]{\thepage}
