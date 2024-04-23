<!--
Add here global page variables to use throughout your website.
-->
+++
author = "Junkai Dong"
mintoclevel = 3

keep_path = ["googlea83d5a85d198f1f2.html"]

# Add here files or directories that should be ignored by Franklin, otherwise
# these files might be copied and, if markdown, processed by Franklin which
# you might not want. Indicate directories by ending the name with a `/`.
# Base files such as LICENSE.md and README.md are ignored by default.
ignore = ["node_modules/"]

# RSS (the website_{title, descr, url} must be defined to get RSS)
generate_rss = true
website_title = "Junkai Dong"
website_descr = "Junkai Dong's Personal Website"
website_url   = "https://junkaidong.github.io"
+++

<!--
Add here global latex commands to use throughout your pages.
-->
\newcommand{\R}{\mathbb R}
\newcommand{\scal}[1]{\langle #1 \rangle}
\newcommand{\braket}[1]{\left\langle #1 \right\rangle}
<!-- \newtheorem{theorem}{Theorem} -->
\newcommand{\figenv}[3]{
~~~
<figure style="text-align:center;">
<img src="!#2" style="padding:0;#3" alt="#1"/>
</figure>
~~~
}
\newcommand{\Tr}{\mathrm{Tr}}
\newcommand{\chara}{\mathrm{char}}
\newcommand{\Res}{\mathrm{Res}}
\newcommand{\Span}{\mathrm{Span}}
\newcommand{\class}{\mathrm{Class}}
\newcommand{\id}{\mathrm{id}}
\newcommand{\sgn}{\mathrm{sgn}}
\newcommand{\lcm}{\mathrm{lcm}}
\newcommand{\im}{\mathrm{im}}
\newcommand{\Hom}{\mathrm{Hom}}
\newcommand{\coker}{\mathrm{coker}}
\newcommand{\codim}{\mathrm{codim}}
\newcommand{\nul}{\mathrm{null}}
\newcommand{\arcsinh}{\mathrm{arcsinh}}
\newcommand{\arccosh}{\mathrm{arccosh}}
\newcommand{\arctanh}{\mathrm{arctanh}}
\newcommand{\Tor}{\mathrm{Tor}}
\newcommand{\Ann}{\mathrm{Ann}}
\newcommand{\Ad}{\mathrm{Ad}}
\newcommand{\diag}{\mathrm{diag}}
\newcommand{\Li}{\mathrm{Li}}
\newcommand{\R}{\mathbb{R}}
\newcommand{\SU}{\mathrm{SU}}
\newcommand{\U}{\mathrm{U}}
\newcommand{\secref}[1]{Sec.\,\ref{#1}}
\newcommand{\appref}[1]{Appendix.\,\ref{#1}}
\newcommand{\eqnref}[1]{Eq.\,\eqref{#1}}
\newcommand{\figref}[1]{Fig.\,\ref{#1}}
\newcommand{\tabref}[1]{Tab.\,\ref{#1}}
\newcommand{\ov}{\overline}
\newcommand{\l}{\left.<\right.}
\newcommand{\vv}[1]{\boldsymbol{#1}}%%shortcut to make a vector (overwrites the default command)
\newcommand{\cev}[1]{\reflectbox{\ensuremath{\vec{\reflectbox{\ensuremath{#1}}}}}}
