static const char norm_fg[] = "#dfe3e9";
static const char norm_bg[] = "#071F1E";
static const char norm_border[] = "#9c9ea3";

static const char sel_fg[] = "#dfe3e9";
static const char sel_bg[] = "#C1C6B2";
static const char sel_border[] = "#dfe3e9";

static const char urg_fg[] = "#dfe3e9";
static const char urg_bg[] = "#93A8B0";
static const char urg_border[] = "#93A8B0";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
