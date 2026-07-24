/* drawline reveal — the animation's data series, in native SAS.

   The upstream repo animates a line through three points with R's
   gganimate (transition_reveal over time). Those same three points,
   and the same date-to-numeric mapping the R code performs with
   as.numeric(ymd(time)), reproduced here as SAS so the underlying
   data and line geometry can be run without R:

       (2020-01-01, 2), (2020-02-01, 4), (2020-03-01, 3)                */

data drawline;
    length time_chr $10;
    input time_chr $ y;
    time = input(time_chr, yymmdd10.);   /* as.numeric(ymd(time)) */
    format time yymmdd10.;
datalines;
2020-01-01 2
2020-02-01 4
2020-03-01 3
;
run;

proc print data=drawline label;
    label time_chr = "time (tribble)"
          time     = "numeric time axis"
          y        = "y";
run;

/* transition_reveal(time) draws the line cumulatively along time; here
   are the per-segment slopes between successive revealed points. */
proc sort data=drawline; by time; run;

data reveal;
    set drawline;
    prev_time = lag(time);
    prev_y    = lag(y);
    if _n_ > 1 then slope = (y - prev_y) / (time - prev_time);
    keep time_chr time y slope;
run;

proc print data=reveal label noobs;
    label slope = "segment slope (dy/dt)";
run;

proc means data=drawline min max mean maxdec=2;
    var y;
run;
