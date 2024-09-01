# Wallpaper-helper

**This is currently work in progress! Some features are missing.**

## What?
A simple to use wallpaper helper for automatically setting or switching wallpapers
in hyprland, without having to type out monitor names or file paths.

## Why?
I am building this tool because I find it frustrating to run manual commands
to set my wallpaper, and I know that this can be automated very easily.

## How?
This tool recursively finds all jpgs and pngs in a given directory, by default
~/Pictures/wallpapers. It uses commands from the wallpaper daemon to
find the currently applied wallpaper, and applies the next (or previous!)
in the order they appear in the filesystem.

The applied wallpaper is stored in a file, which can be used to reapply
the selected wallpaper upon startup. This is the --init function.
Default location for the file is ~/.config/wallpaper-helper/wallpaper.

The program also works without this file, which can be enabled with 
--nofile. In this case, it will just use the loaded wallpaper to set
the next. If none is set, it will use the first in the list.

# Example usage:
I launch and run it through hyprland.

wallpaper-helper is placed alongside hyprland in
~/.config/hypr.
```
#hyprland.conf

exec-once = hyprpaper & mako & waybar
exec-once = ~/.config/hypr/wallpaper-helper.sh -i

bind = $mod, n, exec, ~/.config/hypr/wallpaper-helper.sh -n
bind = $mod SHIFT, n, exec, ~/.config/hypr/wallpaper-helper.sh -p
```

# Features:

## -h, --help
A "help" function will display all command line flags,
as well as (eventually) config information.

## -v, --verbose
Verbose redirects all output to stdout, so that you can see
what goes wrong.

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
This is simply the full path to the selected wallpaper.
Default: $XDG_CONFIG_DIR/wallpaper-helper/wallpaper.

# Planned features:

## -w, --wallpaper-daemon
Which wallpaper utility to use.
Default: hyprpaper. 
Eventually, support for other wlroots wallpapers will be added,
such as 

## Config
Later, support for a config file MAY be added. 
This will most likely just be the default flags or options that will be passed
to the program, such as wallpaper directory, which wallpaper daemon is used,
and so on.

## Multi monitor support
It will also just work on one monitor, which is the first one to alphabetically appear.
Later, I will add support for multiple monitors, through a command line flag.
This flag will be -m, for monitor, and can be either the name of a monitor "eDP-1", "DP-1",
or the index 0, 1, etc.

# Notes
If you want a more intuitive UI, try [waypaper](https://github.com/anufrievroman/waypaper).
Wallpaper-helper is mostly intended to use upon startup, and to automate using keybinds.
