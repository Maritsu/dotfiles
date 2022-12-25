/* See LICENSE file for copyright and license details. */
#include "../colors.h"

/* appearance */
static const unsigned int borderpx  = 1;        /* border pixel of windows */
static const unsigned int snap      = 32;       /* snap pixel */
static const unsigned int gappih    = 8;       /* horiz inner gap between windows */
static const unsigned int gappiv    = 8;       /* vert inner gap between windows */
static const unsigned int gappoh    = 8;       /* horiz outer gap between windows and screen edge */
static const unsigned int gappov    = 8;       /* vert outer gap between windows and screen edge */
static       int smartgaps          = 0;        /* 1 means no outer gap when there is only one window */
static const int showbar            = 1;        /* 0 means no bar */
static const int topbar             = 1;        /* 0 means bottom bar */
static const int usealtbar          = 1;        /* 1 means use non-dwm status bar */
static const char *altbarclass      = "Polybar"; /* Alternate bar class name */
static const char *alttrayname      = "tray";    /* Polybar tray instance name */
static const char *altbarcmd        = ""; /* Alternate bar launch command */
static const char *fonts[]          = { GC_fn };
// static const char dmenufont[]       = GC_fn;
static const char col_gray1[]       = "#222222";
static const char col_gray2[]       = "#444444";
static const char col_gray3[]       = "#bbbbbb";
static const char col_gray4[]       = "#eeeeee";
static const char col_cyan[]        = "#005577";
static const char *colors[][3]      = {
	/*               fg         bg         border   */
	[SchemeNorm] = { GC_fg, GC_bg, GC_bg },
	[SchemeSel]  = { GC_ac, GC_bg, GC_ac },
};

/* tagging */
static const char *tags[] = { "", "", "", "", "", "", "", "力" };

static const Rule rules[] = {
	/* xprop(1):
	 *	WM_CLASS(STRING) = instance, class
	 *	WM_NAME(STRING) = title
	 */
	/* class      instance    title       tags mask     isfloating   monitor */
	{ "Gimp",     NULL,       NULL,       0,            1,           -1 },
	{ "Firefox",  NULL,       NULL,       0,	        0,           -1 },
	{ "mpv",	  NULL,		  NULL,		  0,			1,			 -1 },
	{ "USC-Game", NULL,		  NULL,		  0,			0,			 -1 },
};

/* layout(s) */
static const float mfact     = 0.50; /* factor of master area size [0.05..0.95] */
static const int nmaster     = 1;    /* number of clients in master area */
static const int resizehints = 1;    /* 1 means respect size hints in tiled resizals */
static const int lockfullscreen = 1; /* 1 will force focus on the fullscreen window */

#define FORCE_VSPLIT 1  /* nrowgrid layout: force two clients to always split vertically */
#include "vanitygaps.c"

static const Layout layouts[] = {
	/* symbol     arrange function */
	{ " ",      tile },    /* first entry is default */
	{ "𤋮",      centeredmaster },
	{ " ",      NULL },    /* no layout function means floating behavior */
	// { " cmas",      centeredfloatingmaster },
	{ " ",      monocle },
	// { "[@]",      spiral },
	// { "[\\]",     dwindle },
	// { "D[]",      deck },
	// { "TTT",      bstack },
	// { "===",      bstackhoriz },
	// { "HHH",      grid },
	// { "###",      nrowgrid },
	// { "---",      horizgrid },
	// { ":::",      gaplessgrid },
	{ NULL,       NULL },
};

/* key definitions */
#define MODKEY Mod4Mask
#define TAGKEYS(KEY,TAG) \
	{ MODKEY,                       KEY,      view,           {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask,           KEY,      toggleview,     {.ui = 1 << TAG} }, \
	{ MODKEY|ShiftMask,             KEY,      tag,            {.ui = 1 << TAG} }, \
	{ MODKEY|ControlMask|ShiftMask, KEY,      toggletag,      {.ui = 1 << TAG} },

/* helper for spawning shell commands in the pre dwm-5.0 fashion */
#define SHCMD(cmd) { .v = (const char*[]){ "/bin/sh", "-c", cmd, NULL } }

/* commands */
static char dmenumon[2] = "0"; /* component of dmenucmd, manipulated in spawn() */
static const char *dmenucmd[] = { "dmenu_run", "-m", dmenumon, "-p", "Run", NULL };
static const char *termcmd[]  = { "alacritty", NULL };
static const char *lockcmd[]  = { "slock", NULL };
static const char *killcmd[]  = { "pkill", "dwm", NULL };

/* Volume control buttons
 * Hex values taken from XF86 keysym
 */
#define XK_ANY_MOD 0 // idk it works
#define XK_VolUp 0x1008FF13
#define XK_VolDown 0x1008FF11
#define XK_VolM 0x1008FF12
#define XK_BrUp 0x1008FF02
#define XK_BrDown 0x1008FF03
#define XK_AuPlay 0x1008FF14
#define XK_AuStop 0x1008FF15
#define XK_AuPrev 0x1008FF16
#define XK_AuNext 0x1008FF17

static Key keys[] = {
	/* modifier                     key        function        argument */
	{ MODKEY,                       XK_p,      spawn,          {.v = dmenucmd } },
	{ MODKEY,                       XK_Return, spawn,          {.v = termcmd } },
	// { MODKEY,                       XK_b,      togglebar,      {0} },
	{ MODKEY,                       XK_j,      focusstack,     {.i = +1 } },
	{ MODKEY,                       XK_k,      focusstack,     {.i = -1 } },
	// { MODKEY,                       XK_i,      incnmaster,     {.i = +1 } },
	// { MODKEY,                       XK_d,      incnmaster,     {.i = -1 } },
	{ MODKEY,                       XK_h,      setmfact,       {.f = -0.05} },
	{ MODKEY,                       XK_l,      setmfact,       {.f = +0.05} },
	{ MODKEY|ShiftMask,             XK_j,      setcfact,       {.f = +0.25} },
	{ MODKEY|ShiftMask,             XK_k,      setcfact,       {.f = -0.25} },
	{ MODKEY|ShiftMask,             XK_o,      setcfact,       {.f =  0.00} },
	{ MODKEY,                       XK_z,      zoom,           {0} },
	{ MODKEY,                       XK_Tab,    view,           {0} },
	{ MODKEY|ShiftMask,             XK_c,      killclient,     {0} },
	{ MODKEY|Mod1Mask,              XK_t,      setlayout,      {.v = &layouts[0]} },
	{ MODKEY|Mod1Mask,              XK_c,      setlayout,      {.v = &layouts[1]} },
	{ MODKEY|Mod1Mask,              XK_m,      setlayout,      {.v = &layouts[3]} },
	// { MODKEY,                       XK_space,  setlayout,      {0} },
	{ MODKEY|ShiftMask,             XK_space,  togglefloating, {0} },
	// { MODKEY,                       XK_0,      view,           {.ui = ~0 } },
	// { MODKEY|ShiftMask,             XK_0,      tag,            {.ui = ~0 } },
	{ MODKEY,                       XK_comma,  focusmon,       {.i = -1 } },
	{ MODKEY,                       XK_period, focusmon,       {.i = +1 } },
	{ MODKEY|ShiftMask,             XK_comma,  tagmon,         {.i = -1 } },
	{ MODKEY|ShiftMask,             XK_period, tagmon,         {.i = +1 } },
	TAGKEYS(                        XK_1,                      0)
	TAGKEYS(                        XK_2,                      1)
	TAGKEYS(                        XK_3,                      2)
	TAGKEYS(                        XK_4,                      3)
	TAGKEYS(                        XK_5,                      4)
	TAGKEYS(                        XK_6,                      5)
	TAGKEYS(                        XK_7,                      6)
	TAGKEYS(                        XK_8,                      7)
	// TAGKEYS(                        XK_9,                      8)
	// TAGKEYS(                        XK_0,                      9)
	{ MODKEY|ShiftMask,             XK_q,      quit,           {0} },
	// { MODKEY|ShiftMask,             XK_q,      spawn,          {.v = killcmd } },
	{ MODKEY|ControlMask,           XK_q,      spawn,          {.v = killcmd } },
	{ MODKEY|ShiftMask,	 	        XK_w,      spawn,          SHCMD("polybar-msg cmd restart") },
	{ MODKEY|ShiftMask,             XK_l,      spawn,          {.v = lockcmd } },
	{ MODKEY|ShiftMask,             XK_p,      spawn,          SHCMD("$HOME/src/wm/screenshot.sh") },
	{ XK_ANY_MOD,					XK_VolUp,  spawn,		   SHCMD("$HOME/src/wm/volume.sh 5") },	// Decrease vol by 5%
	{ XK_ANY_MOD,					XK_VolDown,spawn,		   SHCMD("$HOME/src/wm/volume.sh -5") },	// Increase vol by 5%
	{ XK_ANY_MOD,					XK_VolM,   spawn,                  SHCMD("$HOME/src/wm/volume.sh 0") },	// Toggle mute
	{ XK_ANY_MOD,					XK_BrUp,   spawn,		   SHCMD("$HOME/src/wm/bright.sh 5%+") },	// Increase brightness by 5%
	{ XK_ANY_MOD,					XK_BrDown, spawn,		   SHCMD("$HOME/src/wm/bright.sh 5%-") },	// Decrease brightness by 5%
	{ XK_ANY_MOD,					XK_AuPlay, spawn,		   SHCMD("$HOME/src/wm/player.sh play-pause") },
	{ XK_ANY_MOD,					XK_AuStop, spawn,		   SHCMD("$HOME/src/wm/player.sh stop") },
	{ XK_ANY_MOD,					XK_AuPrev, spawn,		   SHCMD("$HOME/src/wm/player.sh previous") },
	{ XK_ANY_MOD,					XK_AuNext, spawn,		   SHCMD("$HOME/src/wm/player.sh next") },
	{ MODKEY,					XK_d,	   spawn,		   SHCMD("dunstctl set-paused toggle") },	// Toggle DND mode
};

/* button definitions */
/* click can be ClkTagBar, ClkLtSymbol, ClkStatusText, ClkWinTitle, ClkClientWin, or ClkRootWin */
static const Button buttons[] = {
	/* click                event mask      button          function        argument */
	{ ClkLtSymbol,          0,              Button1,        setlayout,      {0} },
	{ ClkLtSymbol,          0,              Button3,        setlayout,      {.v = &layouts[2]} },
	{ ClkWinTitle,          0,              Button2,        zoom,           {0} },
	{ ClkStatusText,        0,              Button2,        spawn,          {.v = termcmd } },
	{ ClkClientWin,         MODKEY,         Button1,        movemouse,      {0} },
	{ ClkClientWin,         MODKEY,         Button2,        togglefloating, {0} },
	{ ClkClientWin,         MODKEY,         Button3,        resizemouse,    {0} },
	{ ClkTagBar,            0,              Button1,        view,           {0} },
	{ ClkTagBar,            0,              Button3,        toggleview,     {0} },
	{ ClkTagBar,            MODKEY,         Button1,        tag,            {0} },
	{ ClkTagBar,            MODKEY,         Button3,        toggletag,      {0} },
};

static const char *ipcsockpath = "/tmp/dwm.sock";
static IPCCommand ipccommands[] = {
  IPCCOMMAND(  view,                1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  toggleview,          1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  tag,                 1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  toggletag,           1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  tagmon,              1,      {ARG_TYPE_UINT}   ),
  IPCCOMMAND(  focusmon,            1,      {ARG_TYPE_SINT}   ),
  IPCCOMMAND(  focusstack,          1,      {ARG_TYPE_SINT}   ),
  IPCCOMMAND(  zoom,                1,      {ARG_TYPE_NONE}   ),
  IPCCOMMAND(  incnmaster,          1,      {ARG_TYPE_SINT}   ),
  IPCCOMMAND(  killclient,          1,      {ARG_TYPE_SINT}   ),
  IPCCOMMAND(  togglefloating,      1,      {ARG_TYPE_NONE}   ),
  IPCCOMMAND(  setmfact,            1,      {ARG_TYPE_FLOAT}  ),
  IPCCOMMAND(  setlayoutsafe,       1,      {ARG_TYPE_PTR}    ),
  IPCCOMMAND(  quit,                1,      {ARG_TYPE_NONE}   )
};

