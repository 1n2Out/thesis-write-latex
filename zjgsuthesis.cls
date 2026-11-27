%%
%% This is file `zjgsuthesis.cls',
%% original from 'thutheis.cls' by Tsinghua University TUNA Association <tuna@tsinghua.edu.cn>.
%%
%% The original project can be found at https://github.com/tuna/thuthesis
%% 
%% The current version was modified by fb37 in Sep. 2024.
%% 
%% For easier understanding, all the "thu"s are changed to "zjgsu"s.
%% 
\NeedsTeXFormat{LaTeX2e}[2017/04/15]
\ProvidesClass{zjgsuthesis}
[2024/07/01 7.5.2 Thesis Template for School of Computer Science, Zhejiang Gongshang University]
\newcommand\zjgsu@error[1]{%
  \ClassError{zjgsuthesis}{#1}{}%
}
\newcommand\zjgsu@warning[1]{%
  \ClassWarning{zjgsuthesis}{#1}%
}
\newcommand\zjgsu@debug[1]{%
  \typeout{Package zjgsuthesis Info: #1}%
}
\newcommand\zjgsu@patch@error[1]{%
  \zjgsu@error{Failed to patch command \protect#1}%
}
\newcommand\zjgsu@deprecate[2]{%
  \def\zjgsu@@tmp{#2}%
  \zjgsu@warning{%
    The #1 is deprecated%
    \ifx\zjgsu@@tmp\@empty\else
      . Use #2 instead%
    \fi
  }%
}
\@ifl@t@r\fmtversion{2017/04/15}{}{
  \zjgsu@error{%
    TeX Live 2017 or later version is required to compile this document%
  }
}
\RequirePackage{iftex}
\ifXeTeX\else
  \ifLuaTeX\else
    \zjgsu@error{XeLaTeX or LuaLaTeX is required to compile this document}
  \fi
\fi
\InputIfFileExists{zjgsuthesis-pdf-test-config.tex}{}{
  \InputIfFileExists{zjgsuthesis-log-test-config.tex}{}{}
}
\hyphenation{Zjgsu-Thesis}
\def\zjgsuthesis{ZjgsuThesis}
\def\version{7.5.2}
\RequirePackage{kvdefinekeys}
\RequirePackage{kvsetkeys}
\RequirePackage{kvoptions}
\SetupKeyvalOptions{
  family=zjgsu,
  prefix=zjgsu@,
  setkeys=\kvsetkeys}
\let\zjgsu@setup@hook\@empty
\newcommand\zjgsusetup[1]{%
  \let\zjgsu@setup@hook\@empty
  \kvsetkeys{zjgsu}{#1}%
  \zjgsu@setup@hook
}
\newcommand\zjgsu@define@key[1]{%
  \kvsetkeys{zjgsu@key}{#1}%
}
\kv@set@family@handler{zjgsu@key}{%
  \@namedef{zjgsu@#1@@name}{#1}%
  \def\zjgsu@@default{}%
  \def\zjgsu@@choices{}%
  \kv@define@key{zjgsu@value}{name}{%
    \@namedef{zjgsu@#1@@name}{##1}%
  }%
  \@namedef{zjgsu@#1@@check}{}%
  \@namedef{zjgsu@#1@@code}{}%
  \kv@define@key{zjgsu@value}{choices}{%
    \def\zjgsu@@choices{##1}%
    \@namedef{zjgsu@#1@@reset}{}%
    \@namedef{zjgsu@#1@@check}{%
      \@ifundefined{%
        ifzjgsu@\@nameuse{zjgsu@#1@@name}@\@nameuse{zjgsu@\@nameuse{zjgsu@#1@@name}}%
      }{%
        \zjgsu@error{Invalid value "#1 = \@nameuse{zjgsu@\@nameuse{zjgsu@#1@@name}}"}%
      }%
      \@nameuse{zjgsu@#1@@reset}%
      \@nameuse{zjgsu@\@nameuse{zjgsu@#1@@name}@\@nameuse{zjgsu@\@nameuse{zjgsu@#1@@name}}true}%
    }%
  }%
  \kv@define@key{zjgsu@value}{default}{%
    \def\zjgsu@@default{##1}%
  }%
  \kvsetkeys{zjgsu@value}{#2}%
  \@namedef{zjgsu@\@nameuse{zjgsu@#1@@name}}{}%
  \kv@set@family@handler{zjgsu@choice}{%
    \ifx\zjgsu@@default\@empty
      \def\zjgsu@@default{##1}%
    \fi
    \expandafter\newif\csname ifzjgsu@\@nameuse{zjgsu@#1@@name}@##1\endcsname
    \expandafter\g@addto@macro\csname zjgsu@#1@@reset\endcsname{%
      \@nameuse{zjgsu@\@nameuse{zjgsu@#1@@name}@##1false}%
    }%
  }%
  \kvsetkeys@expandafter{zjgsu@choice}{\zjgsu@@choices}%
  \expandafter\let\csname zjgsu@\@nameuse{zjgsu@#1@@name}\endcsname\zjgsu@@default
  \expandafter\ifx\csname zjgsu@\@nameuse{zjgsu@#1@@name}\endcsname\@empty\else
    \@nameuse{zjgsu@#1@@check}%
  \fi
  \kv@define@key{zjgsu}{#1}{%
    \@namedef{zjgsu@\@nameuse{zjgsu@#1@@name}}{##1}%
    \@nameuse{zjgsu@#1@@check}%
    \@nameuse{zjgsu@#1@@code}%
  }%
}
\newcommand\zjgsu@option@hook[2]{%
  \expandafter\g@addto@macro\csname zjgsu@#1@@code\endcsname{#2}%
}
\zjgsu@define@key{
  thesis-type = {
    name = thesis@type,
    choices = {
      thesis,
      proposal,
    },
    default = thesis,
  },
  degree = {
    choices = {
      bachelor,
      master,
      doctor,
      postdoc,
    },
    default = master,
  },
  degree-type = {
    choices = {
      academic,
      professional,
    },
    name = degree@type,
  },
  main-language = {
    name = main@language,
    choices = {
      chinese,
      english,
    },
  },
  language = {
    choices = {
      chinese,
      english,
    },
  },
  system = {
    choices = {
      auto,
      mac,
      unix,
      windows,
    },
    default = auto,
  },
  fontset = {
    choices = {
      auto,
      windows,
      mac,
      ubuntu,
      fandol,
      none,
    },
    default = auto,
  },
  font = {
    choices = {
      auto,
      times,
      termes,
      stix,
      xits,
      libertinus,
      newcm,
      lm,
      newtx,
      none,
    },
    default = auto,
  },
  cjk-font = {
    name = cjk@font,
    choices = {
      auto,
      windows,
      windows-local,
      mac,
      mac-word,
      noto,
      fandol,
      none,
    },
    default = auto,
  },
  windows-font-dir = {
    name = windows@font@dir,
    default = {.},
  },
  math-font = {
    name = math@font,
    choices = {
      auto,
      stix,
      xits,
      libertinus,
      newcm,
      lm,
      newtx,
      none,
    },
    default = auto,
  },
  math-style = {
    name = math@style,
    choices = {
      GB,
      ISO,
      TeX,
    },
  },
  uppercase-greek = {
    name = uppercase@greek,
    choices = {
      italic,
      upright,
    },
  },
  less-than-or-equal = {
    name = leq,
    choices = {
      slanted,
      horizontal,
    },
  },
  integral = {
    choices = {
      upright,
      slanted,
    },
  },
  integral-limits = {
    name = integral@limits,
    choices = {
      true,
      false,
    },
  },
  partial = {
    choices = {
      upright,
      italic,
    },
  },
  math-ellipsis = {
    name = math@ellipsis,
    choices = {
      centered,
      lower,
      AMS,
    },
  },
  real-part = {
    name = real@part,
    choices = {
      roman,
      fraktur,
    },
  },
  output = {
    choices = {
      print,
      electronic,
    },
    default = print,
  },
  eqn-paren-style = {
    name = eqn@paren@style,
    choices = {
      full,
      half,
    }
  },
}
\newif\ifzjgsu@degree@graduate
\newcommand\zjgsu@set@graduate{%
  \zjgsu@degree@graduatefalse
  \ifzjgsu@degree@doctor
    \zjgsu@degree@graduatetrue
  \fi
  \ifzjgsu@degree@master
    \zjgsu@degree@graduatetrue
  \fi
}
\zjgsu@set@graduate
\zjgsu@option@hook{degree}{%
  \zjgsu@set@graduate
}
\DeclareBoolOption[false]{openright}
\DeclareComplementaryOption{openany}{openright}
\DeclareBoolOption[true]{raggedbottom}
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{ctexbook}}
\ProcessKeyvalOptions*
\ifzjgsu@openright
  \PassOptionsToClass{openright}{book}
\else
  \PassOptionsToClass{openany}{book}
\fi
\PassOptionsToPackage{no-math}{fontspec}
\LoadClass[a4paper,UTF8,zihao=-4,scheme=plain,fontset=none]{ctexbook}[2017/04/01]
\RequirePackage{etoolbox}
\RequirePackage{filehook}
\RequirePackage{xparse}
\RequirePackage{geometry}%
\RequirePackage{fancyhdr}
\RequirePackage{titletoc}
\RequirePackage{notoccite}
\RequirePackage{amsmath}
\RequirePackage{graphicx}
\RequirePackage[labelformat=simple]{subcaption}
\RequirePackage{pdfpages}
\includepdfset{fitpaper=true}
\AtEndPreamble{
  \ifx\tikzifexternalizing\@undefined\else
    \tikzifexternalizing{
      \renewcommand*\includepdf[2][]{}
    }{}
  \fi
}
\RequirePackage[shortlabels]{enumitem}
\RequirePackage{environ}
\ifzjgsu@raggedbottom
  \RequirePackage[bottom,perpage,hang]{footmisc}
  \raggedbottom
\else
  \RequirePackage[perpage,hang]{footmisc}
\fi
\ifXeTeX
  \RequirePackage{xeCJKfntef}
\else
  \RequirePackage{ulem}
\fi
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{url}
\AtEndPreamble{
  \@ifpackageloaded{biblatex}{}{
    \@ifpackageloaded{apacite}{}{
      \RequirePackage{natbib}
    }
  }
}
\AtEndOfPackageFile*{natbib}{
  \@ifpackageloaded{apacite}{}{
    \RequirePackage{bibunits}
  }
}
\newcommand\zjgsu@package@conflict[2]{%
  \AtEndOfPackageFile*{#1}{%
    \AtBeginOfPackageFile*{#2}{%
      \zjgsu@error{The "#2" package is incompatible with "#1"}%
    }%
  }%
}
\zjgsu@package@conflict{biblatex}{bibunits}
\zjgsu@package@conflict{biblatex}{chapterbib}
\zjgsu@package@conflict{biblatex}{cite}
\zjgsu@package@conflict{biblatex}{multibib}
\zjgsu@package@conflict{biblatex}{natbib}

\zjgsu@package@conflict{bibunits}{biblatex}
\zjgsu@package@conflict{bibunits}{chapterbib}
\zjgsu@package@conflict{bibunits}{multibib}

\zjgsu@package@conflict{unicode-math}{amscd}
\zjgsu@package@conflict{unicode-math}{amsfonts}
\zjgsu@package@conflict{unicode-math}{amssymb}
\zjgsu@package@conflict{unicode-math}{bbm}
\zjgsu@package@conflict{unicode-math}{bm}
\zjgsu@package@conflict{unicode-math}{eucal}
\zjgsu@package@conflict{unicode-math}{eufrak}
\zjgsu@package@conflict{unicode-math}{mathrsfs}
\zjgsu@package@conflict{unicode-math}{newtxmath}
\zjgsu@package@conflict{unicode-math}{upgreek}

\zjgsu@package@conflict{natbib}{biblatex}
\zjgsu@package@conflict{natbib}{cite}

\zjgsu@package@conflict{newtxmath}{amsfonts}
\zjgsu@package@conflict{newtxmath}{amssymb}
\zjgsu@package@conflict{newtxmath}{unicode-math}
\zjgsu@package@conflict{newtxmath}{upgreek}
\AtBeginOfPackageFile*{amsthm}{
  \@ifpackageloaded{newtxmath}{
    \zjgsu@error{The "amsthm" package should be loaded before setting "newtxmath"}
  }{}
}%
\geometry{
  paper          = a4paper,  % 210 * 297mm
  marginparwidth = 2cm,
  marginparsep   = 0.5cm,
}
\newcommand\zjgsu@set@geometry{%
  \ifzjgsu@degree@bachelor
    \geometry{
      top        = 3.8cm,
      bottom     = 3.2cm,
      left       = 3.2cm,
      right      = 3cm,
      headheight = 1.9cm,
      headsep    = 1.9cm,
      footskip   = 1.45cm,
    }%
    \ifzjgsu@output@print
      \geometry{
        left       = 3.2cm,
        right      = 3cm,
      }%
    \else
      \geometry{
        hmargin    = 3cm,
      }%
    \fi
  \else
    \geometry{
     %原始设置
      %margin     = 3cm,
%      headheight = 2.7cm,
%      headsep    = 0.3cm,
%      footskip   = 0.8cm,
  top       = 25mm,  
  bottom    = 25mm,  
  left      = 25mm,  
  right     = 25mm,  
  headheight= 2.7cm, % 你可以根据需要调整这个值  
  headsep   = 0.3cm, % 同样，这个值也可以根据你的页面布局需求来调整  
  footskip  = 0.8cm  % 页脚与文本底部的间距 
    }%
  \fi
}
\zjgsu@set@geometry
\zjgsu@option@hook{degree}{\zjgsu@set@geometry}
\zjgsu@option@hook{output}{\zjgsu@set@geometry}
\zjgsusetup{main-language=\zjgsu@language}%
\let\zjgsu@main@language\zjgsu@language
\zjgsu@option@hook{language}{%
  \ifx\@begindocumenthook\@undefined\else
    \zjgsusetup{main-language=\zjgsu@language}%
    \let\zjgsu@main@language\zjgsu@language
  \fi
}
\newcommand\zjgsu@reset@main@language{%
  \zjgsusetup{language = \zjgsu@main@language}%
  \let\zjgsu@language\zjgsu@main@language
}
\newcommand\zjgsu@set@chapter@names{%
  \ifzjgsu@main@language@chinese
    \def\zjgsu@comments@name{指导教师评语}%
    \def\bibname{参考文献}%
    \def\appendixname{附录}%
    \def\indexname{索引}%
    \def\zjgsu@resolution@name{答辩委员会决议书}%
    \ifzjgsu@degree@bachelor
      \def\contentsname{目\qquad 录}%
      \def\listfigurename{插图索引}%
      \def\listtablename{表格索引}%
      \def\zjgsu@list@figure@table@name{插图和附表索引}%
      \def\zjgsu@list@algorithm@name{算法索引}%
      \def\zjgsu@acknowledgements@name{致\qquad 谢}%
      \def\listequationname{公式索引}%
      \def\zjgsu@denotation@name{主要符号表}%
      \def\zjgsu@resume@name{在学期间参加课题的研究成果}%
    \else
      \def\listfigurename{\textbf{图目录}}%
      \def\listtablename{\textbf{表目录}}%
      \def\zjgsu@list@figure@table@name{插图和附表清单}%
      \def\zjgsu@list@algorithm@name{算法清单}%
      \def\listequationname{公式清单}%
      \def\zjgsu@acknowledgements@name{致\quad 谢}%
      \ifzjgsu@degree@graduate
        \def\contentsname{\textbf{目\quad 录}}%
        \def\zjgsu@denotation@name{\textbf{符号和缩略语说明}}%
        \def\zjgsu@resume@name{\textbf{攻读硕士学位期间的科研成果}}%
      \else  % degree = postdoc
        \def\contentsname{目\qquad 次}%
        \def\zjgsu@denotation@name{符号表}%
        \def\zjgsu@resume@name{个人简历、发表的学术论文与科研成果}%
      \fi
    \fi
  \else
    \ifzjgsu@main@language@english
      \def\zjgsu@comments@name{Comments from Thesis Supervisor}%
      \def\zjgsu@resolution@name{Resolution of Thesis Defense Committee}%
      \def\indexname{Index}%
      \ifzjgsu@degree@bachelor
        \def\contentsname{CONTENTS}%
        \def\listfigurename{FIGURES}%
        \def\listtablename{TABLES}%
        \def\zjgsu@list@figure@table@name{FIGURES AND TABLES}%
        \def\zjgsu@list@algorithm@name{ALGORITHMS}%
        \def\listequationname{EQUATIONS}%
        \def\zjgsu@denotation@name{ABBREVIATIONS}%
        \def\bibname{REFERENCES}%
        \def\appendixname{APPENDIX}%
        \def\zjgsu@acknowledgements@name{ACKNOWLEDGEMENTS}%
        \def\zjgsu@resume@name{PUBLICATIONS}%
      \else
        \def\contentsname{Table of Contents}%
        \def\listfigurename{List of Figures}%
        \def\listtablename{List of Tables}%
        \def\zjgsu@list@figure@table@name{List of Figures and Tables}%
        \def\zjgsu@list@algorithm@name{List of Algorithms}%
        \def\listequationname{List of Equations}%
        \def\zjgsu@denotation@name{List of Symbols and Acronyms}%
        \def\bibname{References}%
        \def\appendixname{Appendix}%
        \def\zjgsu@acknowledgements@name{Acknowledgements}%
        \def\zjgsu@resume@name{Resume}%
      \fi
    \fi
  \fi
}
\zjgsu@set@chapter@names
\zjgsu@option@hook{degree}{\zjgsu@set@chapter@names}
\zjgsu@option@hook{main-language}{\zjgsu@set@chapter@names}
\newcommand\zjgsu@set@names{%
  \ifzjgsu@language@chinese
    \ctexset{
      figurename = 图,
      tablename  = 表,
    }%
    \def\zjgsu@algorithm@name{算法}%
    \def\zjgsu@equation@name{公式}%
    \def\zjgsu@assumption@name{假设}%
    \def\zjgsu@definition@name{定义}%
    \def\zjgsu@proposition@name{命题}%
    \def\zjgsu@lemma@name{引理}%
    \def\zjgsu@theorem@name{定理}%
    \def\zjgsu@axiom@name{公理}%
    \def\zjgsu@corollary@name{推论}%
    \def\zjgsu@exercise@name{练习}%
    \def\zjgsu@example@name{例}%
    \def\zjgsu@remark@name{注释}%
    \def\zjgsu@problem@name{问题}%
    \def\zjgsu@conjecture@name{猜想}%
    \def\zjgsu@proof@name{证明}%
    \def\zjgsu@theorem@separator{：}%
  \else
    \ifzjgsu@language@english
      \ctexset{
        figurename = {Figure},
        tablename  = {Table},
      }%
      \def\zjgsu@algorithm@name{Algorithm}%
      \def\zjgsu@equation@name{Equation}%
      \def\zjgsu@assumption@name{Assumption}%
      \def\zjgsu@definition@name{Definition}%
      \def\zjgsu@proposition@name{Proposition}%
      \def\zjgsu@lemma@name{Lemma}%
      \def\zjgsu@theorem@name{Theorem}%
      \def\zjgsu@axiom@name{Axiom}%
      \def\zjgsu@corollary@name{Corollary}%
      \def\zjgsu@exercise@name{Exercise}%
      \def\zjgsu@example@name{Example}%
      \def\zjgsu@remark@name{Remark}%
      \def\zjgsu@problem@name{Problem}%
      \def\zjgsu@conjecture@name{Conjecture}%
      \def\zjgsu@proof@name{Proof}%
      \def\zjgsu@theorem@separator{: }%
    \fi
  \fi
}
\zjgsu@set@names
\zjgsu@option@hook{language}{\zjgsu@set@names}
\ifLuaTeX
  % ctex 将带圈数字 U+2460–U+24FF 归入字符范围 3（ALchar），这里改回范围 6（JAchar）
  \ltjdefcharrange{3}{%
    "2000-"243F, "2500-"27BF, "2900-"29FF, "2B00-"2BFF}
  \ltjdefcharrange{6}{%
    "2460-"24FF, "2E80-"2EFF, "3000-"30FF, "3190-"319F, "31F0-"4DBF,
    "4E00-"9FFF, "F900-"FAFF, "FE10-"FE1F, "FE30-"FE6F, "FF00-"FFEF,
    "1B000-"1B16F, "1F100-"1F2FF, "20000-"3FFFF, "E0100-"E01EF}
\else
  \ifXeTeX
    \xeCJKDeclareCharClass{CJK}{"2460 -> "2473}
    \xeCJKDeclareCharClass{CJK}{"2605}
  \fi
\fi
\newcommand\zjgsu@set@punctuations{%
  \ifzjgsu@language@chinese
    \ifLuaTeX
      \ltjsetparameter{jacharrange={+9}}
    \else
      \ifXeTeX
        \xeCJKDeclareCharClass{FullLeft}{"2018, "201C}%
        \xeCJKDeclareCharClass{FullRight}{
          "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A,
        }%
      \fi
    \fi
  \else
    \ifzjgsu@language@english
      \ifLuaTeX
        \ltjsetparameter{jacharrange={-9}}
      \else
        \ifXeTeX
          \xeCJKDeclareCharClass{HalfLeft}{"2018, "201C}%
          \xeCJKDeclareCharClass{HalfRight}{
            "00B7, "2019, "201D, "2013, "2014, "2025, "2026, "2E3A,
          }%
        \fi
      \fi
    \fi
  \fi
}
\zjgsu@set@punctuations
\zjgsu@option@hook{language}{\zjgsu@set@punctuations}
\renewcommand\normalsize{%
  \@setfontsize\normalsize{12pt}{20pt}%
  \abovedisplayskip 6pt%
  \abovedisplayshortskip 6pt%
  \belowdisplayshortskip 6pt%
  \belowdisplayskip \abovedisplayskip
}
\normalsize
\ifx\MakeRobust\@undefined \else
    \MakeRobust\normalsize
\fi
\def\zjgsu@def@fontsize#1#2{%
  \expandafter\newcommand\csname #1\endcsname[1][1.3]{%
    \fontsize{#2}{##1\dimexpr #2}\selectfont}}
\zjgsu@def@fontsize{chuhao}{42pt}
\zjgsu@def@fontsize{xiaochu}{36pt}
\zjgsu@def@fontsize{yihao}{26pt}
\zjgsu@def@fontsize{xiaoyi}{24pt}
\zjgsu@def@fontsize{erhao}{22pt}
\zjgsu@def@fontsize{xiaoer}{18pt}
\zjgsu@def@fontsize{sanhao}{16pt}
\zjgsu@def@fontsize{xiaosan}{15pt}
\zjgsu@def@fontsize{sihao}{14pt}
\zjgsu@def@fontsize{xiaosi}{12pt}
\zjgsu@def@fontsize{wuhao}{10.5pt}
\zjgsu@def@fontsize{xiaowu}{9pt}
\zjgsu@def@fontsize{liuhao}{7.5pt}
\zjgsu@def@fontsize{xiaoliu}{6.5pt}
\zjgsu@def@fontsize{qihao}{5.5pt}
\zjgsu@def@fontsize{bahao}{5pt}
\ifzjgsu@system@auto
  \IfFileExists{/System/Library/Fonts/Menlo.ttc}{
    \zjgsusetup{system = mac}
  }{
    \IfFileExists{/dev/null}{
      \IfFileExists{null:}{
        \zjgsusetup{system = windows}
      }{
        \zjgsusetup{system = unix}
      }
    }{
      \zjgsusetup{system = windows}
    }
  }
  \zjgsu@debug{Detected system: \zjgsu@system}
\fi
\newcommand\zjgsu@mac@word@font@dir{%
  /Applications/Microsoft Word.app/Contents/Resources/DFonts%
}
\ifzjgsu@fontset@auto
  \ifzjgsu@system@windows
    \zjgsusetup{fontset = windows}
  \else
    \IfFontExistsTF{SimSun}{
      \zjgsusetup{fontset = windows}
    }{
      \IfFileExists{\zjgsu@windows@font@dir/Simsun.ttc}{
        \zjgsusetup{fontset = windows, cjk-font = windows-local}
      }{
        \IfFileExists{\zjgsu@mac@word@font@dir/Simsun.ttc}{
          \zjgsusetup{fontset = windows, cjk-font = mac-word}
        }{
          \ifzjgsu@system@mac
            \zjgsusetup{fontset = mac}
          \else
            \IfFontExistsTF{Noto Serif CJK SC}{
              \zjgsusetup{fontset = ubuntu}
            }{
              \zjgsusetup{fontset = fandol}
            }
          \fi
        }
      }
    }
  \fi
  \zjgsu@debug{Detected fontset: \zjgsu@fontset}
\fi
\newcommand\zjgsu@set@font{%
  \@nameuse{zjgsu@set@font@\zjgsu@font}%
}
\zjgsu@option@hook{font}{\zjgsu@set@font}
\newcommand\zjgsu@set@font@auto{%
  \ifzjgsu@font@auto
    \ifzjgsu@fontset@windows
      \zjgsusetup{font=times}%
    \else
      \ifzjgsu@fontset@mac
        \zjgsusetup{font=times}%
      \else
        \zjgsusetup{font=termes}%
      \fi
    \fi
  \fi
}
\zjgsu@option@hook{math-font}{\g@addto@macro\zjgsu@setup@hook{\zjgsu@set@font@auto}}
\AtBeginOfPackageFile*{siunitx}{\zjgsu@set@font@auto}
\AtEndPreamble{\zjgsu@set@font@auto}
\newcommand\zjgsu@set@font@times{%
  \setmainfont{Times New Roman}%
  \setsansfont{Arial}%
  \ifzjgsu@fontset@mac
    \setmonofont{Menlo}[Scale = MatchLowercase]%
  \else
    \setmonofont{Courier New}[Scale = MatchLowercase]%
  \fi
}
\newcommand\zjgsu@set@font@termes{%
  \setmainfont{texgyretermes}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \zjgsu@set@texgyre@sans@mono
}
\newcommand\zjgsu@set@texgyre@sans@mono{%
  \setsansfont{texgyreheros}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setmonofont{texgyrecursor}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
    Scale          = MatchLowercase,
    Ligatures      = CommonOff,
  ]%
}
\let\zjgsu@font@family@stix\@empty
\newcommand\zjgsu@set@stix@names{%
  \ifx\zjgsu@font@family@stix\@empty
    \IfFontExistsTF{STIXTwoText-Regular.otf}{%
      \gdef\zjgsu@font@family@stix{STIXTwoText}%
      \gdef\zjgsu@font@name@stix@math{STIXTwoMath-Regular}%
    }{%
      \gdef\zjgsu@font@family@stix{STIX2Text}%
      \gdef\zjgsu@font@name@stix@math{STIX2Math}%
    }%
  \fi
}
\newcommand\zjgsu@set@font@stix{%
  \zjgsu@set@stix@names
  \setmainfont{\zjgsu@font@family@stix}[
    Extension      = .otf,
    UprightFont    = *-Regular,
    BoldFont       = *-Bold,
    ItalicFont     = *-Italic,
    BoldItalicFont = *-BoldItalic,
  ]%
  \zjgsu@set@texgyre@sans@mono
}
\let\zjgsu@font@family@xits\@empty
\newcommand\zjgsu@set@xits@names{%
  \ifx\zjgsu@font@family@xits\@empty
    \IfFontExistsTF{XITSMath-Regular.otf}{%
      \gdef\zjgsu@font@family@xits{XITS}%
      \gdef\zjgsu@font@style@xits@rm{Regular}%
      \gdef\zjgsu@font@style@xits@bf{Bold}%
      \gdef\zjgsu@font@style@xits@it{Italic}%
      \gdef\zjgsu@font@style@xits@bfit{BoldItalic}%
      \gdef\zjgsu@font@name@xits@math{XITSMath-Regular}%
    }{%
      \gdef\zjgsu@font@family@xits{xits}%
      \gdef\zjgsu@font@style@xits@rm{regular}%
      \gdef\zjgsu@font@style@xits@bf{bold}%
      \gdef\zjgsu@font@style@xits@it{italic}%
      \gdef\zjgsu@font@style@xits@bfit{bolditalic}%
      \gdef\zjgsu@font@name@xits@math{xits-math}%
    }%
  \fi
}
\newcommand\zjgsu@set@font@xits{%
  \zjgsu@set@xits@names
  \setmainfont{\zjgsu@font@family@xits}[
    Extension      = .otf,
    UprightFont    = *-\zjgsu@font@style@xits@rm,
    BoldFont       = *-\zjgsu@font@style@xits@bf,
    ItalicFont     = *-\zjgsu@font@style@xits@it,
    BoldItalicFont = *-\zjgsu@font@style@xits@bfit,
  ]%
  \zjgsu@set@texgyre@sans@mono
}
\let\zjgsu@font@family@libertinus\@empty
\newcommand\zjgsu@set@libertinus@names{%
  \ifx\zjgsu@font@family@libertinus\@empty
    \IfFontExistsTF{LibertinusSerif-Regular.otf}{%
      \gdef\zjgsu@font@family@libertinus@serif{LibertinusSerif}%
      \gdef\zjgsu@font@family@libertinus@sans{LibertinusSans}%
      \gdef\zjgsu@font@name@libertinus@math{LibertinusMath-Regular}%
      \gdef\zjgsu@font@style@libertinus@rm{Regular}%
      \gdef\zjgsu@font@style@libertinus@bf{Bold}%
      \gdef\zjgsu@font@style@libertinus@it{Italic}%
      \gdef\zjgsu@font@style@libertinus@bfit{BoldItalic}%
    }{%
      \gdef\zjgsu@font@family@libertinus@serif{libertinusserif}%
      \gdef\zjgsu@font@family@libertinus@sans{libertinussans}%
      \gdef\zjgsu@font@name@libertinus@math{libertinusmath-regular}%
      \gdef\zjgsu@font@style@libertinus@rm{regular}%
      \gdef\zjgsu@font@style@libertinus@bf{bold}%
      \gdef\zjgsu@font@style@libertinus@it{italic}%
      \gdef\zjgsu@font@style@libertinus@bfit{bolditalic}%
    }%
  \fi
}
\newcommand\zjgsu@set@font@libertinus{%
  \zjgsu@set@libertinus@names
  \setmainfont{\zjgsu@font@family@libertinus@serif}[
    Extension      = .otf,
    UprightFont    = *-\zjgsu@font@style@libertinus@rm,
    BoldFont       = *-\zjgsu@font@style@libertinus@bf,
    ItalicFont     = *-\zjgsu@font@style@libertinus@it,
    BoldItalicFont = *-\zjgsu@font@style@libertinus@bfit,
  ]%
  \setsansfont{\zjgsu@font@family@libertinus@sans}[
    Extension      = .otf,
    UprightFont    = *-\zjgsu@font@style@libertinus@rm,
    BoldFont       = *-\zjgsu@font@style@libertinus@bf,
    ItalicFont     = *-\zjgsu@font@style@libertinus@it,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\newcommand\zjgsu@set@font@newcm{%
  \setmainfont{NewCM10}[
    Extension      = .otf,
    UprightFont    = *-Book,
    BoldFont       = *-Bold,
    ItalicFont     = *-BookItalic,
    BoldItalicFont = *-BoldItalic,
  ]%
  \setsansfont{NewCMSans10}[
    Extension         = .otf,
    UprightFont       = *-Book,
    BoldFont          = *-Bold,
    ItalicFont        = *-BookOblique,
    BoldItalicFont    = *-BoldOblique,
  ]%
  \setmonofont{NewCMMono10}[
    Extension           = .otf,
    UprightFont         = *-Book,
    ItalicFont          = *-BookItalic,
    BoldFont            = *-Bold,
    BoldItalicFont      = *-BoldOblique,
  ]%
}
\newcommand\zjgsu@set@font@lm{%
  \setmainfont{lmroman10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setsansfont{lmsans10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
  \setmonofont{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\newcommand\zjgsu@set@font@newtx{%
  \RequirePackage{newtxtext}%
}
\ifzjgsu@cjk@font@auto
  \ifzjgsu@fontset@mac
    \zjgsusetup{cjk-font = mac}
  \else
    \ifzjgsu@fontset@windows
      \IfFontExistsTF{SimSun}{
        \zjgsusetup{cjk-font = windows}
      }{
        \IfFileExists{\zjgsu@windows@font@dir/Simsun.ttc}{
          \zjgsusetup{cjk-font = windows-local}
        }{
          \IfFileExists{\zjgsu@mac@word@font@dir/Simsun.ttc}{
            \zjgsusetup{cjk-font = mac-word}
          }{
            \zjgsu@error{Cannot find "SimSun" font}
          }
        }
      }
    \else
      \ifzjgsu@fontset@ubuntu
        \zjgsusetup{cjk-font = noto}
      \else
        \zjgsusetup{cjk-font = fandol}
      \fi
    \fi
  \fi
  \zjgsu@debug{Detected CJK font: \zjgsu@cjk@font}
\fi
\newcommand\zjgsu@set@cjk@font@windows{%
  \setCJKmainfont{SimSun}[
    AutoFakeBold = 3,
    ItalicFont   = KaiTi,
  ]%
  \setCJKsansfont{SimHei}[AutoFakeBold = 3]%
  \setCJKmonofont{FangSong}%
  \setCJKfamilyfont{zhsong}{SimSun}[AutoFakeBold = 3]%
  \setCJKfamilyfont{zhhei}{SimHei}[AutoFakeBold = 3]%
  \setCJKfamilyfont{zhkai}{KaiTi}[AutoFakeBold = 3]%
  \setCJKfamilyfont{zhfs}{FangSong}%
}
\@namedef{zjgsu@set@cjk@font@windows-local}{%
  \IfFileExists{\zjgsu@windows@font@dir/Kaiti.ttf}{
    \setCJKmainfont{SimSun}[%
      Path         = \zjgsu@windows@font@dir/,
      Extension    = .ttc,
      AutoFakeBold = 3,
      ItalicFont   = Kaiti,
      ItalicFeatures = {Extension = .ttf},
    ]%
    \setCJKmonofont{Fangsong}[
      Path         = \zjgsu@windows@font@dir/,
      Extension    = .ttf,
    ]%
    \setCJKfamilyfont{zhkai}{Kaiti}[
      Path         = \zjgsu@windows@font@dir/,
      Extension    = .ttf,
    ]%
    \setCJKfamilyfont{zhfs}{Fangsong}[
      Path         = \zjgsu@windows@font@dir/,
      Extension    = .ttf,
    ]%
  }{
    \setCJKmainfont{SimSun}[%
      Path         = \zjgsu@windows@font@dir/,
      Extension    = .ttc,
      AutoFakeBold = 3,
      ItalicFont   = Simkai,
      ItalicFeatures = {Extension = .ttf},
    ]%
    \setCJKmonofont{Simfang}[
      Path         = \zjgsu@windows@font@dir/,
      Extension    = .ttf,
    ]%
    \setCJKfamilyfont{zhkai}{Simkai}[
      Path         = \zjgsu@windows@font@dir/,
      AutoFakeBold = 3,
      Extension    = .ttf,
    ]%
    \setCJKfamilyfont{zhfs}{Simfang}[
      Path         = \zjgsu@windows@font@dir/,
      Extension    = .ttf,
    ]%
  }
  \setCJKsansfont{SimHei}[%
    Path         = \zjgsu@windows@font@dir/,
    Extension    = .ttf,
    AutoFakeBold = 3,
  ]%
  \setCJKfamilyfont{zhsong}{SimSun}[%
    Path         = \zjgsu@windows@font@dir/,
    Extension    = .ttc,
    AutoFakeBold = 3,
  ]%
  \setCJKfamilyfont{zhhei}{SimHei}[%
    Path         = \zjgsu@windows@font@dir/,
    Extension    = .ttf,
    AutoFakeBold = 3,
  ]%
}
\@namedef{zjgsu@set@cjk@font@mac-word}{%
  \let\zjgsu@windows@font@dir\zjgsu@mac@word@font@dir
  \@nameuse{zjgsu@set@cjk@font@windows-local}%
}
\newcommand\zjgsu@set@cjk@font@mac{%
  \defaultCJKfontfeatures{}%
  \setCJKmainfont{Songti SC}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
    ItalicFont     = Kaiti SC Regular,
    BoldItalicFont = Kaiti SC Bold,
  ]%
  \setCJKsansfont{Heiti SC}[
    UprightFont    = * Light,
    BoldFont       = * Medium,
  ]%
  \setCJKmonofont{STFangsong}
  \setCJKfamilyfont{zhsong}{Songti SC}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
  ]%
  \setCJKfamilyfont{zhhei}{Heiti SC}[
    UprightFont    = * Light,
    BoldFont       = * Medium,
  ]%
  \setCJKfamilyfont{zhfs}{STFangsong}%
  \setCJKfamilyfont{zhkai}{Kaiti SC}[
    UprightFont    = * Regular,
    BoldFont       = * Bold,
  ]%
  \setCJKfamilyfont{zhli}{Baoli SC}%
  \setCJKfamilyfont{zhyuan}{Yuanyi SC}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
  ]%
}
\newcommand\zjgsu@set@cjk@font@noto{%
  \defaultCJKfontfeatures{}%
  \setCJKmainfont{Noto Serif CJK SC}[
    UprightFont    = * Light,
    BoldFont       = * Bold,
    ItalicFont     = FandolKai-Regular,
    ItalicFeatures = {Extension = .otf},
    Script         = CJK,
  ]%
  \setCJKsansfont{Noto Sans CJK SC}[
    BoldFont       = * Medium,
    Script         = CJK,
  ]%
  \setCJKmonofont{Noto Sans Mono CJK SC}[
    Script         = CJK,
  ]%
  \setCJKfamilyfont{zhsong}{Noto Serif CJK SC}[
    UprightFont    = * Light,
    UprightFont    = * Bold,
    Script         = CJK,
  ]%
  \setCJKfamilyfont{zhhei}{Noto Sans CJK SC}[
    BoldFont       = * Medium,
    Script         = CJK,
  ]%
  \setCJKfamilyfont{zhfs}{FandolFang}[
    Extension      = .otf,
    UprightFont    = *-Regular,
  ]%
  \setCJKfamilyfont{zhkai}{FandolKai}[
    Extension      = .otf,
    UprightFont    = *-Regular,
  ]%
}
\newcommand\zjgsu@set@cjk@font@fandol{%
  \defaultCJKfontfeatures{}%
  \setCJKmainfont{FandolSong}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
    ItalicFont  = FandolKai-Regular,
    ItalicFeatures = {Extension = .otf},
  ]%
  \setCJKsansfont{FandolHei}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKmonofont{FandolFang}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
  \setCJKfamilyfont{zhsong}{FandolSong}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKfamilyfont{zhhei}{FandolHei}[
    Extension   = .otf,
    UprightFont = *-Regular,
    BoldFont    = *-Bold,
  ]%
  \setCJKfamilyfont{zhfs}{FandolFang}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
  \setCJKfamilyfont{zhkai}{FandolKai}[
    Extension   = .otf,
    UprightFont = *-Regular,
  ]%
}
\ifzjgsu@cjk@font@none\else
  \providecommand\songti{\CJKfamily{zhsong}}
  \providecommand\heiti{\CJKfamily{zhhei}}
  \providecommand\fangsong{\CJKfamily{zhfs}}
  \providecommand\kaishu{\CJKfamily{zhkai}}
\fi
\newcommand\zjgsu@set@cjk@font{%
  \@nameuse{zjgsu@set@cjk@font@\zjgsu@cjk@font}%
}
\zjgsu@set@cjk@font
\zjgsu@option@hook{cjk-font}{\zjgsu@set@cjk@font}
\newcommand\zjgsu@set@math@style{%
  \ifzjgsu@math@style@TeX
    \zjgsusetup{
      uppercase-greek    = upright,
      less-than-or-equal = horizontal,
      integral           = slanted,
      integral-limits    = false,
      partial            = italic,
      math-ellipsis      = AMS,
      real-part          = fraktur,
    }%
  \else
    \zjgsusetup{
      uppercase-greek = italic,
      integral        = upright,
      partial         = upright,
      real-part       = roman,
    }%
    \ifzjgsu@math@style@ISO
      \zjgsusetup{
        less-than-or-equal = horizontal,
        integral-limits    = true,
        math-ellipsis      = lower,
      }%
    \else
      \ifzjgsu@math@style@GB
        \zjgsusetup{
          less-than-or-equal = slanted,
          integral-limits    = false,
          math-ellipsis      = centered,
        }%
      \fi
    \fi
  \fi
}
\ifzjgsu@main@language@chinese
  \zjgsusetup{math-style=GB}%
\else
  \zjgsusetup{math-style=TeX}%
\fi
\zjgsu@set@math@style
\zjgsu@option@hook{math-style}{\zjgsu@set@math@style}
\zjgsu@option@hook{main-language}{%
  \ifzjgsu@main@language@chinese
    \zjgsusetup{math-style=GB}%
  \else
    \zjgsusetup{math-style=TeX}%
  \fi
}
\newcommand\zjgsu@set@unimath@leq{%
  \ifzjgsu@leq@horizontal
    \ifx\@begindocumenthook\@undefined
      \let\le\zjgsu@save@leq
      \let\ge\zjgsu@save@geq
      \let\leq\zjgsu@save@leq
      \let\geq\zjgsu@save@geq
    \else
      \AtBeginDocument{%
        \let\le\zjgsu@save@leq
        \let\ge\zjgsu@save@geq
        \let\leq\zjgsu@save@leq
        \let\geq\zjgsu@save@geq
      }%
    \fi
  \else
    \ifzjgsu@leq@slanted
      \ifx\@begindocumenthook\@undefined
        \let\le\leqslant
        \let\ge\geqslant
        \let\leq\leqslant
        \let\geq\geqslant
      \else
        \AtBeginDocument{%
          \let\le\leqslant
          \let\ge\geqslant
          \let\leq\leqslant
          \let\geq\geqslant
        }%
      \fi
    \fi
  \fi
}
\newcommand\zjgsu@set@unimath@integral@limits{%
  \ifzjgsu@integral@limits@true
    \removenolimits{%
      \int\iint\iiint\iiiint\oint\oiint\oiiint
      \intclockwise\varointclockwise\ointctrclockwise\sumint
      \intbar\intBar\fint\cirfnint\awint\rppolint
      \scpolint\npolint\pointint\sqint\intlarhk\intx
      \intcap\intcup\upint\lowint
    }%
  \else
    \addnolimits{%
      \int\iint\iiint\iiiint\oint\oiint\oiiint
      \intclockwise\varointclockwise\ointctrclockwise\sumint
      \intbar\intBar\fint\cirfnint\awint\rppolint
      \scpolint\npolint\pointint\sqint\intlarhk\intx
      \intcap\intcup\upint\lowint
    }%
  \fi
}
\newcommand\zjgsu@set@unimath@ellipsis{%
  \ifzjgsu@math@ellipsis@centered
    \DeclareRobustCommand\mathellipsis{\mathinner{\unicodecdots}}%
  \else
    \DeclareRobustCommand\mathellipsis{\mathinner{\unicodeellipsis}}%
  \fi
}
\newcommand\zjgsu@set@unimath@real@part{%
  \ifzjgsu@real@part@roman
    \AtBeginDocument{%
      \def\Re{\operatorname{Re}}%
      \def\Im{\operatorname{Im}}%
    }%
  \else
    \AtBeginDocument{%
      \let\Re\zjgsu@save@Re
      \let\Im\zjgsu@save@Im
    }%
  \fi
}
\newcommand\zjgsu@set@unimath@style{%
  \ifzjgsu@uppercase@greek@upright
    \unimathsetup{math-style = TeX}%
  \else
    \ifzjgsu@uppercase@greek@italic
      \unimathsetup{math-style = ISO}%
    \fi
  \fi
  \ifzjgsu@math@style@TeX
    \unimathsetup{bold-style = TeX}%
  \else
    \unimathsetup{bold-style = ISO}%
  \fi
  \zjgsu@set@unimath@leq
  \zjgsu@set@unimath@integral@limits
  \ifzjgsu@partial@upright
    \unimathsetup{partial = upright}%
  \else
    \ifzjgsu@partial@italic
      \unimathsetup{partial = italic}%
    \fi
  \fi
  \zjgsu@set@unimath@ellipsis
  \zjgsu@set@unimath@real@part
}
\newcommand\zjgsu@qed{\rule{1ex}{1ex}}
\newcommand\zjgsu@load@unimath{%
  \@ifpackageloaded{unicode-math}{}{%
    \RequirePackage{unicode-math}%
    \AtBeginDocument{%
      \let\zjgsu@save@leq\leq
      \let\zjgsu@save@geq\geq
      \let\zjgsu@save@Re\Re
      \let\zjgsu@save@Im\Im
    }%
    \DeclareRobustCommand\bm[1]{{\symbfit{##1}}}%
    \DeclareRobustCommand\boldsymbol[1]{{\symbfit{##1}}}%
    \newcommand\square{\mdlgwhtsquare}%
    \newcommand\blacksquare{\mdlgblksquare}%
    \AtBeginDocument{%
      \renewcommand\checkmark{\ensuremath{\symbol{"2713}}}%
    }%
    \renewcommand\zjgsu@qed{\ensuremath{\QED}}%
  }%
}
\newcommand\zjgsu@set@math@font@stix{%
  \zjgsu@set@stix@names
  \setmathfont{\zjgsu@font@name@stix@math}[
    Extension    = .otf,
    Scale        = MatchLowercase,
    StylisticSet = \zjgsu@xits@integral@stylistic@set,
  ]%
  \setmathfont{\zjgsu@font@name@stix@math}[
    Extension    = .otf,
    Scale        = MatchLowercase,
    StylisticSet = 1,
    range        = {scr,bfscr},
  ]%
}
\newcommand\zjgsu@xits@integral@stylistic@set{%
  \ifzjgsu@integral@upright
    8%
  \fi
}
\newcommand\zjgsu@set@math@font@xits{%
  \zjgsu@set@xits@names
  \setmathfont{\zjgsu@font@name@xits@math}[
    Extension    = .otf,
    StylisticSet = \zjgsu@xits@integral@stylistic@set,
  ]%
  \setmathfont{\zjgsu@font@name@xits@math}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {cal,bfcal},
  ]%
}
\newcommand\zjgsu@libertinus@integral@stylistic@set{%
  \ifzjgsu@integral@slanted
    8%
  \fi
}
\newcommand\zjgsu@set@math@font@libertinus{%
  \zjgsu@set@libertinus@names
  \setmathfont{\zjgsu@font@name@libertinus@math}[
    Extension    = .otf,
    StylisticSet = \zjgsu@libertinus@integral@stylistic@set,
  ]%
}
\newcommand\zjgsu@newcm@integral@stylistic@set{%
  \ifzjgsu@integral@upright
    2%
  \fi
}
\newcommand\zjgsu@set@math@font@newcm{%
  \setmathfont{NewCMMath-Book}[
    Extension    = .otf,
    StylisticSet = \zjgsu@newcm@integral@stylistic@set,
  ]%
  \setmathfont{NewCMMath-Book}[
    Extension    = .otf,
    StylisticSet = 1,
    range        = {scr,bfscr},
  ]%
  \setmathrm{NewCM10}[
    Extension      = .otf,
    UprightFont    = *-Book,
    BoldFont       = *-Bold,
    ItalicFont     = *-BookItalic,
    BoldItalicFont = *-BoldItalic,
  ]%
  \setmathsf{NewCMSans10}[
    Extension         = .otf,
    UprightFont       = *-Book,
    BoldFont          = *-Bold,
    ItalicFont        = *-BookOblique,
    BoldItalicFont    = *-BoldOblique,
  ]%
  \setmathtt{NewCMMono10}[
    Extension           = .otf,
    UprightFont         = *-Book,
    ItalicFont          = *-BookItalic,
    BoldFont            = *-Bold,
    BoldItalicFont      = *-BoldOblique,
  ]%
}
\newcommand\zjgsu@set@math@font@lm{%
  \setmathfont{latinmodern-math}[Extension=.otf]%
  \setmathrm{lmroman10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-italic,
    BoldItalicFont = *-bolditalic,
  ]%
  \setmathsf{lmsans10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
  \setmathtt{lmmonolt10}[
    Extension      = .otf,
    UprightFont    = *-regular,
    BoldFont       = *-bold,
    ItalicFont     = *-oblique,
    BoldItalicFont = *-boldoblique,
  ]%
}
\newcommand\zjgsu@set@math@font@newtx{%
  \ifzjgsu@font@newtx\else
    \let\zjgsu@save@encodingdefault\encodingdefault
    \let\zjgsu@save@rmdefault\rmdefault
    \let\zjgsu@save@sfdefault\sfdefault
    \let\zjgsu@save@ttdefault\ttdefault
    \RequirePackage[T1]{fontenc}%
    \renewcommand{\rmdefault}{ntxtlf}%
    \renewcommand{\sfdefault}{qhv}%
    \renewcommand{\ttdefault}{ntxtt}%
  \fi
  \ifzjgsu@uppercase@greek@italic
    \PassOptionsToPackage{slantedGreek}{newtxmath}%
  \fi
  \ifzjgsu@integral@upright
    \PassOptionsToPackage{upint}{newtxmath}%
  \fi
  \RequirePackage{newtxmath}
  \let\zjgsu@save@leq\leq
  \let\zjgsu@save@geq\geq
  \ifzjgsu@leq@slanted
    \let\le\leqslant
    \let\ge\geqslant
    \let\leq\leqslant
    \let\geq\geqslant
  \fi
  \ifzjgsu@integral@limits@true
    \let\ilimits@\displaylimits
  \fi
  \let\zjgsu@save@partial\partial
  \ifzjgsu@partial@upright
    \let\partial\uppartial
  \fi
  \ifzjgsu@math@ellipsis@centered
    \DeclareRobustCommand\mathellipsis{\mathinner{\cdotp\cdotp\cdotp}}%
  \else
    \DeclareRobustCommand\mathellipsis{\mathinner{\ldotp\ldotp\ldotp}}%
  \fi
  \let\zjgsu@save@Re\Re
  \let\zjgsu@save@Im\Im
  \ifzjgsu@real@part@roman
    \def\Re{\operatorname{Re}}%
    \def\Im{\operatorname{Im}}%
  \fi
  \RequirePackage{bm}%
  \ifzjgsu@font@newtx\else
    \let\encodingdefault\zjgsu@save@encodingdefault
    \let\rmdefault\zjgsu@save@rmdefault
    \let\sfdefault\zjgsu@save@sfdefault
    \let\ttdefault\zjgsu@save@ttdefault
  \fi
  \DeclareRobustCommand\symup[1]{{\mathrm{##1}}}%
  \DeclareRobustCommand\symbf[1]{{\bm{##1}}}%
  \DeclareRobustCommand\symbfsf[1]{{\bm{\mathsf{##1}}}}%
  \let\increment\upDelta%
  \renewcommand\zjgsu@qed{\openbox}%
}
\newcommand\zjgsu@set@math@font{%
  \ifzjgsu@math@font@none\else
    \ifzjgsu@math@font@newtx
      \zjgsu@set@math@font@newtx
    \else
      \zjgsu@load@unimath
      \zjgsu@set@unimath@style
      \@nameuse{zjgsu@set@math@font@\zjgsu@math@font}%
    \fi
  \fi
}
\zjgsu@option@hook{math-font}{\g@addto@macro\zjgsu@setup@hook{\zjgsu@set@math@font}}
\newcommand\zjgsu@set@math@font@auto{%
  \ifzjgsu@math@font@auto
    \zjgsusetup{math-font=xits}%
  \fi
}
\AtBeginOfPackageFile*{siunitx}{\zjgsu@set@math@font@auto}
\AtEndPreamble{\zjgsu@set@math@font@auto}
\def\cleardoublepage{%
  \clearpage
  \if@twoside
    \ifzjgsu@output@print
      \ifodd\c@page
      \else
        \thispagestyle{empty}%
        \hbox{}%
        \newpage
        \if@twocolumn
          \hbox{}\newpage
        \fi
      \fi
    \fi
  \fi
}
\renewcommand\frontmatter{%
  \cleardoublepage
  \@mainmatterfalse
  \pagenumbering{Roman}%
}
\renewcommand\mainmatter{%
  \cleardoublepage
  \@mainmattertrue
  \pagenumbering{arabic}%
}
\newif\ifzjgsu@backmatter
\renewcommand\backmatter{%
  \if@openright
    \cleardoublepage
  \else
    \clearpage
  \fi
  \@mainmatterfalse
  \zjgsu@backmattertrue
  \zjgsusetup{toc-depth = 0}%
}

\pagestyle{plain}
\def\ps@chapter{}
\ctexset{chapter/pagestyle = chapter}
\ctexset{%
  punct=quanjiao,
}
\newcommand\zjgsu@set@indent{%
  \ifzjgsu@main@language@chinese
    \ctexset{autoindent=2}%
  \else
    \ifzjgsu@degree@bachelor
      \ctexset{autoindent=0.8cm}%
    \else
      \ctexset{autoindent=0.74cm}%
    \fi
  \fi
}
\zjgsu@set@indent
\zjgsu@option@hook{degree}{\zjgsu@set@indent}
\zjgsu@option@hook{main-language}{\zjgsu@set@indent}
\urlstyle{same}
\g@addto@macro\UrlBreaks{%
  \do0\do1\do2\do3\do4\do5\do6\do7\do8\do9%
  \do\A\do\B\do\C\do\D\do\E\do\F\do\G\do\H\do\I\do\J\do\K\do\L\do\M
  \do\N\do\O\do\P\do\Q\do\R\do\S\do\T\do\U\do\V\do\W\do\X\do\Y\do\Z
  \do\a\do\b\do\c\do\d\do\e\do\f\do\g\do\h\do\i\do\j\do\k\do\l\do\m
  \do\n\do\o\do\p\do\q\do\r\do\s\do\t\do\u\do\v\do\w\do\x\do\y\do\z
}
\Urlmuskip=0mu plus 0.1mu
\partopsep=\z@skip
\def\@listi{\leftmargin\leftmargini
            \parsep \z@skip
            \topsep \z@skip
            \itemsep\z@skip}
\let\@listI\@listi
\@listi
\def\@listii {\leftmargin\leftmarginii
              \labelwidth\leftmarginii
              \advance\labelwidth-\labelsep
              \topsep    \z@skip
              \parsep    \z@skip
              \itemsep   \z@skip}
\def\@listiii{\leftmargin\leftmarginiii
              \labelwidth\leftmarginiii
              \advance\labelwidth-\labelsep
              \topsep    \z@skip
              \parsep    \z@skip
              \partopsep \z@skip
              \itemsep   \z@skip}
\setlist{nosep}
\interfootnotelinepenalty=10000
\newcommand\zjgsu@circled[1]{%
  \ifnum#1 >10\relax
    \zjgsu@warning{%
      Too many footnotes in this page.
      Keep footnote less than 10%
    }%
  \fi
  {\symbol{\the\numexpr#1+"245F\relax}}%
}
\renewcommand{\thefootnote}{\zjgsu@circled{\c@footnote}}
\renewcommand{\thempfootnote}{\zjgsu@circled{\c@mpfootnote}}
\def\footnoterule{\vskip-3\p@\hrule\@width0.3\textwidth\@height0.4\p@\vskip2.6\p@}
\footnotemargin=13.5pt
\long\def\@makefntext#1{%
  \begingroup
    % 序号取消上标
    \def\@makefnmark{\hbox{\normalfont\@thefnmark}}%
    \xiaowu
    \ifFN@hangfoot
      \bgroup
      \setbox\@tempboxa\hbox{%
        \ifdim\footnotemargin>\z@
          \hb@xt@\footnotemargin{\@makefnmark\hss}%
        \else
          \@makefnmark
        \fi
      }%
      \leftmargin\wd\@tempboxa
      \rightmargin\z@
      \linewidth \columnwidth
      \advance \linewidth -\leftmargin
      \parshape \@ne \leftmargin \linewidth
      % \footnotesize
      \xiaowu
      \@setpar{{\@@par}}%
      \leavevmode
      \llap{\box\@tempboxa}%
      \parskip\hangfootparskip\relax
      \parindent\hangfootparindent\relax
    \else
      \parindent1em%
      \noindent
      \ifdim\footnotemargin>\z@
        \hb@xt@ \footnotemargin{\hss\@makefnmark}%
      \else
        \ifdim\footnotemargin=\z@
          \llap{\@makefnmark}%
        \else
          \llap{\hb@xt@ -\footnotemargin{\@makefnmark\hss}}%
        \fi
      \fi
    \fi
    \footnotelayout#1%
    \ifFN@hangfoot
      \par\egroup
    \fi
  \endgroup
}
\allowdisplaybreaks[4]
\newcommand\zjgsu@eqn@left@paren{（}
\newcommand\zjgsu@eqn@right@paren{）}
\newcommand\zjgsu@set@eqn@paren@style{%
  \ifzjgsu@eqn@paren@style@full
    \renewcommand\zjgsu@eqn@left@paren{（}%
    \renewcommand\zjgsu@eqn@right@paren{）}%
  \else
    \renewcommand\zjgsu@eqn@left@paren{(}%
    \renewcommand\zjgsu@eqn@right@paren{)}%
  \fi
}
\zjgsu@set@eqn@paren@style
\zjgsu@option@hook{eqn-paren-style}{\zjgsu@set@eqn@paren@style}
\newcommand\zjgsu@put@parentheses[1]{%
  \ifzjgsu@language@chinese
    \unskip
    \zjgsu@eqn@left@paren#1\zjgsu@eqn@right@paren
  \else
    (#1)%
  \fi
}
\def\tagform@#1{\maketag@@@{\zjgsu@put@parentheses{\ignorespaces#1\unskip\@@italiccorr}}}
\renewcommand{\eqref}[1]{%
  \textup{%
    \normalfont\zjgsu@put@parentheses{%
      \ignorespaces\ref{#1}\unskip\@@italiccorr
    }%
  }%
}
\def\fps@figure{htbp}
\def\fps@table{htbp}
\setlength{\floatsep}{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength{\textfloatsep}{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength{\intextsep}{12\p@ \@plus 2\p@ \@minus 2\p@}
\setlength{\@fptop}{0pt \@plus1.0fil}
\setlength{\@fpsep}{12pt \@plus2.0fil}
\setlength{\@fpbot}{0pt \@plus1.0fil}
\patchcmd{\@addtocurcol}%
  {\vskip \intextsep}%
  {\edef\save@first@penalty{\the\lastpenalty}\unpenalty
   \ifnum \lastpenalty = \@M  % hopefully the OR penalty
     \unpenalty
   \else
     \penalty \save@first@penalty \relax % put it back
   \fi
   \ifnum\outputpenalty <-\@Mii
     \addvspace\intextsep
     \vskip\parskip
   \else
     \addvspace\intextsep
   \fi}%
  {}{\zjgsu@patch@error{\@addtocurcol}}
\patchcmd{\@addtocurcol}%
  {\vskip\intextsep \ifnum\outputpenalty <-\@Mii \vskip -\parskip\fi}%
  {\ifnum\outputpenalty <-\@Mii
     \aftergroup\vskip\aftergroup\intextsep
     \aftergroup\nointerlineskip
   \else
     \vskip\intextsep
   \fi}%
  {}{\zjgsu@patch@error{\@addtocurcol}}
\patchcmd{\@getpen}{\@M}{\@Mi}
  {}{\zjgsu@patch@error{\@getpen}}
\renewcommand{\textfraction}{0.15}
\renewcommand{\topfraction}{0.85}
\renewcommand{\bottomfraction}{0.65}
\renewcommand{\floatpagefraction}{0.60}
\zjgsu@define@key{
  figure-number-separator = {
    name    = figure@number@separator,
    default = {.},
  },
  table-number-separator = {
    name    = table@number@separator,
    default = {.},
  },
  equation-number-separator = {
    name    = equation@number@separator,
    default = {.},
  },
  number-separator = {
    name    = number@separator,
    default = {.},
  },
}
\renewcommand\thefigure{%
  \ifnum\c@chapter>\z@
    \thechapter
    \zjgsu@figure@number@separator
  \fi
  \@arabic\c@figure
}
\renewcommand\thetable{%
  \ifnum\c@chapter>\z@
    \thechapter
    \zjgsu@table@number@separator
  \fi
  \@arabic\c@table
}
\renewcommand\theequation{%
  \ifnum\c@chapter>\z@
    \thechapter
    \zjgsu@equation@number@separator
  \fi
  \@arabic\c@equation
}
\newcommand\zjgsu@set@number@separator{%
  \let\zjgsu@figure@number@separator\zjgsu@number@separator
  \let\zjgsu@table@number@separator\zjgsu@number@separator
  \let\zjgsu@equation@number@separator\zjgsu@number@separator
}
\zjgsu@option@hook{number-separator}{\zjgsu@set@number@separator}
\DeclareCaptionFont{zjgsu}{%
  \ifzjgsu@degree@bachelor
    \fontsize{11pt}{15pt}\selectfont
  \else
    \ifzjgsu@language@chinese
      \fontsize{11pt}{14.3pt}\selectfont
    \else
      \fontsize{11pt}{12.65pt}\selectfont
    \fi
  \fi
}
\captionsetup{
  font           = zjgsu,
  labelsep       = quad,
  skip           = 6pt,
  figureposition = bottom,
  tableposition  = top,
}
\captionsetup[sub]{font=zjgsu}
\renewcommand{\thesubfigure}{(\alph{subfigure})}
\renewcommand{\thesubtable}{(\alph{subtable})}
\newcommand\zjgsu@set@table@font{
  \ifzjgsu@language@chinese
    \def\zjgsu@table@font{%
      \fontsize{11pt}{14.3pt}\selectfont
      \renewcommand\arraystretch{1.42}%
    }%
  \else
    \def\zjgsu@table@font{%
      \fontsize{11pt}{12.65pt}\selectfont
      \renewcommand\arraystretch{1.47}%
    }%
  \fi
}
\zjgsu@set@table@font
\zjgsu@option@hook{language}{\zjgsu@set@table@font}
\patchcmd\@floatboxreset{%
  \normalsize
}{%
  \zjgsu@table@font
}{}{\zjgsu@patch@error{\@floatboxreset}}
\AtEndOfPackageFile*{longtable}{
  \AtBeginEnvironment{longtable}{%
    \zjgsu@table@font
  }
}
\heavyrulewidth=1.5pt
\lightrulewidth=1pt
\AtEndOfPackageFile*{threeparttable}{
  \g@addto@macro\TPT@defaults{\wuhao}
}
\ifzjgsu@degree@bachelor
  \newcommand{\zjgsu@abstract@name}{中文摘要}
  \newcommand{\zjgsu@abstract@name@en}{ABSTRACT}
\else
  \newcommand{\zjgsu@abstract@name}{摘\quad 要}
  \newcommand{\zjgsu@abstract@name@en}{Abstract}
\fi
\ctexset{%
  chapter = {
    nameformat   = {},
    numberformat = {},
    titleformat  = {},
    fixskip      = true,
    afterindent  = true,
    lofskip      = 0pt,
    lotskip      = 0pt,
  },
  section = {
    afterindent  = true,
  },
  subsection = {
    afterindent  = true,
  },
  subsubsection = {
    afterindent  = true,
  },
  paragraph/afterindent = true,
  subparagraph/afterindent = true,
}
\newcommand\zjgsu@set@section@format{%
  \ifzjgsu@degree@bachelor
    \ctexset{%
      chapter = {
        format     = \centering\sffamily\fontsize{15pt}{20pt}\selectfont,
        aftername  = \quad,
        beforeskip = 30pt,
        afterskip  = 20pt,
      },
      section = {
        format     = \sffamily\fontsize{14pt}{18pt}\selectfont,
        aftername  = \quad,
        beforeskip = 25pt,
        afterskip  = 12pt,
      },
      subsection = {
        format     = \sffamily\fontsize{13pt}{15pt}\selectfont,
        aftername  = \quad,
        beforeskip = 12pt,
        afterskip  = 6pt,
      },
      subsubsection = {
        format     = \sffamily\fontsize{12pt}{14pt}\selectfont,
        aftername  = \quad,
        beforeskip = 12pt,
        afterskip  = 6pt,
      },
    }%
    \ifzjgsu@main@language@chinese
      \ctexset{
        chapter = {
          name   = {第,章},
          number = \thechapter,
        },
      }%
    \else
      \ctexset{
        chapter = {
          name   = \chaptername\space,
          number = \zjgsu@english@number{chapter},
        },
      }%
    \fi
  \else
    \ctexset{%
      chapter = {
        beforeskip = 27pt,
        afterskip  = 27pt,
        number     = \thechapter,
      },
      section = {
        beforeskip = 24pt,
        afterskip  = 6pt,
      },
      subsection = {
        beforeskip = 12pt,
        afterskip  = 6pt,
      },
      subsubsection = {
        beforeskip = 12pt,
        afterskip  = 6pt,
      },
    }%
    \ifzjgsu@main@language@chinese
      \ctexset{%
        chapter = {
          %format      = \centering\sffamily\sanhao,
          format      = \centering\heiti\sanhao,  %3号黑体，居左顶格
          nameformat  = {},
          titleformat = {},
          name        = {第,章},
          aftername   = \quad,
        },
        section = {
          %format     = \sffamily\fontsize{14pt}{20pt}\selectfont,
          format     = \noindent\heiti\xiaosan,
          aftername  = \quad,
        },
        subsection = {
          %format     = \sffamily\fontsize{13pt}{20pt}\selectfont,
          format     = \noindent\heiti\sihao,
          aftername  = \quad,
        },
        subsubsection = {
          %format     = \sffamily\fontsize{12pt}{20pt}\selectfont,
          format     = \noindent\heiti\xiaosi\textbf,
          aftername  = \quad,
        },
      }%
    \else
      \ctexset{%
        chapter = {
          format      = \centering\sffamily\bfseries\fontsize{16pt}{20pt}\selectfont,
          nameformat  = \MakeUppercase,
          titleformat = \MakeUppercase,
          name        = \chaptername\space,
          aftername   = \space,
        },
        section = {
          format     = \sffamily\bfseries\fontsize{14pt}{20pt}\selectfont,
          aftername  = \space,
        },
        subsection = {
          format     = \sffamily\bfseries\fontsize{13pt}{20pt}\selectfont,
          aftername  = \space,
        },
        subsubsection = {
          format     = \sffamily\bfseries\fontsize{12pt}{20pt}\selectfont,
          aftername  = \space,
        },
      }%
    \fi
  \fi
}
\zjgsu@set@section@format
\zjgsu@option@hook{degree}{\zjgsu@set@section@format}
\zjgsu@option@hook{main-language}{\zjgsu@set@section@format}
\newcommand\zjgsu@english@number[1]{%
  \expandafter\ifcase\csname c@#1\endcsname
    Zero\or
    One\or
    Two\or
    Three\or
    Four\or
    Five\or
    Six\or
    Seven\or
    Eight\or
    Nine\or
    Ten\or
    Eleven\or
    Twelve\or
    Thirteen\or
    Fourteen\or
    Fifteen\or
    Sixteen\or
    Seventeen\or
    Eighteen\or
    Nineteen\or
    Twenty\or
    \zjgsu@error{You are genius}%
  \fi
}
\newcommand\zjgsu@pdfbookmark[2]{}
\newcommand\zjgsu@phantomsection{}
\NewDocumentCommand\zjgsu@chapter{s o m o}{%
  \IfBooleanF{#1}{%
    \zjgsu@error{You have to use the star form: \string\zjgsu@chapter*}%
  }%
  \if@openright\cleardoublepage\else\clearpage\fi%
  \IfValueTF{#2}{%
    \ifthenelse{\equal{#2}{}}{%
      \zjgsu@pdfbookmark{0}{#3}%
    }{%
      \zjgsu@phantomsection
      \addcontentsline{toc}{chapter}{#2}%
    }%
  }{%
    \zjgsu@phantomsection
    \addcontentsline{toc}{chapter}{#3}%
  }%
  \ifzjgsu@degree@bachelor\ctexset{chapter/beforeskip=40pt}\fi
  \chapter*{#3}%
  \ifzjgsu@degree@bachelor\ctexset{chapter/beforeskip=30pt}\fi
  \IfValueTF{#4}{%
    \ifthenelse{\equal{#4}{}}{%
      \@mkboth{}{}%
    }{%
      \@mkboth{#4}{#4}%
    }%
  }{%
    \@mkboth{#3}{#3}%
  }%
}
\setcounter{secnumdepth}{3}
\setcounter{tocdepth}{2}
\renewcommand\tableofcontents{%
  \ifzjgsu@degree@graduate
    \zjgsu@chapter*{\contentsname}%
  \else
    \zjgsu@chapter*[]{\contentsname}%
  \fi
  \@starttoc{toc}%
}
\zjgsu@define@key{
  toc-chapter-style = {
    name = toc@chapter@style,
    choices = {
      arial,
      times,
    },
    default = arial,
  },
}
\newcommand\zjgsu@leaders{\titlerule*[4pt]{.}}
\newcommand\zjgsu@set@toc@format{%
  \contentsmargin{\z@}%
  \ifzjgsu@degree@bachelor
    \ifzjgsu@main@language@chinese
      \titlecontents{chapter}
        [\z@]{\addvspace{6pt}
          \ifzjgsu@toc@chapter@style@arial
            \sffamily
          \else
            \heiti
          \fi
        }
        {\contentspush{\thecontentslabel\quad}}{}
        {\rmfamily\zjgsu@leaders\thecontentspage}%
      \titlecontents{section}
        [1em]{}
        {\contentspush{\thecontentslabel\quad}}{}
        {\zjgsu@leaders\thecontentspage}%
      \titlecontents{subsection}
        [1.5em]{}
        {\contentspush{\thecontentslabel\quad}}{}
        {\zjgsu@leaders\thecontentspage}%
    \else
      \ifzjgsu@main@language@english
        \titlecontents{chapter}
          [\z@]{\addvspace{6pt}\sffamily}
          {\contentspush{\thecontentslabel\quad}}{}
          {\rmfamily\zjgsu@leaders\thecontentspage}%
        \titlecontents{section}
          [0.5cm]{}
          {\contentspush{\thecontentslabel\quad}}{}
          {\zjgsu@leaders\thecontentspage}%
        \titlecontents{subsection}
          [1cm]{}
          {\contentspush{\thecontentslabel\quad}}{}
          {\zjgsu@leaders\thecontentspage}%
      \fi
    \fi
  \else
    \ifzjgsu@main@language@chinese
      \titlecontents{chapter}
        [\z@]{\sffamily}
        {\contentspush{\thecontentslabel\quad}}{}
        {\rmfamily\zjgsu@leaders\thecontentspage}%
      \titlecontents{section}
        [2em]{}
        {\contentspush{\thecontentslabel\quad}}{}
        {\zjgsu@leaders\thecontentspage}%
      \titlecontents{subsection}
        [4em]{}
        {\contentspush{\thecontentslabel\quad}}{}
        {\zjgsu@leaders\thecontentspage}%
    \else
      \titlecontents{chapter}
        [\z@]{\heiti}
        {\contentspush{\MakeUppercase{\thecontentslabel}\space}\MakeUppercase}{\MakeUppercase}
        {\rmfamily\zjgsu@leaders\thecontentspage}%
      \titlecontents{section}
        [1em]{}
        {\contentspush{\thecontentslabel\space}}{}
        {\zjgsu@leaders\thecontentspage}%
      \titlecontents{subsection}
        [2em]{}
        {\contentspush{\thecontentslabel\space}}{}
        {\zjgsu@leaders\thecontentspage}%
    \fi
  \fi
}
\zjgsu@set@toc@format
\zjgsu@option@hook{degree}{\zjgsu@set@toc@format}
\zjgsu@option@hook{main-language}{\zjgsu@set@toc@format}
\zjgsu@define@key{
  secret-level = {
    name = secret@level,
  },
  secret-year = {
    name = secret@year,
  },
  title = {
    default = {标题},
  },
  title* = {
    default = {Title},
    name    = title@en,
  },
  author = {
    default = {姓名},
  },
  author* = {
    default = {Name of author},
    name    = author@en,
  },
  student-id = {
    name = student@id,
  },
  supervisor = {
    default = {导师姓名},
  },
  supervisor* = {
    default = {Name of supervisor},
    name    = supervisor@en,
  },
  associate-supervisor = {
    name = associate@supervisor,
  },
  associate-supervisor* = {
    name = associate@supervisor@en,
  },
  co-supervisor = {
    name = co@supervisor,
  },
  co-supervisor* = {
    name = co@supervisor@en,
  },
  % Reserved for compatibility
  joint-supervisor = {
    name = co@supervisor,
  },
  joint-supervisor* = {
    name = co@supervisor@en,
  },
  degree-category = {
    default = {工学博士},
    name    = degree@category,
  },
  degree-category* = {
    default = {Doctor of Philosophy},
    name    = degree@category@en,
  },
  % 为了向后兼容
  degree-name = {
    name    = degree@category,
  },
  degree-name* = {
    name    = degree@category@en,
  },
}
\zjgsu@option@hook{degree-name}{%
  \zjgsu@warning{`degree-name' is deprecated. Use `degree-category' instead.}
}
\zjgsu@option@hook{degree-name*}{%
  \zjgsu@warning{`degree-name*' is deprecated. Use `degree-category*' instead.}
}
\zjgsu@define@key{
  department = {
    default = {计算机科学与技术系},
  },
  discipline = {
    % default = {计算机科学与技术},
  },
  discipline* = {
    % default = {Computer Science and Technology},
    name    = discipline@en,
  },
}
\zjgsu@option@hook{discipline}{%
  \ifzjgsu@degree@type@professional
    \zjgsu@warning{`discipline' for professional degree is deprecated. Use `professional-field' instead.}
    \let\zjgsu@professional@field\zjgsu@discipline
    \let\zjgsu@discipline\@empty
  \fi
}
\zjgsu@option@hook{discipline*}{%
  \ifzjgsu@degree@type@professional
    \zjgsu@warning{`discipline*' for professional degree is deprecated. Use `professional-field*' instead.}
    \let\zjgsu@professional@field@en\zjgsu@discipline@en
    \let\zjgsu@discipline@en\@empty
  \fi
}
\zjgsu@define@key{
  professional-field = {
    name    = professional@field,
  },
  professional-field* = {
    name    = professional@field@en,
  },
  engineering-field = {
    name    = engineering@field,
  },
  engineering-field* = {
    name    = engineering@field@en,
  },
  date = {
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  clc,
  udc,
  id,
  discipline-level-1 = {
    default = {一级学科名称},
    name    = discipline@level@i,
  },
  discipline-level-2 = {
    default = {二级学科名称},
    name    = discipline@level@ii,
  },
  start-date = {
    name    = start@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  end-date = {
    name    = end@date,
    default = {\the\year-\two@digits{\month}-\two@digits{\day}},
  },
  include-spine = {
    name = include@spine,
    choices = {
      false,
      true,
    },
    default = false,
  },
}
\newcommand\zjgsu@format@date[2]{%
  \edef\zjgsu@@date{#2}%
  \def\zjgsu@@process@date##1-##2-##3\@nil{%
    #1{##1}{##2}{##3}%
  }%
  \expandafter\zjgsu@@process@date\zjgsu@@date\@nil
}
\newcommand\zjgsu@date@zh@digit[3]{#1 年 \number#2 月 \number#3 日}
\newcommand\zjgsu@date@zh@digit@short[3]{#1 年 \number#2 月}
\newcommand\zjgsu@date@zh@short[3]{\zhdigits{#1}年\zhnumber{#2}月}
\newcommand\zjgsu@date@month[1]{%
  \ifcase\number#1\or
    January\or February\or March\or April\or May\or June\or
    July\or August\or September\or October\or November\or December%
  \fi
}
\newcommand\zjgsu@date@en@short[3]{\zjgsu@date@month{#2}, #1}
\newcommand\zjgsu@underline[2][6em]{\hskip1pt\underline{\hb@xt@ #1{\hss#2\hss}}\hskip3pt}
\newcommand\zjgsu@uline[2][6em]{\uline{\hb@xt@ #1{\hss#2\hss}}}
\newcommand\zjgsu@fixed@box[2]{%
  \begingroup
    \ifLuaTeX
      \ltjsetparameter{kanjiskip = {0pt plus 2filll minus 1filll}}%
    \else
      \renewcommand\CJKglue{\hspace{0pt plus 2filll minus 1filll}}%
    \fi
    \makebox[#1][l]{#2}%
  \endgroup
}
\newbox\zjgsu@stretch@box
\newcommand\zjgsu@stretch[2]{%
  \sbox\zjgsu@stretch@box{#2}%
  \ifdim \wd\zjgsu@stretch@box < #1\relax
    \begingroup
      \ifLuaTeX
        \ltjsetparameter{kanjiskip = {0pt plus 2filll}}%
      \else
        \renewcommand\CJKglue{\hspace{0pt plus 2filll}}%
      \fi
      \makebox[#1][l]{#2}%
    \endgroup
  \else
    \box\zjgsu@stretch@box
  \fi
}
\newbox\zjgsu@pad@box
\newcommand\zjgsu@pad[2]{%
  \sbox\zjgsu@pad@box{#2}%
  \ifdim \wd\zjgsu@pad@box < #1\relax
    \makebox[#1][l]{\box\zjgsu@pad@box}%
  \else
    \box\zjgsu@pad@box
  \fi
}
\newcounter{zjgsu@csl@count}
\newcommand\zjgsu@name@title@process[1]{%
  \ifcase\c@zjgsu@csl@count  % == 0
    \gdef\zjgsu@@name{#1}%
  \or  % == 1
    \gdef\zjgsu@@title{#1}%
  \fi
  \stepcounter{zjgsu@csl@count}%
}
\newcommand\zjgsu@name@title@format[2]{%
  \zjgsu@pad{3cm}{\zjgsu@stretch{4em}{#1}}%
  \zjgsu@stretch{3em}{#2}%
}
\newcommand\zjgsu@name@title[1]{%
  \setcounter{zjgsu@csl@count}{0}%
  \gdef\zjgsu@@name{}%
  \gdef\zjgsu@@title{}%
  \expandafter\comma@parse\expandafter{#1}{\zjgsu@name@title@process}%
  \zjgsu@name@title@format{\zjgsu@@name}{\zjgsu@@title}%
}
\renewcommand\maketitle{%
  \cleardoublepage
  \pagenumbering{Alph}%
  \zjgsu@pdfbookmark{-1}{\zjgsu@title}%
  \zjgsu@titlepage
  \ifzjgsu@include@spine@true
    \spine
  \fi
  \ifzjgsu@degree@graduate
    \ifzjgsu@thesis@type@thesis
      \cleardoublepage
      \zjgsu@titlepage@en
    \fi
  \fi
  \clearpage
}
\newcommand\zjgsu@titlepage{%
  \zjgsusetup{language = chinese}%
  \ifzjgsu@degree@graduate
    % 研究生
    \ifzjgsu@thesis@type@thesis
      % 学位论文
      \zjgsu@titlepage@thesis
    \else
      \ifzjgsu@thesis@type@proposal
        % 选题报告
        \zjgsu@titlepage@proposal
      \fi
    \fi
  \else
    \ifzjgsu@degree@bachelor
      % 本科生
      \zjgsu@titlepage@bachelor
    \else
      \ifzjgsu@degree@postdoc
        % 博后
        \zjgsu@cover@postdoc
        \cleardoublepage
        \zjgsu@titlepage@postdoc
      \fi
    \fi
  \fi
  \zjgsu@reset@main@language
}
\newcommand\zjgsu@titlepage@thesis{%
  \newgeometry{
    top     = 2cm,
    bottom  = 6cm,
    hmargin = 3.5cm,
  }%
  \thispagestyle{empty}%
  \null\vskip 8.1pt%
  \begingroup
    \centering
    \parbox[t][2cm][t]{\textwidth}{%
      \hskip -21.5pt%
      \zjgsu@titlepage@secret
    }\par
    \vskip 40.5pt%
    \begingroup
      \sffamily\fontsize{26pt}{46.8pt}\selectfont
      \zjgsu@title\par
    \endgroup
    \ifzjgsu@main@language@english
      \vskip 5.4pt%
      \begingroup
        \sffamily\bfseries\fontsize{20pt}{31.2pt}\selectfont
        \zjgsu@title@en\par
      \endgroup
      \vskip -9.2pt%
    \fi
    \vskip 24.1pt%
    \zjgsu@title@page@degree@category\par
    \vfill
    \ifzjgsu@degree@type@academic
      \parbox[t][7.25cm][t]{\textwidth}{%
        \fangsong\fontsize{16pt}{31.2pt}\selectfont
        \zjgsu@titlepage@info
      }\par
    \else
      \parbox[t][5.25cm][b]{\textwidth}{%
        \fangsong\fontsize{16pt}{31.2pt}\selectfont
        \zjgsu@titlepage@info
      }\par
      \vskip 62pt%
    \fi
    \parbox[t][1.03cm][t]{\textwidth}{\centering\zjgsu@titlepage@date}\par
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\zjgsu@titlepage@proposal{%
  \newgeometry{
    top     = 5cm,
    bottom  = 3.25cm,
    hmargin = 3.17cm,
  }%
  \thispagestyle{empty}%
  \begingroup
    % \vspace*{0.1cm}%
    \centering
    % {\zjgsu@titlepage@title}%
    \parbox[t][3cm]{\textwidth}{%
      \vskip 0.1cm%
      \centering
      \sffamily\fontsize{26pt}{46.8pt}\selectfont
      \zjgsu@title\par
    }%
    \vskip 0.85cm%
    \zjgsu@title@page@degree@category
    \vfill
    \parbox[t][8.5cm][t]{\textwidth}{%
      \centering
      \fangsong
      \ifLuaTeX
        \fontspec{\CJK@family}%
      \else
        \CJKfamily+{}%
      \fi
      \sanhao[1.95]%
      \zjgsu@titlepage@info
    }\par
    \parbox[t][2.5cm][t]{\textwidth}{\centering\zjgsu@titlepage@date}\par
  \endgroup
  \clearpage
  \restoregeometry
}
\newcommand\zjgsu@set@student@id{%
  \ifzjgsu@thesis@type@proposal\else
    \ifx\zjgsu@student@id\@empty\else
      \zjgsu@warning{`student-id' in "\protect\zjgsusetup" would be ignored when `thesis-type' is not proposal.}%
    \fi
  \fi
}
\zjgsu@set@student@id
\zjgsu@option@hook{thesis-type}{\zjgsu@set@student@id}
\zjgsu@option@hook{student-id}{\zjgsu@set@student@id}
\newcommand\zjgsu@titlepage@secret{%
  \sffamily\sanhao
  \ifx\zjgsu@secret@level\@empty
    \phantom{秘密}%
  \else
    \zjgsu@secret@level\symbol{"2605}\makebox[3em][c]{\zjgsu@secret@year}年%
  \fi\par
}
\newcommand\zjgsu@title@page@degree@category{%
  \begingroup
    \fontsize{16pt}{22pt}\selectfont
    \ifLuaTeX
      \fontspec{\CJK@family}%
      \ltjsetparameter{kanjiskip = {1pt}}%
    \else
      \CJKfamily+{}%
      \renewcommand\CJKglue{\hspace{1pt}}%
    \fi
    \ifzjgsu@thesis@type@thesis
      (申请清华大学\zjgsu@degree@category
      \ifzjgsu@degree@type@professional
        专业%
      \fi
      学位论文)%
    \else
      \ifzjgsu@thesis@type@proposal
        (清华大学%
        \ifzjgsu@degree@doctor
          博士%
        \else
          \ifzjgsu@degree@master
            硕士%
          \fi
        \fi
        学位论文选题报告)%
      \fi
    \fi
    \par
  \endgroup
}
\newcommand\zjgsu@titlepage@info{%
  \zjgsu@titlepage@info@tabular{2.3cm}{2.85cm}{2.75cm}{0.77cm}{%
    \zjgsu@info@item{培养单位}{}{\zjgsu@department}%
    \ifzjgsu@degree@type@academic
      \zjgsu@info@item{学科}{}{\zjgsu@discipline}%
      \zjgsu@info@item{研究生}{\zjgsu@name@title}{\zjgsu@author}%
    \else
      \zjgsu@info@item{专业领域}{}{\zjgsu@professional@field}%
      \zjgsu@info@item{工程领域}{}{\zjgsu@engineering@field}%
      \zjgsu@info@item{申请人}{\zjgsu@name@title}{\zjgsu@author}%
    \fi
    \ifzjgsu@thesis@type@proposal
      \ifx\zjgsu@student@id\@empty
        \zjgsu@warning{Missing option `student-id' in "\protect\zjgsusetup", ID will not appear on cover.}
      \else
        \zjgsu@info@item{学号}{}{\zjgsu@student@id}%
      \fi
    \fi
    \zjgsu@info@item{指导教师}{\zjgsu@name@title}{\zjgsu@supervisor}%
    \zjgsu@info@item{副指导教师}{\zjgsu@name@title}{\zjgsu@associate@supervisor}%
    \zjgsu@info@item{联合指导教师}{\zjgsu@name@title}{\zjgsu@co@supervisor}%
  }\par
}
\newcommand\zjgsu@titlepage@info@tabular[5]{%
  \def\zjgsu@info@item##1##2##3{%
    \ifx##3\@empty\else
      \zjgsu@pad{#2}{\zjgsu@fixed@box{#3}{##1}}%
      \zjgsu@pad{#4}{：}%
      ##2{##3}\\
    \fi
  }%
  \hspace{#1}%
  \begin{tabular}{l}%
    \renewcommand\arraystretch{1}%
    #5%
  \end{tabular}%
}
\newcommand\zjgsu@titlepage@date{%
  \begingroup
    \sanhao
    \ifLuaTeX
      \ltjsetparameter{kanjiskip = {1pt}}%
    \else
      \renewcommand\CJKglue{\hspace{1pt}}%
    \fi
    \zjgsu@format@date{\zjgsu@date@zh@short}{\zjgsu@date}\par
  \endgroup
}
\newcommand{\zjgsu@titlepage@en}{%
  \newgeometry{
    top     = 5.5cm,
    bottom  = 5cm,
    hmargin = 3.4cm,
  }%
  \thispagestyle{empty}%
  \zjgsusetup{language = english}%
  \ifzjgsu@degree@type@academic
    \zjgsu@titlepage@en@graduate@academic
  \else
    \zjgsu@titlepage@en@graduate@professional
  \fi
  \zjgsu@reset@main@language
  \clearpage
  \restoregeometry
}
\newcommand\zjgsu@titlepage@en@graduate@academic{%
  \begingroup
    \centering
    \null\vskip -0.31cm%
    \parbox[t][143pt][t]{\textwidth}{%
      \centering\zjgsu@titlepage@en@title
    }\par
    \sanhao[1.725]%
    \zjgsu@titlepage@en@degree
    \vskip 3pt%
    in\par
    \vskip 3.5pt%
    {\bfseries\sffamily\zjgsu@discipline@en\par}
    \vfill
    {\sffamily by\par}
    \vskip 0.24cm%
    {\sffamily\bfseries\zjgsu@author@en\par}%
    \vskip 0.18cm%
    \parbox[t][3.0cm][t]{\textwidth}{%
      \centering
      \xiaosan[2.1]%
      \zjgsu@titlepage@en@supervisor
    }\par
    \zjgsu@titlepage@en@date
    \vskip 0.7cm%
  \endgroup
}
\newcommand\zjgsu@titlepage@en@graduate@professional{%
  \begingroup
    \centering
    \null\vskip -0.31cm%
    \parbox[t][143pt][t]{\textwidth}{%
      \centering\zjgsu@titlepage@en@title
    }\par
    \sanhao[1.725]%
    \zjgsu@titlepage@en@degree
    \vfill
    {\sffamily by\par}
    \vskip 0.24cm%
    {\sffamily\bfseries\zjgsu@author@en\par}%
    \ifx\zjgsu@professional@field@en\empty
      \vskip 1.95cm%
    \else
      \vskip -0.1cm%
      {\sffamily\bfseries(\zjgsu@professional@field@en)\par}%
      \vskip 1.1cm%
    \fi
    \parbox[t][3.37cm][t]{\textwidth}{%
      \centering
      \xiaosan[1.82]%
      \zjgsu@titlepage@en@supervisor
    }\par
    \zjgsu@titlepage@en@date
    \vskip 0.3cm%
  \endgroup
}
\newcommand\zjgsu@titlepage@en@title{%
  \begingroup
    % 对齐到网格，每行 15.6pt
    \sffamily\bfseries\fontsize{20pt}{31.2pt}\selectfont
    \zjgsu@title@en\par
  \endgroup
}
\newcommand\zjgsu@thesis@name@en{%
  \ifzjgsu@degree@master
    Thesis%
  \else
    Dissertation%
  \fi
}
\newcommand\zjgsu@titlepage@en@degree{%
  \zjgsu@thesis@name@en{} submitted to\par
  {\bfseries Tsinghua University\par}%
  in partial fulfillment of the requirement\par
  for the
  \ifzjgsu@degree@type@professional
    professional
  \fi
  degree of\par
  {\sffamily\bfseries\zjgsu@degree@category@en\par}%
}
\newcommand\zjgsu@titlepage@en@supervisor{%
  \begin{tabular}{r@{\makebox[20.5pt][l]{\hspace{2pt}:}}l}%
    \renewcommand\arraystretch{1}%
    \zjgsu@thesis@name@en{} Supervisor & \zjgsu@supervisor@en \\
    \ifx\zjgsu@associate@supervisor@en\@empty\else
      Associate Supervisor           & \zjgsu@associate@supervisor@en \\
    \fi
    \ifx\zjgsu@co@supervisor@en\@empty\else
      Co-supervisor                  & \zjgsu@co@supervisor@en \\
    \fi
  \end{tabular}%
}
\newcommand\zjgsu@titlepage@en@date{%
  \begingroup
    \sffamily\bfseries\sanhao
    \zjgsu@format@date{\zjgsu@date@en@short}{\zjgsu@date}\par
  \endgroup
}
\newcommand\zjgsu@titlepage@bachelor{%
  \newgeometry{
    vmargin = 2.54cm,
    hmargin = 3.17cm,
  }%
  \thispagestyle{empty}%
  \begingroup
    \centering
    \parbox[t][0cm][t]{\textwidth}{%
      \hfill
      \xiaosi
      \ifx\zjgsu@secret@level\@empty\else
        \zjgsu@secret@level\space\zjgsu@secret@year 年\par
      \fi
    }%
  \endgroup
  \vfill
  \begingroup
    \centering
    \includegraphics{tsinghua-name-bachelor.pdf}%
    \vskip 0.94cm%
    \ifzjgsu@thesis@type@proposal
      {\sffamily\bfseries\xiaochu\ziju{0.5}综合论文训练\\开题报告\par}%
    \else
      {\sffamily\bfseries\xiaochu\ziju{0.5}综合论文训练\par}%
    \fi
  \endgroup
  \vskip 1.8cm%
  \begingroup
    \heiti
    % 21.0cm - 0.2cm - 3cm * 2 - 18pt * 4 = 347pt
    \noindent\hspace{1em}\makebox[54pt]{\xiaoer[1.2]题目：}%
    \parbox[t]{347pt}{%
      \ifzjgsu@main@language@chinese
        \yihao[1.56]%
      \else
        \fontsize{26pt}{32pt}\selectfont
      \fi
      \renewcommand\ULthickness{0.05em}%
      \renewcommand\ULdepth{0.17em}%
      \expandafter\uline\expandafter{\zjgsu@title}\par
      \ifzjgsu@main@language@english
        \zjgsusetup{language=english}%
        \expandafter\uline\expandafter{\zjgsu@title@en}\par
        \zjgsusetup{language=chinese}%
      \fi
    }\par
  \endgroup
  \vskip 1.9cm%
  \begingroup
    \fangsong\sanhao[2.32]%
    \leftskip=2.5cm%
    \parindent=\z@
    \def\zjgsu@info@item##1##2##3{%
      \ifx##3\@empty\else
        \zjgsu@fixed@box{%
          \ifx\zjgsu@co@supervisor\@empty
            4em%
          \else
            5.5em%
          \fi
        }{##1}：##2{##3}\par
      \fi
    }%
    \def\zjgsu@name@title@format##1##2{%
      \zjgsu@stretch{3em}{##1}\quad ##2%
    }%
    \zjgsu@info@item{系别}{}{\zjgsu@department}%
    \zjgsu@info@item{专业}{}{\zjgsu@discipline}%
    \zjgsu@info@item{姓名}{\zjgsu@name@title}{\zjgsu@author}%
    \zjgsu@info@item{指导教师}{\zjgsu@name@title}{\zjgsu@supervisor}%
    \zjgsu@info@item{辅导教师}{\zjgsu@name@title}{\zjgsu@associate@supervisor}%
    \zjgsu@info@item{联合指导教师}{\zjgsu@name@title}{\zjgsu@co@supervisor}%
  \endgroup
  \vskip 1.4cm%
  \begingroup
    \centering
    \ifLuaTeX
      \fontspec{\CJK@family}%
    \else
      \CJKfamily+{}%
    \fi
    \xiaosi\zjgsu@format@date{\zjgsu@date@zh@digit}{\zjgsu@date}\par
  \endgroup
  \vfill
  \clearpage
  \restoregeometry
}
\newcommand\zjgsu@cover@postdoc{%
  \thispagestyle{empty}%
  \begin{center}%
    \renewcommand\ULthickness{0.7pt}%
    \vspace*{0.35cm}%
    {\sihao[2.6]%
      \zjgsu@stretch{3.1em}{分类号}\zjgsu@underline[3.7cm]{\zjgsu@clc}\hfill
      密级\zjgsu@underline[3.7cm]{\zjgsu@secret@level}\par
      \zjgsu@stretch{3.1em}{U D C}\zjgsu@underline[3.7cm]{\zjgsu@udc}\hfill
      编号\zjgsu@underline[3.7cm]{\zjgsu@id}\par
    }%
    \vskip 3.15cm%
    {\sffamily\bfseries\xiaoer[2.6]%
      {\ziju{1.5}清华大学\par}%
      {\ziju{0.5}博士后研究工作报告\par}%
    }%
    \vskip 0.2cm%
    \parbox[t][4.0cm][c]{\textwidth}{%
      \centering\sihao[3.46]%
      \renewcommand\ULdepth{1em}%
      \expandafter\uline\expandafter{\zjgsu@title}\par
    }\par
    \vskip 0.4cm%
    {\xiaosi\zjgsu@author\par}%
    \vskip 1.4cm%
    {\xiaosi[1.58]%
      \renewcommand\ULdepth{0.9em}%
      工作完成日期\quad
      \zjgsu@uline[5.9cm]{%
        \zjgsu@format@date{\zjgsu@date@zh@digit@short}{\zjgsu@start@date}—%
        \zjgsu@format@date{\zjgsu@date@zh@digit@short}{\zjgsu@end@date}
      }\par
      \vskip 0.55cm%
      报告提交日期\quad
      \zjgsu@uline[5.9cm]{\zjgsu@format@date{\zjgsu@date@zh@digit@short}{\zjgsu@date}}\par
    }%
    \vskip 0.45cm%
    {\xiaosi[2]{\ziju{1}清华大学}\quad （北京）\par}%
    \vskip 0.25cm%
    {\xiaosi[2]\zjgsu@format@date{\zjgsu@date@zh@digit@short}{\zjgsu@date}\par}%
  \end{center}%
}
\newcommand\zjgsu@titlepage@postdoc{%
  \thispagestyle{empty}%
  \begin{center}%
    \vspace*{1.5cm}%
    \parbox[t][3cm][c]{\textwidth}{%
      \centering\sanhao[1.95]\zjgsu@title\par
    }\par
    \vskip 0.15cm%
    \parbox[t][3cm][c]{\textwidth}{%
      \centering\sihao[1.36]\zjgsu@title@en\par
    }\par
    \vskip 0.4cm%
    {\xiaosi[2.6]%
      \begin{tabular}{l@{\quad}l}%
        \renewcommand\arraystretch{1}%
        \zjgsu@stretch{11em}{博士后姓名}                  & \zjgsu@author           \\
        \zjgsu@stretch{11em}{流动站（一级学科）名称}      & \zjgsu@discipline@level@i  \\
        \zjgsu@stretch{11em}{专\quad{}业（二级学科）名称} & \zjgsu@discipline@level@ii \\
      \end{tabular}\par
    }%
    \vskip 2.7cm%
    {\xiaosi[2.6]%
      研究工作起始时间\quad\zjgsu@format@date{\zjgsu@date@zh@digit}{\zjgsu@start@date}\par
      \vskip 0.1cm%
      研究工作期满时间\quad\zjgsu@format@date{\zjgsu@date@zh@digit}{\zjgsu@end@date}\par
    }%
    \vskip 2.1cm%
    {\xiaosi[2.6]清华大学人事处（北京）\par}%
    \vskip 0.6cm%
    {\wuhao\zjgsu@format@date{\zjgsu@date@zh@digit@short}{\zjgsu@date}\par}%
  \end{center}%
}
\def\zjgsu@committee@name{学位论文指导小组、公开评阅人和答辩委员会名单}
\NewEnviron{committee}[1][]{%
  \ifzjgsu@degree@graduate
    \cleardoublepage
    \let\zjgsu@committee@file\@empty
    \kv@define@key{zjgsu@committee}{name}{\let\zjgsu@committee@name\kv@value}%
    \kv@define@key{zjgsu@committee}{file}{\let\zjgsu@committee@file\kv@value}%
    \kv@set@family@handler{zjgsu@committee}{%
      \ifx\kv@value\relax
        \let\zjgsu@committee@file\kv@key
      \else
        \kv@handled@false
      \fi
    }%
    \kvsetkeys{zjgsu@committee}{#1}%
    \ifx\zjgsu@committee@file\@empty
      \begingroup
        \ctexset{
          chapter = {
            format    = \centering\sffamily\fontsize{16pt}{20pt}\selectfont,
            afterskip = 49pt,
          },
          section = {
            beforeskip  =  26pt,
            afterskip   =  9.5pt,
            format      += \centering,
            numbering   =  false,
            afterindent =  false,
          },
        }%
        \zjgsu@chapter*[]{\zjgsu@committee@name}%
        \thispagestyle{empty}%
        \zjgsusetup{language=chinese}%
        \BODY\clearpage
        \zjgsu@reset@main@language
      \endgroup
    \else
      \zjgsu@pdfbookmark{0}{\zjgsu@committee@name}%
      \includepdf{\zjgsu@committee@file}%
    \fi
  \fi
}
\newcommand\copyrightpage[1][]{%
  \cleardoublepage
  \ifzjgsu@degree@postdoc\relax\else
    \def\zjgsu@@tmp{#1}
    \ifx\zjgsu@@tmp\@empty
      \zjgsusetup{language=chinese}%
      \ifzjgsu@degree@bachelor
        \zjgsu@copyright@page@bachelor
      \else
        \zjgsu@copyright@page@graduate
      \fi
      \zjgsu@reset@main@language
    \else
      \thispagestyle{empty}%
      \zjgsu@pdfbookmark{0}{关于学位论文使用授权的说明}%
      \zjgsu@phantomsection
      \kv@define@key{zjgsu@copyright}{file}{\includepdf{\kv@value}}%
      \kv@set@family@handler{zjgsu@copyright}{%
        \ifx\kv@value\relax
          \includepdf{\kv@key}%
        \else
          \kv@handled@false
        \fi
      }%
      \kvsetkeys{zjgsu@copyright}{#1}%
    \fi
  \fi
}
\newcommand{\zjgsu@authorization@frontdate}{%
  日\ifzjgsu@degree@bachelor\hspace{1em}\else\hspace{2em}\fi 期：}
\newcommand\zjgsu@copyright@page@graduate{%
  \begingroup
    \ctexset{
      chapter = {
        format     = {\centering\sffamily\erhao},
        beforeskip = 40pt,
        afterskip  = 36pt,
      },
    }%
    \zjgsu@chapter*[]{关于学位论文使用授权的说明}%
    \thispagestyle{empty}%
  \endgroup
  \vskip 13pt%
  \begingroup
    \fontsize{14pt}{26pt}\selectfont
    本人完全了解清华大学有关保留、使用学位论文的规定，即：\par
    清华大学拥有在著作权法规定范围内学位论文的使用权，其中包括：%
    （1）\nobreak 已获学位的研究生必须按学校规定提交学位论文，%
    学校可以采用影印、缩印或其他复制手段保存研究生上交的学位论文；\allowbreak
    （2）\nobreak 为教学和科研目的，学校可以将公开的学位论文作为资料在图书馆、资料室等场所供校内师生阅读，%
    或在校园网上供校内师生浏览部分内容；\allowbreak
    \ifzjgsu@degree@doctor
      （3）\nobreak 根据《中华人民共和国学位条例暂行实施办法》及上级教育主管部门具体要求，向国家图书馆报送相应的学位论文。%
    \else
      （3）\nobreak 按照上级教育主管部门督导、抽查等要求，报送相应的学位论文。%
    \fi
    \par
    本人保证遵守上述规定。\par
  \endgroup
  \vskip 33pt%
  \begingroup
    \fontsize{12pt}{23.4pt}\selectfont
    \parindent\z@
    \leftskip 43pt%
    作者签名：\hspace{4pt}\zjgsu@underline[7em]{}\hspace{47pt}%
    导师签名：\hspace{4pt}\zjgsu@underline[7em]{}\par
    \vskip 6pt%
    日\hspace{2em}期：\hspace{4pt}\zjgsu@underline[7em]{}\hspace{47pt}%
    日\hspace{2em}期：\hspace{4pt}\zjgsu@underline[7em]{}\par
  \endgroup
}
\newcommand\zjgsu@copyright@page@bachelor{%
  \begingroup
    \ctexset{
      chapter = {
        format     = {\centering\sffamily\erhao[1]},
        beforeskip = 1pt,
        afterskip  = 24pt,
      },
    }%
    \zjgsu@chapter*[]{关于学位论文使用授权的说明}%
    \thispagestyle{empty}%
  \endgroup
  \vskip 4pt%
  本人完全了解清华大学有关保留、使用学位论文的规定，即：%
  学校有权保留学位论文的复印件，允许该论文被查阅和借阅；%
  学校可以公布该论文的全部或部分内容，可以采用影印、缩印或其他复制手段保存该论文。\par
  \textbf{(涉密的学位论文在解密后应遵守此规定)}\par
  \null\par
  \begingroup
    \centering
    签\quad 名：\zjgsu@underline[6em]{}%
    导师签名：\zjgsu@underline[6em]{}%
    日\quad 期：\zjgsu@underline[6em]{}%
    \par
  \endgroup
}
\zjgsu@define@key{
  keywords,
  keywords* = {
    name = keywords@en,
  },
}
\newcommand\zjgsu@clist@use[2]{%
  \def\zjgsu@@tmp{}%
  \def\zjgsu@clist@processor##1{%
    \ifx\zjgsu@@tmp\@empty
      \def\zjgsu@@tmp{#2}%
    \else
      #2%
    \fi
    ##1%
  }%
  \expandafter\comma@parse\expandafter{#1}{\zjgsu@clist@processor}%
}
\newenvironment{abstract}{%
  \ifzjgsu@degree@bachelor
    \cleardoublepage
  \fi
  \zjgsusetup{language = chinese}%
  \ifzjgsu@degree@graduate
    \begingroup
      \ifzjgsu@main@language@english
        \ctexset{%
          chapter/format = \centering\heiti\sanhao\textbf,
        }%
      \fi
      \zjgsu@chapter*{\textbf{\zjgsu@abstract@name}}%
%      \addcontentsline{toc}{chapter}{\zjgsu@abstract@name}
    \endgroup
  \else
    \zjgsu@chapter*[]{\zjgsu@abstract@name}%
  \fi
}{%
  \par
  \null\xiaosi\songti\par
  \ifzjgsu@degree@graduate
    \noindent
    \textbf{关键词：}%
  \else
    \textbf{关键词：}%
  \fi
  \zjgsu@clist@use{\zjgsu@keywords}{；}%
  \gdef\zjgsu@keywords{}%
  \ifzjgsu@degree@bachelor
    \cleardoublepage
  \fi
  \zjgsu@reset@main@language % switch back to main language
}
\newenvironment{abstract*}{%
  \ifzjgsu@degree@bachelor
    \cleardoublepage
  \fi
  \zjgsusetup{language = english}%
  \ifzjgsu@degree@graduate
    \zjgsu@chapter*{\textbf{\zjgsu@abstract@name@en}}%
  \else
    \zjgsu@chapter*[]{\zjgsu@abstract@name@en}%
  \fi
}{%
  \par
  \null\par
  \ifzjgsu@degree@graduate
    \noindent
  \fi
  \textbf{Keywords:}\space
  \zjgsu@clist@use{\zjgsu@keywords@en}{; }%
  \ifzjgsu@degree@graduate
    \vspace*{\stretch{1}}%
  \fi
  \ifzjgsu@degree@bachelor
    \cleardoublepage
  \fi
  \zjgsu@reset@main@language % switch back to main language
}
\newenvironment{denotation}[1][2.5cm]{%
  \ifzjgsu@degree@bachelor
    \cleardoublepage
  \fi
  \ifzjgsu@degree@graduate
    \zjgsu@chapter*{\zjgsu@denotation@name}%
  \else
    \zjgsu@chapter*[]{\zjgsu@denotation@name}%
  \fi
  \vskip-30pt\xiaosi[1.6]\begin{zjgsu@denotation}[labelwidth=#1]
}{%
  \end{zjgsu@denotation}
}
\newlist{zjgsu@denotation}{description}{1}
\setlist[zjgsu@denotation]{%
  nosep,
  font=\normalfont,
  align=left,
  leftmargin=!, % sum of the following 3 lengths
  labelindent=0pt,
  labelwidth=2.5cm,
  labelsep*=0.5cm,
  itemindent=0pt,
}
\newcommand{\zjgsu@statement@text}{本人声明所呈交的学位论文是本人在导师指导下进行的研究工作及取得的研究成果。尽我所知，除了文中特别加以标注和致谢的地方外，论文中不包含其他人已经发表或撰写过的研究成果，也不包含本人为获得浙江工商大学或其它教育机构的学位或证书而使用过的材料。与我一同工作的同志对本研究所做的任何贡献均已在论文中作了明确的说明并表示谢意。}
\newcommand{\zjgsu@signature}{\noindent 签\hspace{1em}名：}
\newcommand{\zjgsu@backdate}{日\hspace{1em}期：}



\newenvironment{acknowledgements}{%
  \@mainmatterfalse
  \zjgsu@end@appendix@ref@section
  \ifzjgsu@degree@bachelor
    \cleardoublepage
  \fi
  \zjgsu@chapter*{\zjgsu@acknowledgements@name}%
}{%
  \ifzjgsu@degree@bachelor
    \cleardoublepage
  \fi
}
\zjgsu@define@key{
  statement-page-style = {
    name = statement@page@style,
    choices = {
      auto,
      empty,
      plain,
    },
    default = auto,
  },
  statement-page-number = {
    name = statement@page@number,
    choices = {
      false,
      true,
    },
    default = false,
  },
}
\zjgsu@option@hook{statement-page-number}{%
  \ifzjgsu@statement@page@number@false
    \zjgsusetup{statement-page-style=empty}%
  \else
    \zjgsusetup{statement-page-style=plain}%
  \fi
  \zjgsu@warning{%
    The "statement-page-number" option is deprecated.
    Use "page-style" option of \protect\statement command instead%
  }%
}
\newif\ifzjgsu@statement@exists
\newcommand\statement[1][]{%
  \@mainmatterfalse
  \zjgsu@end@appendix@ref@section
  \zjgsu@statement@existstrue
  \ifzjgsu@degree@bachelor
    \cleardoublepage
    \def\zjgsu@statement@name{独\hspace{2em}创\hspace{2em}性\hspace{2em}声\hspace{2em}明}%
  \else
    \def\zjgsu@statement@name{独\hspace{2em}创\hspace{2em}性\hspace{2em}声\hspace{2em}明}%
  \fi
  \let\zjgsu@statement@file\@empty
  \kv@define@key{zjgsu@statement}{page-style}{\zjgsusetup{statement-page-style=##1}}%
  \kv@define@key{zjgsu@statement}{file}{\let\zjgsu@statement@file\kv@value}%
  \kv@set@family@handler{zjgsu@statement}{%
    \ifx\kv@value\relax
      \let\zjgsu@statement@file\kv@key
    \else
      \kv@handled@false
    \fi
  }%
  \kvsetkeys{zjgsu@statement}{#1}%
  \ifzjgsu@statement@page@style@auto
    \ifx\zjgsu@statement@file\@empty
      \ifzjgsu@degree@bachelor
        \zjgsusetup{statement-page-style = empty}%
      \else
        \zjgsusetup{statement-page-style = plain}%
      \fi
    \else
      \ifzjgsu@degree@bachelor
        \zjgsusetup{statement-page-style = plain}%
      \else
        \zjgsusetup{statement-page-style = empty}%
      \fi
    \fi
  \fi
  \ifx\zjgsu@statement@file\@empty
    \zjgsusetup{language=chinese}%
    \begingroup
      \ifzjgsu@degree@graduate
        \ifzjgsu@main@language@english
          \ctexset{%
            chapter/format = \centering\sffamily\fontsize{16pt}{20pt}\selectfont,
          }%
        \fi
      \fi
      \zjgsu@chapter*{\zjgsu@statement@name}%
    \endgroup
    \thispagestyle{\zjgsu@statement@page@style}%
    \zjgsu@statement@text\par
    \ifzjgsu@degree@graduate
      \vskip 2cm%
    \else
      \null\par
    \fi
    {\hfill\zjgsu@signature\zjgsu@underline[2.5cm]\relax
      \zjgsu@backdate\zjgsu@underline[2.5cm]\relax}%
    \zjgsu@reset@main@language
  \else
    \includepdf[pagecommand={%
      \markboth{\zjgsu@statement@name}{}%
      \zjgsu@phantomsection
      \addcontentsline{toc}{chapter}{\zjgsu@statement@name}%
      \thispagestyle{\zjgsu@statement@page@style}%
    }]{\zjgsu@statement@file}%
  \fi
  \ifzjgsu@degree@bachelor
    \cleardoublepage
  \fi
}
\let\acknowledgement\acknowledgements
\let\endacknowledgement\endacknowledgements
\def\zjgsu@listof#1{% #1: float type
  \setcounter{tocdepth}{2} % restore tocdepth in case being modified
  \@ifstar
    {\zjgsu@chapter*[]{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}
    {\zjgsu@chapter*{\csname list#1name\endcsname}\@starttoc{\csname ext@#1\endcsname}}%
}
\renewcommand\listoffigures{%
  \ifzjgsu@degree@bachelor
    \ifzjgsu@backmatter\else
      \zjgsu@warning{The list of figures should be placed in back matter}%
    \fi
  \fi
  \zjgsu@listof{figure}%
}
\titlecontents{figure}
  [\z@]{}
  {\contentspush{\figurename~\thecontentslabel\quad}}{}
  {\nobreak\zjgsu@leaders\nobreak\hfil\thecontentspage}
\renewcommand\listoftables{%
  \ifzjgsu@degree@bachelor
    \ifzjgsu@backmatter\else
      \zjgsu@warning{The list of tables should be placed in back matter}%
    \fi
  \fi
  \zjgsu@listof{table}%
}
\titlecontents{table}
  [\z@]{}
  {\contentspush{\tablename~\thecontentslabel\quad}}{}
  {\zjgsu@leaders\thecontentspage}
\newcommand\listoffiguresandtables{%
  \ifzjgsu@degree@bachelor
    \zjgsu@warning{The list of figures and tables are for graduates only}%
    \listoffigures
    \listoftables
  \else
    \zjgsu@chapter*{\zjgsu@list@figure@table@name}%
    \@starttoc{lof}%
    \par
    \null\par
    \@starttoc{lot}%
  \fi
}
\def\ext@equation{loe}
\def\equcaption#1{%
  \addcontentsline{\ext@equation}{equation}%
                  {\protect\numberline{#1}}}
\newcommand\listofequations{\zjgsu@listof{equation}}
\titlecontents{equation}
  [0pt]{\addvspace{6pt}}
  {\zjgsu@equation@name~\thecontentslabel}{}
  {\nobreak\zjgsu@leaders\nobreak\thecontentspage}
\contentsuse{equation}{loe}
\zjgsu@define@key{
  cite-style = {
    name = cite@style,
    choices = {
      super,
      inline,
      author-year,
    }
  }
}
\def\bibliographystyle#1{%
  \gdef\bu@bibstyle{#1}%
  \ifx\@begindocumenthook\@undefined\else
    \expandafter\AtBeginDocument
  \fi
    {\if@filesw
       \immediate\write\@auxout{\string\bibstyle{#1}}%
       \immediate\write\@auxout{\string\gdef\string\bu@bibstyle{#1}}%
     \fi}%
}
\def\bibliography#1{%
  \if@filesw
    \immediate\write\@auxout{\string\bibdata{\zap@space#1 \@empty}}%
    \immediate\write\@auxout{\string\gdef\string\bu@bibdata{#1}}%
  \fi
  \gdef\bu@bibdata{#1}%
  \@input@{\jobname.bbl}}
\PassOptionsToPackage{compress}{natbib}
\AtEndOfPackageFile*{natbib}{
  \DeclareRobustCommand\inlinecite{\@inlinecite}
  \def\@inlinecite#1{\begingroup\let\@cite\NAT@citenum\citep{#1}\endgroup}
  %\let\onlinecite\inlinecite
  \newcommand\bibstyle@super{%
    \bibpunct{[}{]}{,}{s}{,}{\textsuperscript{,}}}
  \newcommand\bibstyle@inline{%
    \bibpunct{[}{]}{,}{n}{,}{,}}
  \@namedef{bibstyle@author-year}{%
    \bibpunct{(}{)}{;}{a}{,}{,}}
  \zjgsu@option@hook{cite-style}{\@nameuse{bibstyle@\zjgsu@cite@style}}
  \@namedef{bibstyle@zjgsuthesis-numeric}{\citestyle{super}}
  \@namedef{bibstyle@zjgsuthesis-author-year}{\citestyle{author-year}}
  \@namedef{bibstyle@cell}{\citestyle{author-year}}
  \@namedef{bibstyle@zjgsuthesis-bachelor}{\citestyle{super}}
  \renewcommand\NAT@citesuper[3]{%
    \ifNAT@swa
      \if*#2*\else
        #2\NAT@spacechar
      \fi
      % \unskip\kern\p@\textsuperscript{\NAT@@open#1\NAT@@close}%
      %  \if*#3*\else\NAT@spacechar#3\fi\else #1\fi\endgroup}
      \unskip\kern\p@
      \textsuperscript{%
        \NAT@@open#1\NAT@@close
        \if*#3*\else#3\fi
      }%
      \kern\p@
    \else
      #1%
    \fi
    \endgroup
  }
  \renewcommand\NAT@citenum[3]{%
    \ifNAT@swa
      \NAT@@open
      \if*#2*\else
        #2\NAT@spacechar
      \fi
      % #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close
      #1\NAT@@close
      \if*#3*\else
        \textsuperscript{#3}%
      \fi
    \else
      #1%
    \fi
    \endgroup
  }
  \def\NAT@citexnum[#1][#2]#3{%
    \NAT@reset@parser
    \NAT@sort@cites{#3}%
    \NAT@reset@citea
    \@cite{\def\NAT@num{-1}\let\NAT@last@yr\relax\let\NAT@nm\@empty
      \@for\@citeb:=\NAT@cite@list\do
      {\@safe@activestrue
      \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
      \@safe@activesfalse
      \@ifundefined{b@\@citeb\@extra@b@citeb}{%
        {\reset@font\bfseries?}
          \NAT@citeundefined\PackageWarning{natbib}%
        {Citation `\@citeb' on page \thepage \space undefined}}%
      {\let\NAT@last@num\NAT@num\let\NAT@last@nm\NAT@nm
        \NAT@parse{\@citeb}%
        \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
          \let\NAT@name=\NAT@all@names
          \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
        \fi
        \ifNAT@full\let\NAT@nm\NAT@all@names\else
          \let\NAT@nm\NAT@name\fi
        \ifNAT@swa
        \@ifnum{\NAT@ctype>\@ne}{%
          \@citea
          \NAT@hyper@{\@ifnum{\NAT@ctype=\tw@}{\NAT@test{\NAT@ctype}}{\NAT@alias}}%
        }{%
          \@ifnum{\NAT@cmprs>\z@}{%
          \NAT@ifcat@num\NAT@num
            {\let\NAT@nm=\NAT@num}%
            {\def\NAT@nm{-2}}%
          \NAT@ifcat@num\NAT@last@num
            {\@tempcnta=\NAT@last@num\relax}%
            {\@tempcnta\m@ne}%
          \@ifnum{\NAT@nm=\@tempcnta}{%
            \@ifnum{\NAT@merge>\@ne}{}{\NAT@last@yr@mbox}%
          }{%
            \advance\@tempcnta by\@ne
            \@ifnum{\NAT@nm=\@tempcnta}{%
              % \ifx\NAT@last@yr\relax
              %   \def@NAT@last@yr{\@citea}%
              % \else
              %   \def@NAT@last@yr{--\NAT@penalty}%
              % \fi
              \def@NAT@last@yr{-\NAT@penalty}%
            }{%
              \NAT@last@yr@mbox
            }%
          }%
          }{%
          \@tempswatrue
          \@ifnum{\NAT@merge>\@ne}{\@ifnum{\NAT@last@num=\NAT@num\relax}{\@tempswafalse}{}}{}%
          \if@tempswa\NAT@citea@mbox\fi
          }%
        }%
        \NAT@def@citea
        \else
          \ifcase\NAT@ctype
            \ifx\NAT@last@nm\NAT@nm \NAT@yrsep\NAT@penalty\NAT@space\else
              \@citea \NAT@test{\@ne}\NAT@spacechar\NAT@mbox{\NAT@super@kern\NAT@@open}%
            \fi
            \if*#1*\else#1\NAT@spacechar\fi
            \NAT@mbox{\NAT@hyper@{{\citenumfont{\NAT@num}}}}%
            \NAT@def@citea@box
          \or
            \NAT@hyper@citea@space{\NAT@test{\NAT@ctype}}%
          \or
            \NAT@hyper@citea@space{\NAT@test{\NAT@ctype}}%
          \or
            \NAT@hyper@citea@space\NAT@alias
          \fi
        \fi
      }%
      }%
        \@ifnum{\NAT@cmprs>\z@}{\NAT@last@yr}{}%
        \ifNAT@swa\else
          % \@ifnum{\NAT@ctype=\z@}{%
          %   \if*#2*\else\NAT@cmt#2\fi
          % }{}%
          \NAT@mbox{\NAT@@close}%
          \@ifnum{\NAT@ctype=\z@}{%
            \if*#2*\else
              \textsuperscript{#2}%
            \fi
          }{}%
          \NAT@super@kern
        \fi
    }{#1}{#2}%
  }%
  \renewcommand\NAT@cite%
      [3]{\ifNAT@swa\NAT@@open\if*#2*\else#2\NAT@spacechar\fi
          % #1\if*#3*\else\NAT@cmt#3\fi\NAT@@close\else#1\fi\endgroup}
          #1\NAT@@close\if*#3*\else\textsuperscript{#3}\fi\else#1\fi\endgroup}
  \def\NAT@citex%
    [#1][#2]#3{%
    \NAT@reset@parser
    \NAT@sort@cites{#3}%
    \NAT@reset@citea
    \@cite{\let\NAT@nm\@empty\let\NAT@year\@empty
      \@for\@citeb:=\NAT@cite@list\do
      {\@safe@activestrue
      \edef\@citeb{\expandafter\@firstofone\@citeb\@empty}%
      \@safe@activesfalse
      \@ifundefined{b@\@citeb\@extra@b@citeb}{\@citea%
        {\reset@font\bfseries ?}\NAT@citeundefined
                  \PackageWarning{natbib}%
        {Citation `\@citeb' on page \thepage \space undefined}\def\NAT@date{}}%
      {\let\NAT@last@nm=\NAT@nm\let\NAT@last@yr=\NAT@year
        \NAT@parse{\@citeb}%
        \ifNAT@longnames\@ifundefined{bv@\@citeb\@extra@b@citeb}{%
          \let\NAT@name=\NAT@all@names
          \global\@namedef{bv@\@citeb\@extra@b@citeb}{}}{}%
        \fi
      \ifNAT@full\let\NAT@nm\NAT@all@names\else
        \let\NAT@nm\NAT@name\fi
      \ifNAT@swa\ifcase\NAT@ctype
        \if\relax\NAT@date\relax
          \@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}\NAT@date}%
        \else
          \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
              \ifx\NAT@last@yr\NAT@year
                \def\NAT@temp{{?}}%
                \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
                {Multiple citation on page \thepage: same authors and
                year\MessageBreak without distinguishing extra
                letter,\MessageBreak appears as question mark}\fi
                \NAT@hyper@{\NAT@exlab}%
              \else\unskip\NAT@spacechar
                \NAT@hyper@{\NAT@date}%
              \fi
          \else
            \@citea\NAT@hyper@{%
              \NAT@nmfmt{\NAT@nm}%
              \hyper@natlinkbreak{%
                \NAT@aysep\NAT@spacechar}{\@citeb\@extra@b@citeb
              }%
              \NAT@date
            }%
          \fi
        \fi
      \or\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
      \or\@citea\NAT@hyper@{\NAT@date}%
      \or\@citea\NAT@hyper@{\NAT@alias}%
      \fi \NAT@def@citea
      \else
        \ifcase\NAT@ctype
          \if\relax\NAT@date\relax
            \@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
          \else
          \ifx\NAT@last@nm\NAT@nm\NAT@yrsep
              \ifx\NAT@last@yr\NAT@year
                \def\NAT@temp{{?}}%
                \ifx\NAT@temp\NAT@exlab\PackageWarningNoLine{natbib}%
                {Multiple citation on page \thepage: same authors and
                year\MessageBreak without distinguishing extra
                letter,\MessageBreak appears as question mark}\fi
                \NAT@hyper@{\NAT@exlab}%
              \else
                \unskip\NAT@spacechar
                \NAT@hyper@{\NAT@date}%
              \fi
          \else
            \@citea\NAT@hyper@{%
              \NAT@nmfmt{\NAT@nm}%
              \hyper@natlinkbreak{\NAT@spacechar\NAT@@open\if*#1*\else#1\NAT@spacechar\fi}%
                {\@citeb\@extra@b@citeb}%
              \NAT@date
            }%
          \fi
          \fi
        \or\@citea\NAT@hyper@{\NAT@nmfmt{\NAT@nm}}%
        \or\@citea\NAT@hyper@{\NAT@date}%
        \or\@citea\NAT@hyper@{\NAT@alias}%
        \fi
        \if\relax\NAT@date\relax
          \NAT@def@citea
        \else
          \NAT@def@citea@close
        \fi
      \fi
      }}\ifNAT@swa\else
        % \if*#2*\else\NAT@cmt#2\fi
        \if\relax\NAT@date\relax\else\NAT@@close\fi
        \if*#2*\else\textsuperscript{#2}\fi
      \fi}{#1}{#2}}
  \renewcommand\bibsection{\zjgsu@chapter*{\bibname}}
  \newcommand\zjgsu@set@bibliography@format{%
    \ifzjgsu@degree@bachelor
      \renewcommand\bibfont{\fontsize{10.5pt}{17pt}\selectfont}%
      \setlength{\bibsep}{6pt \@plus 3pt \@minus 3pt}%
      \ifzjgsu@main@language@chinese
        \setlength{\bibhang}{21pt}%
      \else
        \setlength{\bibhang}{0.5in}%
      \fi
    \else
      \renewcommand\bibfont{\fontsize{10.5pt}{16pt}\selectfont}%
      \setlength{\bibsep}{3pt \@plus 3pt \@minus 3pt}%
      \setlength{\bibhang}{21pt}%
    \fi
  }
  \zjgsu@set@bibliography@format
  \zjgsu@option@hook{degree}{\zjgsu@set@bibliography@format}
  \zjgsu@option@hook{main-language}{\zjgsu@set@bibliography@format}
  \patchcmd\thebibliography{%
    \clubpenalty4000%
  }{%
    \interlinepenalty=5000\relax
    \clubpenalty=10000\relax
  }{}{\zjgsu@patch@error{\thebibliography}}
  \patchcmd\thebibliography{%
    \widowpenalty4000%
  }{%
    \widowpenalty=10000\relax
  }{}{\zjgsu@patch@error{\thebibliography}}
  \def\@biblabel#1{[#1]\hfill}
  \renewcommand\NAT@bibsetnum[1]{%
    % \settowidth\labelwidth{\@biblabel{#1}}%
    % \setlength{\leftmargin}{\labelwidth}%
    % \addtolength{\leftmargin}{\labelsep}%
    \setlength{\leftmargin}{1cm}%
    \setlength{\itemindent}{\z@}%
    \setlength{\labelsep}{0.1cm}%
    \setlength{\labelwidth}{0.9cm}%
    \setlength{\itemsep}{\bibsep}
    \setlength{\parsep}{\z@}%
    \ifNAT@openbib
      \addtolength{\leftmargin}{\bibindent}%
      \setlength{\itemindent}{-\bibindent}%
      \setlength{\listparindent}{\itemindent}%
      \setlength{\parsep}{0pt}%
    \fi
  }
}
\AtEndOfPackageFile*{biblatex}{
  \AtBeginDocument{
    \ifthenelse{\equal{\blx@bbxfile}{apa}}{\def\bibname{REFERENCES}}{}
    \ifthenelse{\equal{\blx@bbxfile}{apa6}}{\def\bibname{REFERENCES}}{}
    \ifthenelse{\equal{\blx@bbxfile}{mla}}{\def\bibname{WORKS CITED}}{}
    \ifthenelse{\equal{\blx@bbxfile}{mla-new}}{\def\bibname{WORKS CITED}}{}
  }
  \DeclareRobustCommand\inlinecite{\parencite}
  \defbibheading{bibliography}[\bibname]{\zjgsu@chapter*{\bibname}}
  \newcommand\zjgsu@set@bibliography@format{%
    \ifzjgsu@degree@bachelor
      \renewcommand\bibfont{\fontsize{10.5pt}{17pt}\selectfont}%
      \setlength{\bibitemsep}{6pt \@plus 3pt \@minus 3pt}%
      \ifzjgsu@main@language@chinese
        \setlength{\bibhang}{21pt}%
      \else
        \setlength{\bibhang}{0.5in}%
      \fi
    \else
      \renewcommand\bibfont{\fontsize{10.5pt}{16pt}\selectfont}%
      \setlength{\bibitemsep}{3pt \@plus 3pt \@minus 3pt}%
      \setlength{\biblabelsep}{0.1cm}%
      \setlength{\bibhang}{21pt}%
    \fi
  }
  \zjgsu@set@bibliography@format
  \zjgsu@option@hook{degree}{\zjgsu@set@bibliography@format}
  \zjgsu@option@hook{main-language}{\zjgsu@set@bibliography@format}
}
\AtEndOfPackageFile*{apacite}{
  \AtBeginDocument{
    \zjgsu@set@chapter@names
  }
  \renewcommand\bibliographytypesize{\fontsize{10.5pt}{17pt}\selectfont}
  \setlength{\bibitemsep}{6pt}
  \ifzjgsu@main@language@chinese
    \setlength{\bibleftmargin}{21pt}
    \setlength{\bibindent}{-\bibleftmargin}
  \else
    \setlength{\bibleftmargin}{0.5in}
    \setlength{\bibindent}{-\bibleftmargin}
  \fi
  \def\st@rtbibchapter{%
    \if@numberedbib%
      \chapter{\bibname}%   e.g.,   6. References
    \else%
      \zjgsu@chapter*{\bibname}%   e.g.,   References
    \fi%
  }%
}
\g@addto@macro\appendix{%
  \@mainmattertrue
  \ifzjgsu@degree@bachelor
    \ifzjgsu@statement@exists\else
      \zjgsu@warning{The appendices should be placed after statement}%
    \fi
  \fi
}
\zjgsu@define@key{
  toc-depth = {
    name = toc@depth,
  },
}
\zjgsu@option@hook{toc-depth}{%
  \ifx\@begindocumenthook\@undefined
    \protected@write\@auxout{}{%
      \string\ttl@writefile{toc}{%
        \protect\setcounter{tocdepth}{\zjgsu@toc@depth}%
      }%
    }%
  \else
    \setcounter{tocdepth}{\zjgsu@toc@depth}%
  \fi
}
\g@addto@macro\appendix{%
  \zjgsusetup{
    toc-depth = 0,
  }%
}
\zjgsu@define@key{
  appendix-figure-in-lof = {
    name = appendix@figure@in@lof,
    choices = {
      true,
      false,
    },
    default = false,
  },
}
\zjgsu@option@hook{appendix-figure-in-lof}{%
  \ifzjgsu@appendix@figure@in@lof@true
    \addtocontents{lof}{\string\let\string\contentsline\string\ttl@contentsline}%
    \addtocontents{lot}{\string\let\string\contentsline\string\ttl@contentsline}%
    \addtocontents{loe}{\string\let\string\contentsline\string\ttl@contentsline}%
  \else
    \addtocontents{lof}{\string\let\string\contentsline\string\ttl@gobblecontents}%
    \addtocontents{lot}{\string\let\string\contentsline\string\ttl@gobblecontents}%
    \addtocontents{loe}{\string\let\string\contentsline\string\ttl@gobblecontents}%
  \fi
}
\g@addto@macro\appendix{%
  \zjgsusetup{
    appendix-figure-in-lof = false,
  }%
}
\newcommand\zjgsu@end@appendix@ref@section{}
\AtBeginOfPackageFile*{bibunits}{
  \def\bibliography#1{%
    \if@filesw
      \immediate\write\@auxout{\string\bibdata{\zap@space#1 \@empty}}%
      \immediate\write\@auxout{\string\gdef\string\bu@bibdata{#1}}%
    \fi
    \@input@{\jobname.bbl}%
    \gdef\bu@bibdata{#1}%
  }
  \def\bibliographystyle#1{%
    \ifx\@begindocumenthook\@undefined\else
      \expandafter\AtBeginDocument
    \fi
      {\if@filesw
        \immediate\write\@auxout{\string\bibstyle{#1}}%
        \immediate\write\@auxout{\string\gdef\string\bu@bibstyle{#1}}%
      \fi}%
      \gdef\bu@bibstyle{#1}%
  }
}
\AtEndOfPackageFile*{bibunits}{
  \def\@startbibunit{%
    \global\let\@startbibunitorrelax\relax
    \global\let\@finishbibunit\@finishstartedbibunit
    \global\advance\@bibunitauxcnt 1
    \if@filesw
      {\endlinechar-1
      \makeatletter
      \@input{\@bibunitname.aux}}%
      \immediate\openout\@bibunitaux\@bibunitname.aux
      \immediate\write\@bibunitaux{\string\bibstyle{\@localbibstyle}}%
    \fi
  }
  \def\bu@bibliography#1{%
    \putbib[#1]%
  }
  \def\bu@bibliographystyle#1{%
    \if@filesw
      \immediate\write\@bibunitaux{\string\gdef\string\@localbibstyle{#1}}%
    \fi
    \gdef\@localbibstyle{#1}%
  }
  \providecommand\printbibliography{\putbib\relax}%
  \g@addto@macro\appendix{%
    \renewcommand\@bibunitname{\jobname-appendix-\@alph\c@chapter}%
    \bibliographyunit[\chapter]%
    \renewcommand\bibsection{%
      \ctexset{section/numbering = false}%
      \section{\bibname}%
      \ctexset{section/numbering = true}%
    }%
    \ifzjgsu@degree@graduate
      \renewcommand\citenumfont{\@Alph\c@chapter.}%
      \renewcommand\@extra@binfo{@-\@alph\c@chapter}%
      \renewcommand\@extra@b@citeb{@-\@alph\c@chapter}%
      \renewcommand\bibnumfmt[1]{[\@Alph\c@chapter.#1]\hfill}%
    \fi
  }
  \renewcommand\zjgsu@end@appendix@ref@section{%
    \bibliographyunit\relax
  }
  \AtEndDocument{\zjgsu@end@appendix@ref@section}
  \renewcommand\zjgsu@set@survey@bibheading{%
    \renewcommand\bibsection{%
      \par
      \vskip 20pt%
      \zjgsu@pdfbookmark{1}{\bibname}%
      \begingroup
        \centering
        \xiaosi[1.667]\bibname\par
      \endgroup
      \vskip 6pt%
    }%
  }%
  % \let\@xtestdef\@gobbletwo  % This doesn't work
  \def\bibunits@rerun@warning{\relax}
}
\PassOptionsToPackage{defernumbers = true}{biblatex}
\AtEndOfPackageFile*{biblatex}{
  \DeclareRefcontext{appendix}{}
  \g@addto@macro\appendix{%
    \pretocmd\chapter{%
      \newrefsection
      \ifzjgsu@degree@bachelor\else
        \@tempcnta=\c@chapter
        \advance\@tempcnta\@ne
        \newrefcontext[labelprefix = {\@Alph\@tempcnta.}]{appendix}%
      \fi
    }{}{\zjgsu@patch@error{\chapter}}%
    \defbibheading{bibliography}[\bibname]{%
      \ctexset{section/numbering = false}%
      \section{#1}%
      \ctexset{section/numbering = true}%
    }%
  }
  \renewcommand\zjgsu@set@survey@bibheading{%
    \defbibheading{bibliography}[\bibname]{%
      \par
      \vskip 20pt%
      \zjgsu@pdfbookmark{1}{\bibname}%
      \begingroup
        \centering
        \xiaosi[1.667]##1\par
      \endgroup
      \vskip 6pt%
    }%
  }%
  \def\bibliographystyle#1{%
    \zjgsu@warning{'bibliographystyle' invalid for 'biblatex'.}%
  }
}
\@ifpackagelater{titletoc}{2019/07/14}{
  \newcommand\zjgsu@print@contents[5]{%
    \printcontents[#1]{#2}{#3}[#4]{}%
  }
}{
  \newcommand\zjgsu@print@contents[5]{%
    \printcontents[#1]{#2}{#3}{\setcounter{tocdepth}{#4}#5}%
  }
}
\newenvironment{survey}{%
  \chapter{外文资料的调研阅读报告}%
  \zjgsusetup{language = english}%
  \let\title\zjgsu@appendix@title
  \let\maketitle\zjgsu@appendix@maketitle
  \zjgsu@set@partial@toc@format
  \renewcommand\tableofcontents{%
    \section*{Contents}%
    \zjgsu@pdfbookmark{1}{Contents}%
    \zjgsu@print@contents{survey}{l}{1}{2}{}%
    \vskip 20pt%
  }%
  \let\appendix\zjgsu@appendix@appendix
  \zjgsu@set@survey@bibheading
  \renewcommand\bibname{参考文献}%
  \startcontents[survey]%
}{%
  \stopcontents[survey]%
  \zjgsu@reset@main@language % restore language
}
\newcommand\zjgsu@set@appendix@bib@heading{}
%%%\newenvironment{translation}{%
%%%  \chapter{外文资料的书面翻译}%
%%%  \zjgsusetup{language = chinese}%
%%%  \let\title\zjgsu@appendix@title
%%%  \let\maketitle\zjgsu@appendix@maketitle
%%%  \renewenvironment{abstract}{%
%%%    \ctexset{
%%%      section = {
%%%        format    += \centering,
%%%        numbering  = false,
%%%      },
%%%    }%
%%%    \section{摘要}%
%%%  }{%
%%%    \par
%%%    \ifx\zjgsu@keywords\@empty\else
%%%      \textbf{关键词：}\zjgsu@clist@use{\zjgsu@keywords}{；}\par
%%%    \fi
%%%  }%
%%%  \zjgsu@set@partial@toc@format
%%%  \renewcommand\tableofcontents{%
%%%    \section*{{目录}}%
%%%    \zjgsu@pdfbookmark{1}{目录}%
%%%    \zjgsu@print@contents{translation}{l}{1}{2}{}%
%%%    \vskip 20pt%
%%%  }%
%%%  \let\appendix\zjgsu@appendix@appendix
%%%  \def\bibsection{%
%%%    \begingroup
%%%      \ctexset{section/numbering=false}%
%%%      \section{\bibname}%
%%%    \endgroup
%%%  }%
%%%  \startcontents[translation]%
%%%}{%
%%%  \stopcontents[translation]%
%%%  \zjgsu@reset@main@language % restore language
%%%}
%%%\newenvironment{translation-index}{}{}
%%%\AtEndOfPackageFile*{bibunits}{
%%%  \newcounter{zjgsu@translation@index}%
%%%  \renewenvironment{translation-index}{%
%%%    \global\advance\c@zjgsu@translation@index\@ne
%%%    \begin{bibunit}%
%%%      \renewcommand\@bibunitname{\jobname-index-\arabic{zjgsu@translation@index}}%
%%%      \renewcommand\bibname{书面翻译对应的原文索引}%
%%%      \zjgsu@set@survey@bibheading
%%%  }{%
%%%    \end{bibunit}%
%%%  }
%%%}
%%%\AtEndOfPackageFile*{biblatex}{
%%%  \renewenvironment{translation-index}{%
%%%    \endrefsection
%%%    \begin{refsection}%
%%%      \renewcommand\bibname{书面翻译对应的原文索引}%
%%%      \zjgsu@set@survey@bibheading
%%%  }{%
%%%    \end{refsection}%
%%%  }
%%%}
\DeclareRobustCommand\zjgsu@appendix@title[1]{\gdef\zjgsu@appendix@@title{#1}}
\newcommand\zjgsu@appendix@maketitle{%
  \par
  \begin{center}%
    \xiaosi[1.667]\zjgsu@appendix@@title
  \end{center}%
  \par
}
\newcommand\zjgsu@set@partial@toc@format{%
  \titlecontents{section}
    [\z@]{}
    {\contentspush{\thecontentslabel\quad}}{}
    {\zjgsu@leaders\thecontentspage}%
  \titlecontents{subsection}
    [1em]{}
    {\contentspush{\thecontentslabel\quad}}{}
    {\zjgsu@leaders\thecontentspage}%
  \titlecontents{subsubsection}
    [2em]{}
    {\contentspush{\thecontentslabel\quad}}{}
    {\zjgsu@leaders\thecontentspage}%
}
\newcommand\zjgsu@appendix@appendix{%
  \def\theHsection{\Hy@AlphNoErr{section}}%
  \setcounter{section}{0}%
  \setcounter{subsection}{0}%
  \renewcommand\thesection{\thechapter.\@Alph\c@section}%
}%
\newcommand\zjgsu@set@survey@bibheading{}
\newenvironment{resume}{%
  \@mainmatterfalse
  \zjgsu@end@appendix@ref@section
  \zjgsu@chapter*{\zjgsu@resume@name}%
  \ctexset{
    section = {
      format    += \centering,
      numbering = false,
    },
  }%
  \ifzjgsu@language@chinese
    \ctexset{
      subsection = {
        format     = \sffamily\fontsize{14pt}{20pt}\selectfont,
        numbering  = false,
        aftertitle = ：,
      },
    }%
    \setlist[achievements]{
      topsep     = 6pt,
      itemsep    = 6pt,
      leftmargin = 1cm,
      labelwidth = 1cm,
      labelsep   = 0pt,
      first      = {
        \ifzjgsu@degree@graduate
          \fontsize{12pt}{16pt}\selectfont
        \fi
      },
      align      = left,
      label      = [\arabic*],
      resume     = achievements,
    }%
  \else
    \ctexset{
      subsection = {
        beforeskip = 0pt,
        afterskip  = 0pt,
        format     = \bfseries\normalsize,
        indent     = \parindent,
        numbering  = false,
      },
    }%
    \ifzjgsu@degree@bachelor
      % 内容部分用Arial字体，字号15pt，行距采用固定值20pt， 段前后 0pt。
      \sffamily\fontsize{15pt}{20pt}\selectfont
    \fi
    \setlist[achievements]{
      topsep     = 0pt,
      itemsep    = 0pt,
      leftmargin = 1.75cm,
      labelsep   = 0.5cm,
      align      = right,
      label      = [\arabic*],
      resume     = achievements,
    }%
  \fi
}{}
\newcommand\resumeitem[1]{%
  \zjgsu@error{The "\protect\resumeitem" is obsolete. Please update to the new format}%
}
\newcommand\researchitem[1]{%
  \zjgsu@error{The "\protect\researchitem" is obsolete. Please update to the new format}%
}
\newlist{achievements}{enumerate}{1}
\setlist[achievements]{
  topsep     = 6pt,
  partopsep  = 0pt,
  itemsep    = 6pt,
  parsep     = 0pt,
  leftmargin = 10mm,
  itemindent = 0pt,
  align      = left,
  label      = [\arabic*],
  resume     = achievements,
}
\newenvironment{publications}{%
  \zjgsu@deprecate{"publications" environment}{"achievements"}%
  \begin{achievements}%
}{%
  \end{achievements}%
}
\newcommand\publicationskip{%
  \zjgsu@error{The "\protect\publicationskip" is obsolete. Do not use it}%
}
\NewEnviron{comments}[1][]{%
  \zjgsu@end@appendix@ref@section
  \ifzjgsu@degree@graduate
    \@mainmatterfalse
    \kv@define@key{zjgsu@comments}{name}{\let\zjgsu@comments@name\kv@value}%
    \kv@set@family@handler{zjgsu@comments}{%
      \ifx\kv@value\relax
        \let\zjgsu@comments@name\kv@key
      \else
        \kv@handled@false
      \fi
    }%
    \kvsetkeys{zjgsu@comments}{#1}%
    \chapter{\zjgsu@comments@name}%
    \BODY\clearpage
  \fi
}
\NewEnviron{resolution}{%
  \zjgsu@end@appendix@ref@section
  \ifzjgsu@degree@graduate
    \@mainmatterfalse
    \chapter{\zjgsu@resolution@name}%
    \BODY\clearpage
  \fi
}
\newcommand{\record}[1]{%
  \let\zjgsu@record@file\@empty
  \kv@define@key{zjgsu@record}{file}{\let\zjgsu@record@file\kv@value}%
  \kv@set@family@handler{zjgsu@record}{%
    \ifx\kv@value\relax
      \let\zjgsu@record@file\kv@key
    \else
      \kv@handled@false
    \fi
  }%
  \kvsetkeys{zjgsu@record}{#1}%
  \ifx\zjgsu@record@file\@empty
    \zjgsu@error{File path of \protect\record\space is required}
  \fi
  \cleardoublepage
  \zjgsu@pdfbookmark{0}{综合论文训练记录表}%
  \includepdf[pages=-]{\zjgsu@record@file}%
}
\PassOptionsToPackage{
  linktoc            = all,
  bookmarksdepth     = 2,
  bookmarksnumbered  = true,
  bookmarksopen      = true,
  bookmarksopenlevel = 1,
  bookmarksdepth     = 3,
  unicode            = true,
  psdextra           = true,
  breaklinks         = true,
  plainpages         = false,
  pdfdisplaydoctitle = true,
  hidelinks,
}{hyperref}
\AtEndOfPackageFile*{hyperref}{
  \newcounter{zjgsu@bookmark}
  \renewcommand\zjgsu@pdfbookmark[2]{%
    \phantomsection
    \stepcounter{zjgsu@bookmark}%
    \pdfbookmark[#1]{#2}{zjgsuchapter.\thezjgsu@bookmark}%
  }
  \renewcommand\zjgsu@phantomsection{%
    \phantomsection
  }
  \pdfstringdefDisableCommands{%
    \let\\\relax
    \let\quad\relax
    \let\qquad\relax
    \let\hspace\@gobble
  }%
  \@ifpackagelater{hyperref}{2019/04/27}{}{%
    \g@addto@macro\psdmapshortnames{\let\mu\textmu}
  }%
  \ifzjgsu@main@language@chinese
    \hypersetup{
      pdflang = zh-CN,
    }%
  \else
    \hypersetup{
      pdflang = en-US,
    }%
  \fi
  \AtBeginDocument{%
    \ifzjgsu@main@language@chinese
      \hypersetup{
        pdftitle    = \zjgsu@title,
        pdfauthor   = \zjgsu@author,
        pdfsubject  = \zjgsu@degree@category,
        pdfkeywords = \zjgsu@keywords,
      }%
    \else
      \hypersetup{
        pdftitle    = \zjgsu@title@en,
        pdfauthor   = \zjgsu@author@en,
        pdfsubject  = \zjgsu@degree@category@en,
        pdfkeywords = \zjgsu@keywords@en,
      }%
    \fi
    \hypersetup{
      pdfcreator={\zjgsuthesis-v\version}}
  }%
}
\AtEndOfPackageFile*{mathtools}{
  \@ifpackageloaded{unicode-math}{
    \let\underbrace\LaTeXunderbrace
    \let\overbrace\LaTeXoverbrace
  }{}
}
\AtEndOfPackageFile*{nomencl}{
  \let\nomname\zjgsu@denotation@name
  \def\thenomenclature{\begin{denotation}[\nom@tempdim]}
  \def\endthenomenclature{\end{denotation}}
}
\AtEndOfPackageFile*{siunitx}{%
  \newcommand\zjgsu@set@siunitx@language{%
    \ifzjgsu@language@chinese
      \sisetup{
        list-final-separator = { 和 },
        list-pair-separator  = { 和 },
        range-phrase         = {～},
      }%
    \else
      \ifzjgsu@language@english
        \sisetup{
          list-final-separator = {, and },
          list-pair-separator  = { and },
          range-phrase         = { to },
        }%
      \fi
    \fi
  }
  \zjgsu@set@siunitx@language
  \zjgsu@option@hook{language}{\zjgsu@set@siunitx@language}
}
\AtEndOfPackageFile*{amsthm}{%
  \newtheoremstyle{zjgsu}
    {\z@}{\z@}
    {\normalfont}{\z@}
    {\normalfont\sffamily}{\zjgsu@theorem@separator}
    {0.5em}{}
  \theoremstyle{zjgsu}
  \newtheorem{assumption}{\zjgsu@assumption@name}[chapter]%
  \newtheorem{definition}{\zjgsu@definition@name}[chapter]%
  \newtheorem{proposition}{\zjgsu@proposition@name}[chapter]%
  \newtheorem{lemma}{\zjgsu@lemma@name}[chapter]%
  \newtheorem{theorem}{\zjgsu@theorem@name}[chapter]%
  \newtheorem{axiom}{\zjgsu@axiom@name}[chapter]%
  \newtheorem{corollary}{\zjgsu@corollary@name}[chapter]%
  \newtheorem{exercise}{\zjgsu@exercise@name}[chapter]%
  \newtheorem{example}{\zjgsu@example@name}[chapter]%
  \newtheorem{remark}{\zjgsu@remark@name}[chapter]%
  \newtheorem{problem}{\zjgsu@problem@name}[chapter]%
  \newtheorem{conjecture}{\zjgsu@conjecture@name}[chapter]%
  \renewenvironment{proof}[1][\zjgsu@proof@name]{\par
    \pushQED{\qed}%
    % \normalfont \topsep6\p@\@plus6\p@\relax
    \normalfont \topsep\z@\relax
    \trivlist
    \item[\hskip\labelsep
      %     \itshape
      % #1\@addpunct{.}]\ignorespaces
      \sffamily
      #1]\ignorespaces
  }{%
    \popQED\endtrivlist\@endpefalse
  }
  \renewcommand\qedsymbol{\zjgsu@qed}
}
\AtEndOfPackageFile*{ntheorem}{%
  \theorembodyfont{\normalfont}%
  \theoremheaderfont{\normalfont\sffamily}%
  \theoremsymbol{\zjgsu@qed}%
  \newtheorem*{proof}{\zjgsu@proof@name}%
  \theoremstyle{plain}%
  \theoremsymbol{}%
  \theoremseparator{\zjgsu@theorem@separator}%
  \newtheorem{assumption}{\zjgsu@assumption@name}[chapter]%
  \newtheorem{definition}{\zjgsu@definition@name}[chapter]%
  \newtheorem{proposition}{\zjgsu@proposition@name}[chapter]%
  \newtheorem{lemma}{\zjgsu@lemma@name}[chapter]%
  \newtheorem{theorem}{\zjgsu@theorem@name}[chapter]%
  \newtheorem{axiom}{\zjgsu@axiom@name}[chapter]%
  \newtheorem{corollary}{\zjgsu@corollary@name}[chapter]%
  \newtheorem{exercise}{\zjgsu@exercise@name}[chapter]%
  \newtheorem{example}{\zjgsu@example@name}[chapter]%
  \newtheorem{remark}{\zjgsu@remark@name}[chapter]%
  \newtheorem{problem}{\zjgsu@problem@name}[chapter]%
  \newtheorem{conjecture}{\zjgsu@conjecture@name}[chapter]%
}
\PassOptionsToPackage{chapter}{algorithm}
\AtEndOfPackageFile*{algorithm}{
  \floatname{algorithm}{\zjgsu@algorithm@name}
  \renewcommand\listofalgorithms{%
    \zjgsu@listof{algorithm}%
  }
  \renewcommand\listalgorithmname{\zjgsu@list@algorithm@name}
  \def\ext@algorithm{loa}
  \contentsuse{algorithm}{loa}
  \titlecontents{algorithm}
    [\z@]{}
    {\contentspush{\fname@algorithm~\thecontentslabel\quad}}{}
    {\zjgsu@leaders\thecontentspage}
}
\PassOptionsToPackage{algochapter}{algorithm2e}
\AtEndOfPackageFile*{algorithm2e}{
  \renewcommand\algorithmcfname{\zjgsu@algorithm@name}
  \SetAlgoCaptionLayout{zjgsu@caption@font}
  \SetAlCapSty{relax}
  \SetAlgoCaptionSeparator{\hspace*{1em}}
  \SetAlFnt{\fontsize{11pt}{14.3pt}\selectfont}
  \renewcommand\listofalgorithms{%
    \zjgsu@listof{algorithmcf}%
  }
  \renewcommand\listalgorithmcfname{\zjgsu@list@algorithm@name}
  \def\ext@algorithmcf{loa}
  \contentsuse{algocf}{loa}
  \titlecontents{algocf}
    [\z@]{}
    {\contentspush{\algorithmcfname~\thecontentslabel\quad}}{}
    {\zjgsu@leaders\thecontentspage}
}
\AtEndOfPackageFile*{minted}{
  \newcommand\zjgsu@set@listing@language{%
    \ifzjgsu@language@chinese
      \floatname{listing}{代码}%
    \else
      \floatname{listing}{Listing}%
    \fi
  }
  \zjgsu@set@listing@language
  \zjgsu@option@hook{language}{\zjgsu@set@listing@language}
}
\zjgsu@define@key{
  spine-font = {
    name = spine@font,
  },
  spine-title = {
    name = spine@title,
  },
  spine-author = {
    name = spine@author,
  },
}
\renewcommand\zjgsu@spine@font{%
  \ifzjgsu@degree@doctor
    \fontsize{16pt}{20.8pt}\selectfont
  \else
    \fontsize{15pt}{19.5pt}\selectfont
  \fi
}
\newcommand*\CJKmovesymbol[1]{\raise.3em\hbox{#1}}
\newcommand*\CJKmove{%
  \punctstyle{plain}%
  \let\CJKsymbol\CJKmovesymbol
  \let\CJKpunctsymbol\CJKsymbol
}
\NewDocumentCommand{\spine}{
    O{
      \ifx\zjgsu@spine@title\@empty
        \zjgsu@title
      \else
        \zjgsu@spine@title
      \fi
    }
    O{
      \ifx\zjgsu@spine@author\@empty
        \zjgsu@author
      \else
        \zjgsu@spine@author
      \fi
    }}{%
  \clearpage
  \ifzjgsu@degree@bachelor
    \newgeometry{
      vmargin = 3cm,
      hmargin = 1cm,
    }%
  \else
    \newgeometry{
      vmargin = 5.5cm,
      hmargin = 1cm,
    }%
  \fi
  \thispagestyle{empty}%
  \ifzjgsu@main@language@chinese
    \zjgsu@pdfbookmark{0}{书脊}%
  \else
    \zjgsu@pdfbookmark{0}{Spine}%
  \fi
  \begingroup
    \noindent\hfill
    \rotatebox[origin=lt]{-90}{%
      \makebox[\textheight]{%
        \fangsong
        \addCJKfontfeatures*{RawFeature={vertical}}%
        \zjgsu@spine@font
        \CJKmove
        #1\hfill
        \zjgsu@stretch{4.5em}{#2}%
      }%
    }%
  \endgroup
  \clearpage
  \restoregeometry
}
\DeclareRobustCommand\cs[1]{\texttt{\char`\\#1}}
\DeclareRobustCommand\file{\nolinkurl}
\DeclareRobustCommand\env{\textsf}
\DeclareRobustCommand\pkg{\textsf}
\DeclareRobustCommand\cls{\textsf}
\sloppy
\endinput
%%
%% End of file `zjgsuthesis.cls'.
