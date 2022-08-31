/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Hack:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char col_acc[]    = "#cc2a7a"; //unify accent color
static const char col_high[]   = "#BEEEEF"; //unify highlight color
static const char col_bgr[]    = "#242a32"; //unify bg color
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", col_bgr },
	[SchemeSel] = { "#eeeeee", col_bgr },
	[SchemeSelHighlight] = { col_high, col_bgr },
	[SchemeNormHighlight] = { col_high, col_bgr },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
