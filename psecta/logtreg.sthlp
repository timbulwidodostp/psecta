{smcl}
{cmd:help logtreg}{right: ({browse "https://doi.org/10.1177/1536867X19833285":SJ19-1: st0503_1})}
{hline}

{title:Title}

{p2colset 5 16 18 2}{...}
{p2col :{cmd:logtreg} {hline 2}}Linear regression for the log t test{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 15 2}
{opt logtreg} {varname}  {ifin} [{cmd:,} {it:options}]

{synoptset 12}{...}
{synopthdr}
{synoptline}
{synopt :{opt kq(#)}}set the first {cmd:kq()} proportion of the data to be discarded before regression; default is {cmd:kq(0.3)}{p_end}
{synopt :{opt nom:ata}}bypass the use of community-contributed Mata
functions; by
default, community-contributed Mata functions are used{p_end}
{synoptline}
{p 4 6 2}
A panel variable and a time variable must be specified; use {helpb xtset}.  The unbalanced panel data must be rectangularized; use {helpb fillin}.{p_end}


{marker description}{...}
{title:Description}

{pstd}
{cmd:logtreg} conducts the log t test using linear regression with
heteroskedasticity- and autocorrelation-consistent standard errors.  See
Phillips and Sul (2007) for more technical details.


{title:Options}

{phang}
{opt kq(#)} specifies the first {cmd:kq()} proportion of the data to be
discarded before regression.  The default is {cmd:kq(0.3)}.

{phang}
{cmd:nomata} bypasses the use of community-contributed Mata functions; by
default, community-contributed Mata functions are used.


{marker examples}{...}
{title:Examples}

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
{cmd:. logtreg lnpgdp2}{p_end}

{phang}
{cmd:. logtreg lnpgdp2, kq(0.333)}{p_end}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:logtreg} stores the following in {cmd:e()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Scalars}{p_end}
{synopt:{cmd:e(N)}}number of individuals{p_end}
{synopt:{cmd:e(T)}}number of time periods{p_end}
{synopt:{cmd:e(nreg)}}number of observations used for the regression{p_end}
{synopt:{cmd:e(beta)}}log t coefficient{p_end}
{synopt:{cmd:e(tstat)}}t statistic for log t{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:e(cmd)}}{cmd:logtreg}{p_end}
{synopt:{cmd:e(cmdline)}}command as typed{p_end}
{synopt:{cmd:e(varlist)}}name of the variable for log t test{p_end}

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Matrices}{p_end}
{synopt:{cmd:e(res)}}table of estimation results{p_end}


{marker references}{...}
{title:References}

{phang}
Phillips, P. C. B., and D. Sul. 2007. Transition modeling and econometric convergence tests. {it:Econometrica} 75: 1771-1855.

{phang}
------. 2009. Economic transition and growth.
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
Help:  {helpb psecta} (if installed){p_end}
