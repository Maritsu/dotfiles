/* user and group to drop privileges to */
static const char *user  = "nobody";
static const char *group = "nobody";

static const char *colorname[NUMCOLS] = {
	[INIT] =   "#242a32",     /* after initialization */
	[INPUT] =  "#beeeef",   /* during input */
	[FAILED] = "#ff017e",   /* wrong password */
};

/* treat a cleared input like a wrong password (color) */
static const int failonclear = 1;

/* time in seconds before the monitor shuts down */
static const int monitortime = 5;

/* don't allow control key to trigger fail on clear */
static const int controlkeyclear = 1;

/* Background image path, should be available to the user above */
static const char* background_image = "/home/bit/.wallpaper.jpg";
