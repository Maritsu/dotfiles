/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */

//static int instant = 1;
static int topbar = 0;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Hack:size=12"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
static const char col_acc[]    = "#242a32"; //unify accent color
static const char col_high[]   = "#73e600"; //unify highlight color
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { "#bbbbbb", "#222222" },
	[SchemeSel] = { "#eeeeee", col_acc },
	[SchemeSelHighlight] = { col_high, col_acc },
	[SchemeNormHighlight] = { col_high, "#222222" },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 0;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
