{smcl}
{cmd:help psecta}{right: ({browse "https://doi.org/10.1177/1536867X19833285":SJ19-1: st0503_1})}
{hline}

{title:Title}

{p2colset 5 15 17 2}{...}
{p2col :{cmd:psecta} {hline 2}}Club convergence test and clustering{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{opt psecta} 
{varname}
[{cmd:,} {it:options}]

{synoptset 16}{...}
{synopthdr}
{synoptline}
{synopt :{opt name(panelvar)}}specify a panel variable to be displayed for the clustering results; by default, the panel variable specified by {helpb xtset} is used{p_end}
{synopt :{opt kq(#)}}set the first {cmd:kq()} proportion of the data to be discarded before regression; default is {cmd:kq(0.3)}{p_end}
{synopt :{opt g:en(newvar)}}create a variable for club classifications{p_end}
{synopt :{opt cr(#)}}the critical value for club clustering; default is {cmd:cr(0)}{p_end}
{synopt :{opt incr(#)}}the increment of cr when the initial cr value fails to sieve individuals for clusters; default is {cmd:incr(0.05)}{p_end}
{synopt :{opt maxcr(#)}}the maximum of cr value; default is {cmd:maxcr(50)}{p_end}
{synopt :{opt a:djust}}use the adjusted method proposed by Schnurbus, Haupt, and Meier (2017) instead of raising {cmd:cr()} when the initial {cmd:cr()} value fails to sieve individuals for clusters{p_end}
{synopt :{opt fr(#)}}specify sorting individuals by the time series average of the last {cmd:fr()} proportion of the data; default is {cmd:fr(0)}, sorting individuals according to the last period{p_end}
{synopt :{opt nom:ata}}bypass the use of community-contributed Mata functions; by default, community-contributed Mata functions are used{p_end}
{synopt :{opt noprt:logtreg}}suppress the estimation results of the {cmd:logtreg}{p_end}
{synoptline}
{p 4 6 2}
A panel variable and a time variable must be specified; use {helpb xtset}.
The unbalanced panel data must be rectangularized; use {helpb fillin}.
Note that observations at the starting period for all individuals must not
be missing.{p_end}


{marker description}{...}
{title:Description}

{pstd}
{cmd:psecta} conducts club convergence and clustering analysis using the
algorithm proposed by Phillips and Sul (2007).


{title:Options}

{phang}
{opt name(panelvar)} specifies a panel variable to be displayed for the
clustering results; by default, the panel variable specified by {cmd:xtset} is
used.

{phang}
{opt kq(#)} specifies the first {cmd:kq()} proportion of the data to be
discarded before regression.  The default is {cmd:kq(0.3)}.

{phang}
{opt gen(newvar)} creates a new variable to store club classifications.  For
the individuals that are not classified into any convergence club, missing
values are generated.

{phang}
{opt cr(#)} specifies the critical value for club clustering.  The default is
{cmd:cr(0)}.

{phang}
{opt incr(#)} specifies the increment of {cmd:cr()} when the initial
{cmd:cr()} value fails to sieve individuals for clusters.  The default is
{cmd:incr(0.05)}.

{phang}
{opt maxcr(#)} specifies the maximum of {cmd:cr()} value.  The default is
{cmd:maxcr(50)}.

{phang}
{cmd:adjust} specifies using the adjusted method proposed by Schnurbus, Haupt,
and Meier (2017) instead of raising {cmd:cr()} when the initial {cmd:cr()}
value fails to sieve individuals for clusters.  See Schnurbus, Haupt, and
Meier (2017) for more details.

{phang}
{opt fr(#)} specifies sorting individuals by the time-series average of the
last {cmd:fr()} proportion periods.  The default is {cmd:fr(0)}, sorting
individuals according to the last period.

{phang}
{cmd:nomata} bypasses the use of community-contributed Mata functions; by
default, community-contributed Mata functions are used.

{phang}
{cmd:noprtlogtreg} suppresses the estimation results of the {cmd:logtreg}.


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
{cmd:. pfilter lnpgdp, method(hp) trend(lnpgdp2) smooth(400)}{p_end}

{phang}
{cmd:. psecta lnpgdp2, name(country) kq(0.333) gen(club)}{p_end}

{phang}
{cmd:. matrix b=e(bm)}{p_end}

{phang}
{cmd:. matrix ts=e(tm)}{p_end}

{phang}
{cmd:. matrix club=e(club)}{p_end}

{phang}
{cmd:. matrix list b}{p_end}

{phang}
{cmd:. matrix list ts}{p_end}

{phang}
{cmd:. matrix list club}{p_end}

{phang}
{cmd:. display "`e(cmd)'"}{p_end}

{phang}
{cmd:. display "`e(cmdline)'"}{p_end}

{phang}
{cmd:. display "`e(varlist)'"}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:psecta} stores the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:e(nclub)}}number of convergent clubs{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:psecta}{p_end}
{synopt:{cmd:e(cmdline)}}command as typed{p_end}
{synopt:{cmd:e(varlist)}}name of the variable for log t test{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:e(bm)}}log t coefficients{p_end}
{synopt:{cmd:e(tm)}}t statistics{p_end}
{synopt:{cmd:e(club)}}club classifications{p_end}


{marker references}{...}
{title:References}

{phang}
Phillips, P. C. B., and D. Sul. 2007. Transition modeling and econometric convergence tests. {it:Econometrica} 75: 1771-1855.

{phang}
------. 2009. Economic transition and growth.
{it:Journal of Applied Econometrics} 24: 1153-1185.

{phang}
Schnurbus, J., H. Haupt, and V. Meier. 2017. Economic transition and growth: A replication. {it:Journal of Applied Econometrics} 32: 1039-1042.


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
