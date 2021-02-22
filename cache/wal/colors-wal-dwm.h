static const char norm_fg[] = "#cfe1e3";
static const char norm_bg[] = "#371a10";
static const char norm_border[] = "#909d9e";

static const char sel_fg[] = "#cfe1e3";
static const char sel_bg[] = "#73B8C5";
static const char sel_border[] = "#cfe1e3";

static const char urg_fg[] = "#cfe1e3";
static const char urg_bg[] = "#5CA1AF";
static const char urg_border[] = "#5CA1AF";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
