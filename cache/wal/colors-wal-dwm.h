static const char norm_fg[] = "#cadde3";
static const char norm_bg[] = "#121516";
static const char norm_border[] = "#8d9a9e";

static const char sel_fg[] = "#cadde3";
static const char sel_bg[] = "#4E7A85";
static const char sel_border[] = "#cadde3";

static const char urg_fg[] = "#cadde3";
static const char urg_bg[] = "#C58F6A";
static const char urg_border[] = "#C58F6A";

static const char *colors[][3]      = {
    /*               fg           bg         border                         */
    [SchemeNorm] = { norm_fg,     norm_bg,   norm_border }, // unfocused wins
    [SchemeSel]  = { sel_fg,      sel_bg,    sel_border },  // the focused win
    [SchemeUrg] =  { urg_fg,      urg_bg,    urg_border },
};
