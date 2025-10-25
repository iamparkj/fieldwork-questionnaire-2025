%%
%% This is file `snu-fl-questionnaire.cls'.
%%
%% -----------------------------------------------------------------
%% The snu-fl-questionnaire class --- A class for SNU Field Lingusitics questionnaires
%% Maintained by Junyoung Park
%% E-mail: bloomwayz@snu.ac.kr
%% Released under the MIT License.
%% -----------------------------------------------------------------
%%
\NeedsTeXFormat{LaTeX2e}[2022-06-01]
\RequirePackage{expl3}
\ProvidesExplClass
  {snu-fl-questionnaire}
  {2025/10/22}
  {0.1}
  {A class for SNU Field Lingusitics questionnaires}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Load class %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\DeclareOption*{\PassOptionsToClass{\CurrentOption}{memoir}}
\ProcessOptions*
\LoadClass[b5paper,10pt,left,openany]{memoir}

\DoubleSpacing
\setlength{\parindent}{10pt}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Base packages %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{kotex}
\RequirePackage{pmhanguljamo}

\RequirePackage{xcolor}
\RequirePackage{graphicx}

\RequirePackage{tabularray}
\UseTblrLibrary{booktabs}

\RequirePackage{enumitem}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Font setup %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{microtype}

% Works for pdfLaTeX, XeLaTeX, and LuaLaTeX
\RequirePackage{libertine}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%% Page layout configuration %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\setlrmarginsandblock{2cm}{2cm}{*}
\setulmarginsandblock{2cm}{2cm}{*}
\setheadfoot{0.5cm}{0.5cm}
\checkandfixthelayout

\hbadness=99999

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%% Chapter style configuration %%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\makechapterstyle{customchap}{
  % Numbering style
  \renewcommand{\thechapter}{\Roman{chapter}}
  \renewcommand{\chapterheadstart}{
    \ifnum\value{chapter}=2
      \renewcommand{\thesection}{\arabic{section}.}
    \else
      \renewcommand{\thesection}{\Alph{section}.}
    \fi
  }

  % Section/subsection font
  \setsecheadstyle{\fontsize{12pt}{14pt}\selectfont\sffamily\bfseries\raggedright}
  \setsubsecheadstyle{\fontsize{10pt}{11pt}\selectfont\sffamily\bfseries\raggedright}

  \renewcommand{\printchaptername}{}
  \renewcommand{\afterchapternum}{.\space}
  \renewcommand{\chapnumfont}{\centering\fontsize{16pt}{19pt}\selectfont\sffamily\bfseries}
  \renewcommand{\chaptitlefont}{\centering\fontsize{16pt}{19pt}\selectfont\sffamily\bfseries}

  \setlength{\beforechapskip}{0pt}
  \setlength{\afterchapskip}{40pt}
}
\chapterstyle{customchap}

\setsecnumdepth{section}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%% Pagination / ToC configuration %%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\contentsname}{목차}
\renewcommand*\cftappendixname{부록~}
\settocdepth{chapter}

\copypagestyle{customruled}{plain}
\makeevenfoot{customruled}{\footnotesize{\thepage{}~|~서울대학교~언어학과}}{}{}
\makeoddfoot{customruled}{}{}{\footnotesize{한국~언어조사~질문지~|~\thepage}}
\pagestyle{customruled}

\aliaspagestyle{chapter}{customruled}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Watermark configuration %%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[
  firstpageonly,
  angle=0,
  scale=0.75,
  text={\includegraphics{img/snu-ui-trans.png}}
]{draftwatermark}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%% Document metadata fields %%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Additional Fields
\NewDocumentCommand \printdate { m }
  { \newcommand*\@printdate{#1} }

\NewDocumentCommand \issuedate { m }
  { \newcommand*\@issuedate{#1} }

\NewDocumentCommand \tel { m }
  { \newcommand*\@tel{#1} }

% Front title
\renewcommand{\maketitle}{
  \thispagestyle{empty}
  \begin{center}
    \vspace*{1cm}
    \rule{300pt}{3pt}
    \par\vspace{-0.8\baselineskip}
    \fontsize{28pt}{30pt}\selectfont\sffamily\bfseries
    \@title
    \par\vspace{-0.6\baselineskip}
    \rule{300pt}{3pt}
    \vfill
    \fontsize{20pt}{22pt}\selectfont\sffamily\bfseries
    \@author \\
    \fontsize{18pt}{20pt}\selectfont\sffamily\mdseries
    \@date \\
    \vspace*{2cm} 
  \end{center}
  \newpage
}

% Back cover
\newcommand{\makebackcover}{
  \thispagestyle{empty}
  \selectfont\sffamily
  \null\vfill
  \begin{center}
    \setlength{\fboxrule}{0.4pt} 
    \setlength{\fboxsep}{20pt} 
    \fbox{
      \begin{tabular}{c}
        \strut \fontsize{15pt}{17pt}\selectfont\bfseries\@title \strut \\[2.5ex]
        \strut \fontsize{10pt}{11pt}\selectfont\mdseries\@printdate{}~인쇄 \strut \\
        \strut \fontsize{10pt}{11pt}\selectfont\mdseries\@printdate{}~발행 \strut \\[2.5ex]
        \strut 엮은이:~\@author \strut \\
        \strut 전화:~\@tel \strut
      \end{tabular}
    }
    \vfill
  \end{center}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Consultants' table %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NewDocumentCommand{\ConsTop}{}{
  \begin{tblr}{
    rows = {abovesep=0pt,belowsep=1pt},
    width = \textwidth,
    colspec = {|X[l,m]|X[l,m]|},
    hlines,
    vlines
  }
  \SetCell[c=2]{l}{조사자~이름} \\
  조사자~소속 & 음성~전사자(진행자) \\
  녹음~담당자 & 체크리스트~담당자 \\
  \SetCell[c=2]{l}{조사지~주소} \\
  녹음~방식 \textsuperscript{1)} & 녹음~파일 \textsuperscript{2)} \\
  \end{tblr}
}

\NewDocumentCommand{\ConsMid}{}{
  \begin{tblr}{
    rows = {abovesep=0pt,belowsep=1pt},
    width = \textwidth,
    colspec = {|X[l,m]|X[l,m]|},
    vlines
  }
  
  \hline
    \SetCell[c=2]{l}{자료제공인~성명} & 1-2 \\
  \hline
    \SetCell[c=2]{l}{
      자료제공인~거주지
      \hspace*{5.8cm}
      (~농촌~/~어촌~/~산간촌~/~광산촌~/~도시~)
    } & 2-2 \\
    \SetCell[c=2]{l}{} & 3-2 \\
  \hline
    \SetCell[c=2]{l}{자료제공인~출생지} \textsuperscript{3)} & 4-2 \\
  \hline
    자료제공인~연령 & 자료제공인~성별 \\
  \hline
    자료제공인~직업 & 자료제공인~학력 \\
  \hline
    자료제공인~경력 & 자료제공인~병역 \textsuperscript{4)} \\
    & \\
  \hline
    \SetCell[c=2]{l}{자료제공인~가족사항~및~선대~거주지} \textsuperscript{5)} & 10-2 \\
    \SetCell[c=2]{l}{} & 11-2 \\
  \hline
    \SetCell[c=2]{l}{자료제공인~타지~거주~경험} & 12-2 \\
    \SetCell[c=2]{l}{} & 13-2 \\
  \hline
    \SetCell[c=2]{l}{
      자료제공인~가정~문화시설~유무:~TV(\qquad),~라디오(\qquad),~인터넷(\qquad),~기타(\qquad)
    } & 14-2 \\
  \hline
  \end{tblr}
}

\NewDocumentCommand{\ConsBot}{}{
  \begin{tblr}{
    rows = {abovesep=0pt,belowsep=1pt},
    width = \textwidth,
    colspec = {|X[l,m]|X[l,m]|},
    vlines
  }
  
  \hline
    협조자~성명 & 협조자~연령 \\
  \hline
    협조자~직업 & 협조자~학력 \\
  \hline
    \SetCell[c=2]{l}{
      조사지역~개관(역사,~교육권,~동혼권,~경제권,~교통권~등)
    } & \\
    \SetCell[c=2]{l}{} & \\
  \hline
    \SetCell[c=2]{l}{비고} & \\
    \SetCell[c=2]{l}{} & \\
  \hline
  \end{tblr}
}

\NewDocumentCommand{\Consultant}{}{
  \small
  \ConsTop \\
  \ConsMid \\
  \ConsBot \\ \\

  \begin{OnehalfSpace}
    \footnotesize
    1)~어떤~장비로~어떻게~녹음했는지~기재 \hspace{2.6cm}
    2)~녹음~파일의~이름~및~번호~기재 \\
    3)~출생지와~현재~거주지가~같은데/다른데,~혹시~다른~지역에서~생활하신~적은~없으신가요/있으신가요? \\
    4)~군대는~다녀오셨나요?~언제~가셨나요?~어느~지역에서~하셨나요?~(언어~배경~파악~목적) \\
    5)~가족분들~소개해주실~수~있나요?~(+~가족분들~각각~어느~지역~화자인지~여쭤보기)
  \end{OnehalfSpace}
}


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Lexicon entries %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{siunitx}
\sisetup{
  mode = text,
  reset-text-family = false,
  reset-text-series = false
}

\newcounter{lexcount}[section]
\renewcommand{\thelexcount}{
  \Alph{section}
  {\sffamily\bfseries \num[minimum-integer-digits = 2]{\arabic{lexcount}}}
}

\clist_new:N \g_q_feat_clist

\bool_new:N \g_q_ms
\bool_new:N \g_q_sp
\bool_new:N \g_q_dp

\keys_define:nn { entry }
  {
    word .tl_set:N = \l_q_word,
    pred .tl_set:N = \l_q_pred,
    feat .code:n =
      {
        \clist_set:Nn \g_q_feat_clist { #1 }

        \clist_if_in:NnTF \g_q_feat_clist { ms }
          { \bool_set_true:N \g_q_ms }
          { \bool_set_false:N \g_q_ms }

        \clist_if_in:NnTF \g_q_feat_clist { sp }
          { \bool_set_true:N \g_q_sp }
          { \bool_set_false:N \g_q_sp }
          
        \clist_if_in:NnTF \g_q_feat_clist { dp }
          { \bool_set_true:N \g_q_dp }
          { \bool_set_false:N \g_q_dp }
      },
    imag .tl_set:N = \l_q_imag,
    desc .tl_set:N = \l_q_desc,
    qstn .tl_set:N = \l_q_qstn,
    advq .tl_set:N = \l_q_advq,
  }

\newcommand{\entrykey}{
  \selectfont\sffamily\bfseries
}

\NewDocumentCommand { \ColoredFeat } { m m }
  {
    \bool_if:NTF #1
      {
        \entrykey\color{black} #2
      }
      {
        \entrykey\color{lightgray} #2
      }
  }

\seq_new:N \g_image_refs
\seq_new:N \g_image_last_indices
\tl_new:N \g_section_last
\tl_set:Nn \g_section_last { 0 }
  
\NewDocumentCommand { \Entry } { m }
  {
    \stepcounter{lexcount}

    \group_begin: % keep the assignment to the keys local
    \keys_set:nn { entry } { #1 }
    \tl_if_empty:VF \l_q_imag
      {
        \int_compare:nNnF { \g_section_last } = { \int_use:N \c@section }
          {
            \seq_if_empty:NF \g_image_refs
              {
                \seq_gput_right:Ne \g_image_last_indices { \seq_count:N \g_image_refs }
              }
          }
        \tl_gset:Ne \g_section_last { \int_use:N \c@section }
        \seq_gput_right:Ne \g_image_refs
          {
            { \int_use:N \c@section }
            { \int_use:N \c@lexcount }
            { \l_q_imag }
          }
      }

    \OnehalfSpacing

    \par\noindent
    \begin{tblr}{
      width = \linewidth,
      colspec = {|Q[c,m,1.2cm]|X[c,m]|X[c,m]|X[c,m]|Q[c,m,1.2cm]|X[5,c,m]|},
      hlines,
      vlines
    }
    \entrykey{\thelexcount}
      & \SetCell[c=3]{c}{\l_q_word} & 1-3 & 1-4 
      & \entrykey{예상형태} & \l_q_pred \\
    \entrykey{유의점}
      & \ColoredFeat{\g_q_ms}{[MS]}
      & \ColoredFeat{\g_q_sp}{[SP]}
      & \ColoredFeat{\g_q_dp}{[DP]}
      & \entrykey{설명}
      & \SetCell{j}{\l_q_desc} \\
    \end{tblr} \\

    \vspace{-0.15\baselineskip}

    \par\noindent
    \begin{tblr}{
      width = \linewidth,
      colspec = {|Q[c,m,1.2cm]|X[j,m]|},
      vlines,
      row{3} = {2cm}
    }
      \entrykey{유도질문} & \l_q_qstn \\
    \hline
      \entrykey{심화질문} & \l_q_advq \\
    \hline
      \entrykey{방언형} & \\
    \hline
    \end{tblr}

    \vfill

    \group_end:
  }

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Image References %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\NewDocumentCommand { \SemMap } { m }
  {
    \begin{center}
      \includegraphics [
        height = \textwidth,
        width = \dimexpr\pagegoal - \pagetotal - \baselineskip\relax,
        keepaspectratio,
        angle = 90
      ] { #1 }
    \end{center}
    \clearpage
  }

\usepackage{array}
\usepackage{multirow}
\usepackage{makecell}
\usepackage{longtable}

\newcommand{\imageref}[3]{
  \makecell{
    \textbf{
      \symbol{\numexpr64+#1}
      {\sffamily\bfseries \num[minimum-integer-digits = 2]{#2}}
    }\\
    \setlength{\fboxrule}{0pt}
    \fbox{
      \begin{minipage}[c][5cm][c]{6cm}
        \centering
        \includegraphics[width=6cm, height=5cm, keepaspectratio]{#3}
      \end{minipage}
    }
  }
}

\NewDocumentCommand { \ImagRefs } { }
  {
    \tl_clear:N \g_tmpa_tl
    \int_set:Nn \g_tmpa_int { 0 }
    \seq_map_indexed_inline:Nn \g_image_refs
      {
        \int_incr:N \g_tmpa_int
        \int_compare:nNnT { \int_use:N \g_tmpa_int } = { 1 }
          {
            \tl_put_right:Nn \g_tmpa_tl { \hline }
          }
        \seq_if_in:NnTF \g_image_last_indices { ##1 }
          {
            \int_if_odd:nTF { \int_use:N \g_tmpa_int }
              {
                \tl_put_right:Nn \g_tmpa_tl { \multicolumn { 2 } { |c| } { \imageref ##2 } }
              }
              {
                \tl_put_right:Nn \g_tmpa_tl { \imageref ##2 }
              }
            \tl_put_right:Nn \g_tmpa_tl { \\ \hline \pagebreak }
            \int_set:Nn \g_tmpa_int { 0 }
          }
          {
            \int_compare:nNnTF { ##1 } = { \seq_count:N \g_image_refs }
              {
                \int_if_odd:nTF { \int_use:N \g_tmpa_int }
                  {
                    \tl_put_right:Nn \g_tmpa_tl { \multicolumn { 2 } { |c| } { \imageref ##2 } }
                  }
                  {
                    \tl_put_right:Nn \g_tmpa_tl { \imageref ##2 }
                  }
                \tl_put_right:Nn \g_tmpa_tl { \\ \hline }
              }
              {
                \tl_put_right:Nn \g_tmpa_tl { \imageref ##2 }
            
                \int_if_odd:nTF { \int_use:N \g_tmpa_int }
                  { \tl_put_right:Nn \g_tmpa_tl { & } }
                  { \tl_put_right:Nn \g_tmpa_tl { \\ \hline } }
              }
          }
      }
    \begin{longtable}{|>{\centering\arraybackslash}m{0.5\textwidth}|>{\centering\arraybackslash}m{0.5\textwidth}|}
      \g_tmpa_tl
    \end{longtable}
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Macros %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Korean-English, e.g., \alt{형태의미론}{Morpho-Semantics}
% \alt*을 통해 찾아보기에 추가, \alt는 단순히 한영 병기
% <>안에는 참조할 다른 개념 제시

\NewDocumentCommand { \myindex } { s m m }
  {
    \IfBooleanTF {#1}
      { \index{#2!#3|textbf}\index{#3!#2|textbf} }
      { \index{#2!#3}\index{#3!#2} }
  }

\NewDocumentCommand { \alt } { s m O{#2} d<> m O{#5} d<> }
  {
    #2\,{\color{gray!50!darkgray}\smaller\textit{#5}}\hspace{.06667em}
    \IfBooleanT {#1}
      {
        \myindex{#3}{#6}

        \IfNoValueTF {#4}
          {
            \IfNoValueF {#7}
              { % See English
                \index{#6|see{#7}}
              }
          }
          {
             \IfNoValueTF {#7}
              { % See Korean
                \index{#3|see{#4}}
              }
              { % See both
                \index{#3|see{#4}}\index{#6|see{#7}}
              }
          }
      }
  }


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Hyperref %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\usepackage[pdfusetitle]{hyperref}
\RequirePackage[noabbrev, nameinlink]{cleveref}
