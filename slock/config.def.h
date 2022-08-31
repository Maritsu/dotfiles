/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nogroup";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#242a32",     /* after initialization */
	[INPUT] =  "#845ae3",   /* during input */
	[FAILED] = "#beeeef",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds before the monitor shuts down */
static const int monitortime = 5;

/* don't allow control key to trigger fail on clear */
static const int controlkeyclear = 1;
