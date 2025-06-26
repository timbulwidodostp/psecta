{smcl}
{cmd:help imergeclub}{right: ({browse "https://doi.org/10.1177/1536867X19833285":SJ19-1: st0503_1})}
{hline}

{title:Title}

{p2colset 5 19 21 2}{...}
{p2col :{cmd:imergeclub} {hline 2}}Iteratively merge adjacent clubs{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 16 2}
{opt imergeclub} {varname}{cmd:,}
{opt club(varname)}
{opt kq(#)}
[{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{p2coldent :* {opt club(varname)}}specify the initial club classifications{p_end}
{p2coldent :* {opt kq(#)}}set the first {cmd:kq()} proportion of the data to be discarded before regression{p_end}
{synopt :{opt name(panelvar)}}specify a panel variable to be displayed for the clustering results; by default, the panel variable specified by {helpb xtset} is used{p_end}
{synopt :{opt g:en(newvar)}}create a variable for the final club classifications{p_end}
{synopt :{opt imore}}try to merge clubs iteratively until no clubs can be merged {p_end}
{synopt :{opt md:iv}}include divergence group; by default, it is excluded {p_end}
{synopt :{opt nom:ata}}bypass the use of community-contributed Mata functions; by default, community-contributed Mata functions are used{p_end}
{synopt :{opt noprt:logtreg}}suppress the estimation results of the logtreg{p_end}
{synoptline}
{p 4 6 2}
* {opt club()} and {opt kq()} are required.{p_end}
{p 4 6 2}
A panel variable and a time variable must be specified; use {helpb xtset}.  The unbalanced panel data must be rectangularized; use {helpb fillin}.{p_end}


{marker description}{...}
{title:Description}

{pstd}
{cmd:imergeclub} iteratively conducts merging all adjacent clubs.  The
procedure is conducted as follows: First, run the log t test for the cross
sections belonging to the initial clubs 1 and 2 (obtained from club
clustering).  Second, if they fulfill the convergence hypothesis jointly,
merge them to be the new club 1, and then run the log t test for the new club
1 and the initial club 3; if not, run the log t test for initial clubs 2 and
3, etc.


{title:Options}

{phang}
{opt club(varname)} specifies the initial club classifications.  {cmd:club()}
is required.

{phang}
{opt kq(#)} specifies the first {cmd:kq()} proportion of the data to be
discarded before regression.  {cmd:kq()} is required.

{phang}
{opt name(panelvar)} specifies a panel variable to be displayed for the
clustering results; by default, the panel variable specified by {cmd:xtset} is
used.

{phang}
{opt gen(newvar)} creates a new variable to store the new club
classifications.  For the individuals that are not classified into any
convergence club, missing values are generated.

{phang}
{cmd:imore} specifies merging clubs iteratively until no clubs can be merged.
By default, the procedure is conducted as follows: First, run the log t test
for the individuals belonging to the initial clubs 1 and 2 (obtained from club
clustering).  Second, if they fulfill the convergence hypothesis jointly,
merge them to be the new club 1, and then run the log t test for the new club
1 and the initial club 3; if not, run the log t test for initial clubs 2 and
3, etc.  If {cmd:imore} is chosen, the above procedure is repeated until no
clubs can be merged.

{phang}
{cmd:mdiv} specifies including the divergence group during club merging; by
default, the divergence group is excluded.

{phang}
{cmd:nomata} bypasses the use of community-contributed Mata functions; by
default, community-contributed Mata functions are used.

{phang}
{cmd:noprtlogtreg} suppresses the estimation results of the {cmd:logtreg}.


{marker examples}{...}
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
{cmd:. psecta lnpgdp2, kq(0.333) gen(club)}{p_end}

{phang}
{cmd:. imergeclub lnpgdp2, kq(0.333) club(club) gen(fclub)}{p_end}

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
{cmd:imergeclub} stores the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:e(nclub)}}number of convergent clubs{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:imergeclub}{p_end}
{synopt:{cmd:e(cmdline)}}command as typed{p_end}
{synopt:{cmd:e(varlist)}}name of the variable for log t test{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:e(beta)}}log t coefficients {p_end}
{synopt:{cmd:e(tstat)}}t statistics {p_end}


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
Help:  {helpb scheckmerge} (if installed){p_end}
