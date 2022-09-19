/* See LICENSE file for copyright and license details. */
/* Default settings; can be overriden by command line. */
#include "../colors.h"

static int topbar = 1;                      /* -b  option; if 0, dmenu appears at bottom     */
/* -fn option overrides fonts[0]; default X11 font or font set */
static const char *fonts[] = {
	"Hack:size=10"
};
static const char *prompt      = NULL;      /* -p  option; prompt to the left of input field */
// static const char col_acc[]    = GC_ac; //unify accent color
// static const char col_high[]   = GC_hi; //unify highlight color
// static const char col_bgr[]    = GC_bg; //unify bg color
static const char *colors[SchemeLast][2] = {
	/*     fg         bg       */
	[SchemeNorm] = { GC_fg, GC_bg },
	[SchemeSel] = { GC_ac, GC_bg },
	[SchemeSelHighlight] = { GC_hi, GC_bg },
	[SchemeNormHighlight] = { GC_hi, GC_bg },
	[SchemeOut] = { "#000000", "#00ffff" },
};
/* -l option; if nonzero, dmenu uses vertical list with given number of lines */
static unsigned int lines      = 4;

/*
 * Characters not considered part of a word while deleting words
 * for example: " /?\"&[]"
 */
static const char worddelimiters[] = " ";
