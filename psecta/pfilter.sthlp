{smcl}
{cmd:help pfilter}{right: ({browse "https://doi.org/10.1177/1536867X19833285":SJ19-1: st0503_1})}
{hline}

{title:Title}

{p2colset 5 16 18 2}{...}
{p2col :{cmd:pfilter} {hline 2}}Filter a time-series variable in panel data{p_end}
{p2colreset}{...}


{marker syntax}{...}
{title:Syntax}

{p 8 15 2}
{opt pfilter} {varname}{cmd:,} {opt method(string)} [{it:options}]

{synoptset 20 tabbed}{...}
{synopthdr}
{synoptline}
{p2coldent :* {opt method(string)}}filter method; it should be chosen from
{cmd:bk}, {cmd:bw}, {cmd:cf}, or {cmd:hp}{p_end}
{synopt :{opt trend(newvar)}}create a variable for the trend component{p_end}
{synopt :{opt cyc(newvar)}}create a variable for the cyclical component{p_end}
{synopt :{it:options}}are any options available for {manhelp tsfilter TS}{p_end}
{synoptline}
{p 4 6 2}
* {cmd:method()} is required.{p_end}
{p 4 6 2}
A panel variable and a time variable must be specified; use {helpb xtset}.{p_end}


{marker description}{...}
{title:Description}

{pstd}
{cmd:pfilter} extends the {helpb tsfilter} command to operate on each time
series in a panel.  It extracts trend and cyclical components for each
individual, respectively.  See {manhelp tsfilter TS} for detailed techniques.


{title:Options}

{phang}
{opt method(string)} specifies the filter method.  {it:string} should be
chosen from {cmd:bk}, {cmd:bw}, {cmd:cf}, or {cmd:hp}.  {cmd:method()} is
required.

{phang}
{opt trend(newvar)} creates a new variable for the trend component.

{phang}
{opt cyc(newvar)} creates a new variable for the cyclical component.

{phang}
{it:options} are any options available for {manhelp tsfilter TS}.


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
{cmd:. pfilter lnpgdp, method(hp) trend(lnpgdp2) smooth(400)}


{marker results}{...}
{title:Stored results}

{pstd}
{cmd:pfilter} stores the following in {cmd:r()}:

{synoptset 20 tabbed}{...}
{p2col 5 20 24 2: Macros}{p_end}
{synopt:{cmd:r(cmd)}}{cmd:pfilter}{p_end}
{synopt:{cmd:r(cmdline)}}command as typed{p_end}
{synopt:{cmd:r(varlist)}}name of the variable{p_end}


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
Help:  {manhelp tsfilter TS}, {helpb hprescott} (if installed){p_end}
