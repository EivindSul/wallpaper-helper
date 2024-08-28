# Wallpaper-utility

**This is currently work in progress! Nothing works as of yet.**

## What?
A simple to use wallpaper utility for automatically setting or switching wallpapers
in hyprland, without having to type out monitor names or file paths.

## Why?
I am building this tool because I find it frustrating to run manual commands
to set my wallpaper, and I know that this can be automated very easily.

## How?
I am making some simple functions that should be easily customizable,
so you can tailor them to your needs (i.e, making it work for other window managers).

The init function reads the selected wallpaper from a file. If none is
selected, it will select one for you so you are not left with a black desktop!
If it does not find any, it will promplty send a desktop notification to alert
you that it did not perform its job.

The switch function will look for wallpapers in a directory, the default is
~/Pictures/wallpapers. Note the uppercase P in Pictures and lowercase
w in wallpapers, I have a strange naming pattern.
Anyways, a "find" command looks in this directory, and in all 
sub-directories, for .jpgs and .pngs. These are all added to a list.

The progam uses "hyprctl hyprpaper listactive" to get the currently
set wallpaper, and fetches the next in order from the list of all
wallpapers. It uses "hyprctl hyprpaper preload" and 
"hyprctl hyprpaper wallpaper" to set the wallpaper to this new selection.

The path to the new wallpaper is stored in a cache file in the directory
with this program, namely "selected-wallpaper".
This is read when using the init function, to make wallpaper selections persistent.

This is my first proper shell utility, so feel free to message me or make an issue/PR
if you have some advice on how to make it better! :)

# Planned features:

## -h, --help
A "help" function will display all command line flags,
as well as (eventually) config information.

## -i, --init
An "init" function will make sure that a valid wallpaper is set upon login.
It will be set from the selected-wallpaper file if it exists.

## -n, --next
A "switch" function will change the wallpaper forward. If no wallpaper is set,
switch will call "init".

## -p, --previous
A "switch-backwards" function will do the same logic as "switch", but will
reverse the list of wallpapers somewhere throughout the function.
This will let the user change wallpapers back to the previous selection, so
that they dont need to cycle through all the wallpapers again.

## -d, --directory
The directory in which to look for wallpapers.
Default: ~/Pictures/wallpapers.

## -f, --file
Where to look for selected-wallpaper.
Default: TODO.

## Config
Later, support for a config file MAY be added. 
This will most likely just be the default flags or options that will be passed
to the program, such as wallpaper directory, which wallpaper daemon is used,
and so on.

# MVP
Initially, the program will just support hyprland and hyprpaper, with no config file.

It will also just work on one monitor, which is the first one to alphabetically appear.
Later, I will add support for multiple monitors, through a command line flag.
This flag will be -m, for monitor, and can be either the name of a monitor "eDP-1", "DP-1",
or the index 0, 1, etc.

