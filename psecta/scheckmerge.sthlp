{smcl}
{cmd:help scheckmerge}{right: ({browse "https://doi.org/10.1177/1536867X19833285":SJ19-1: st0503_1})}
{hline}

{title:Title}

{p2colset 5 20 22 2}{...}
{p2col :{cmd:scheckmerge} {hline 2}}Log t test for all pairs of adjacent clubs{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 19 2}
{opt scheckmerge} {varname}{cmd:,} {opt club(varname)} {opt kq(#)}
[{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{p2coldent :* {opt club(varname)}}specify the initial club classification{p_end}
{p2coldent :* {opt kq(#)}}set the first {cmd:kq()} proportion of the data to be discarded before regression{p_end}
{synopt :{opt md:iv}}include divergence group; by default, it is excluded{p_end}
{synopt :{opt nom:ata}}bypass the use of community-contributed Mata functions; by default, community-contributed Mata functions are used{p_end}
{synoptline}
{p 4 6 2}
* {cmd:club()} and {cmd:kq()} are required.{p_end}
{p 4 6 2}
A panel variable and a time variable must be specified; use {helpb xtset}.
The unbalanced panel data must be rectangularized; use {helpb fillin}.{p_end}


{marker description}{...}
{title:Description}

{pstd}
{cmd:scheckmerge} conducts the log t test for all pairs of adjacent clubs.
See Phillips and Sul (2009) for examples.


{title:Options}

{phang}
{opt club(varname)} specifies the initial club classifications.  {cmd:club()}
is required.

{phang}
{opt kq(#)} specifies the first {cmd:kq()} proportion of the data to be
discarded before regression.  {cmd:kq()} is required.

{phang}
{opt mdiv} specifies including the divergence group for the log t test; by
default, the divergence group is excluded.

{phang}
{opt nomata} bypasses the use of community-contributed Mata functions; by
default, community-contributed Mata functions are used.


{title:Example}

{phang}
{cmd:. use ps2009}{p_end}

{phang}
{cmd:. egen id = group(country)}{p_end}

{phang}
{cmd:. xtset id year}{p_end}

{phang}
{cmd:. generate lnpgdp=ln(pgdp)}{p_end}

{phang}
{cmd:. pfilter lnpgdp,  method(hp) trend(lnpgdp2) smooth(400)}{p_end}

{phang}
{cmd:. psecta lnpgdp2,  kq(0.333) gen(club)}  {p_end}

{phang}
{cmd:. scheckmerge lnpgdp2,  kq(0.333) club(club) mdiv}{p_end}

{phang}
{cmd:. matrix b=e(bm)}{p_end}

{phang}
{cmd:. matrix ts=e(tm)}{p_end}

{phang}
{cmd:. matrix list b}{p_end}

{phang}
{cmd:. matrix list ts}{p_end}

{phang}
{cmd:. display "`e(cmd)'"}{p_end}

{phang}
{cmd:. display "`e(cmdline)'"}{p_end}

{phang}
{cmd:. display "`e(varlist)'"}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:scheckmerge} stores the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:scheckmerge}{p_end}
{synopt:{cmd:e(cmdline)}}command as typed{p_end}
{synopt:{cmd:e(varlist)}}name of the variable for log t test{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:e(bm)}}log t coefficients{p_end}
{synopt:{cmd:e(tm)}}t statistics{p_end}
{p2colreset}{...}


{title:Reference}

{phang}
Phillips, P. C. B., and D. Sul. 2009. Economic transition and growth. 
{it:Journal of Applied Econometrics} 24: 1153-1185.


{title:Author}

{pstd}
Kerui Du{break}
The Center for Economic Research{break}
Shandong University{break}
Jinan, China{break}
{browse "mailto:kerrydu@sdu.edu.cn":kerrydu@sdu.edu.cn}


{title:Also see}

{p 4 14 2}
Article:  {it:Stata Journal}, volume 19, number 1: {browse "https://doi.org/10.1177/1536867X19833285":st0503_1},{break}
          {it:Stata Journal}, volume 17, number 4: {browse "http://www.stata-journal.com/article.html?article=st0503":st0503}{p_end}

{p 7 14 2}
Help:  {helpb imergeclub} (if installed){p_end}
