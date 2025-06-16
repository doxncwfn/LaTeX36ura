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
\newcommand{\@upperuniname}{Đại học quốc gia Thành phố Hồ Chí Minh}
\newcommand{\@uniname}{Trường đại học Bách Khoa}
\newcommand{\@deptname}{Khoa Khoa học \& Kỹ thuật máy tính}
\newcommand{\deptname}[1]{\renewcommand{\@deptname}{#1}}
\newcommand{\@coursename}{Course name}
\newcommand{\coursename}[1]{\renewcommand{\@coursename}{#1}}
\newcommand{\@reporttype}{Assignment Report}
\newcommand{\reporttype}[1]{\renewcommand{\@reporttype}{#1}}
\renewcommand{\@title}{Report title}
\newcommand{\@advisor}{Advisor}
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
  left=2.5cm,
  right=2.5cm,
  top=2cm,
  bottom=2cm,
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
    \MakeUppercase{\@upperuniname}

    \MakeUppercase{\@uniname}

    \MakeUppercase{\@deptname}
    \vfill
    \includegraphics[scale=0.45]{images/hcmut-logo.png}
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
      Giảng viên hướng dẫn: \@advisor \\
      Chủ nhiệm đề tài: \@stuname     \\
    \end{tabular}
    \vfill

    \MakeUppercase{\@reportplace, \@reporttime}
  \end{center}

  \clearpage
  \pagestyle{fancy}

  % \begin{center}
  %   \Large\textbf{BẢNG PHÂN CÔNG CÔNG VIỆC}
  %   \begin{table}[H]
  %     \centering
  %     \begin{tabular}{|c|l|c|c|c|}
  %       \hline
  %       \textbf{STT} & \textbf{Họ và tên}     & \textbf{MSSV} & \textbf{Phân công}              & \textbf{Tiến độ} \\
  %       \hline
  %       1            & Doãn Phương Hùng Cường & 2310381       & Hậu kiểm, tổng hợp kết quả      & 100\%            \\
  %       \hline
  %       2            & Nguyễn Phan Tuấn Duy   & 2310491       & Xây dựng model dựa trên dữ liệu & 100\%            \\
  %       \hline
  %       3            & Lê Đình Đức            & 2310774       & Xây dựng model dựa trên dữ liệu & 100\%            \\
  %       \hline
  %       4            & Phạm Đình Được         & 2310761       & Huấn luyện model                & 100\%            \\
  %       \hline
  %       5            & Bành Phú Hội           & 2311111       & Xây dựng model dựa trên dữ liệu & 100\%            \\
  %       \hline
  %       6            & Lê Văn Đình Huy        & 2311160       & Huấn luyện model                & 100\%            \\
  %       \hline
  %       7            & Nguyễn Thành Minh Khôi & 2311687       & Huấn luyện model                & 100\%            \\
  %       \hline
  %       8            & Hà Cao Đức Minh        & 2312059       & Xây dựng model dựa trên dữ liệu & 100\%            \\
  %       \hline
  %       9            & Phạm Đình Phương Nam   & 2312186       & Tiền xử lý và phân tích dữ liệu & 100\%            \\
  %       \hline
  %       10           & Ôn Hà Ngọc Như         & 2312538       & \makecell{- Tối ưu giải thuật                      \\ - Kiểm tra tính chính xác} & 100\%            \\
  %       \hline
  %       11           & Mạch Văn Phú           & 2333448       & \makecell{- Tối ưu giải thuật                      \\ - Kiểm tra tính chính xác} & 100\%            \\
  %       \hline
  %       12           & Đỗ Hồng Phúc           & 2312672       & Xây dựng model dựa trên dữ liệu & 100\%            \\
  %       \hline
  %       13           & Vũ Lê Hà Phương        & 2312765       & Tiền xử lý và phân tích dữ liệu & 100\%            \\
  %       \hline
  %       14           & Nguyễn Trần Phương     & 2333447       & \makecell{- Tối ưu giải thuật                      \\ - Kiểm tra tính chính xác} & 100\%            \\
  %       \hline
  %       15           & Nguyễn Hoàng Quân      & 2312834       & \makecell{- Tối ưu giải thuật                      \\ - Kiểm tra tính chính xác} & 100\%            \\
  %       \hline
  %       16           & Hồng Phi Trường        & 2313703       & Tiền xử lý và phân tích dữ liệu & 100\%            \\
  %       \hline
  %       17           & Nguyễn Danh Vương      & 2333478       & \makecell{- Tối ưu giải thuật                      \\ - Kiểm tra tính chính xác} & 100\%            \\
  %       \hline
  %     \end{tabular}
  %     \label{tab:student_task_allocation}
  %   \end{table}
  % \end{center}
}

% Header and footer
\pagestyle{fancy}
\fancyhf{}

\if@twoside
  \fancyhead[EL]{
    \bfseries
    \begin{tabular}{rl}
      \begin{picture}(25pt,15pt)
        \put(0,-8pt){\includegraphics[width=20pt]{images/hcmut-logo.png}}
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
        \put(0,-8pt){\includegraphics[width=20pt]{images/hcmut-logo.png}}
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
        \put(0,-8pt){\includegraphics[width=20pt]{hcmut-logo.png}}
      \end{picture}
    \end{tabular}
  }
\fi

% \fancyfoot[C]{\thepage}
