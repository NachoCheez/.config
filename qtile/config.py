

from typing import List  # noqa: F401

from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal


# Autostart
import os
import subprocess
from libqtile import hook


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    #subprocess.Popen([home + '/.config/qtile/autostart.sh'])
    subprocess.Popen([home + '/.config/qtile/brightness.sh'])



mod = "mod4"
terminal = "alacritty"

keys = [
    # Rofi
    Key([mod], "space", lazy.spawn("rofi -combi-modi drun -font 'Fira Code Nerd Font 18' -show combi -icon-theme 'Papirus' -show-icons")),
     
    # Lock Screen
    Key([mod],"l", lazy.spawn("betterlockscreen -l")),

    # Volume
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -D pulse sset Master 2%+")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -D pulse sset Master 2%-")),
    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse sset Master toggle")),

    # Brightness
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 1%+")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 1%-")),

    # Nightlight
    Key([mod], "n", lazy.spawn("redshift -P -O 5000")),
    Key([mod, "shift"], "n", lazy.spawn("redshift -x")),

    # Switch between windows
    Key([mod], "Tab", lazy.layout.down(), desc="Move focus down"),
    Key([mod, "shift"], "Tab", lazy.layout.up(), desc="Move focus up"),


    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod], "Left", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod], "Right", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod], "Down", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod], "Up", lazy.layout.shuffle_up(), desc="Move window up"),


    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    #Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),


    # Launch terminal
    Key([mod], "Return", lazy.spawn(terminal), desc="Launch terminal"),

    # Dmenu
    #Key([mod], "s", lazy.spawn(dmenu) , desc="launch dmenu"),

    # Toggle between different layouts as defined below
    Key([mod, "shift"], "l", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile"),
    
]

groups = [Group(i) for i in "12345"]

for i in groups:
    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], i.name, lazy.group[i.name].toscreen(),
            desc="Switch to group {}".format(i.name)),

        # mod1 + shift + letter of group = switch to & move focused window to group
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name, switch_group=True),
            desc="Switch to & move focused window to group {}".format(i.name)),
        # Or, use below if you prefer not to switch to that group.
        # # mod1 + shift + letter of group = move focused window to group
        # Key([mod, "shift"], i.name, lazy.window.togroup(i.name),
        #     desc="move focused window to group {}".format(i.name)),
    ])

layout_theme = {"border_width":4,
"margin":10,
"border_focus": "d77bc6",
"border_normal":"81a1c1"}

layouts = [
    #layout.Columns(border_focus_stack='#d75f5f'),
    # layout.Max(),
    # Try more layouts by unleashing below layouts.
    # layout.Stack(num_stacks=2),
    # layout.Bsp(),
    # layout.Matrix(),
    layout.MonadTall(**layout_theme),
    # layout.MonadWide(),
    # layout.RatioTile(),
    # layout.Tile(),
    # layout.TreeTab(),
    # layout.VerticalTile(),
    # layout.Zoomy(),
    layout.Floating(**layout_theme),
]

widget_defaults = dict(
    font='sans',
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        wallpaper='~/Pictures/n1.jpg',
        wallpaper_mode='fill',
        top=bar.Bar(
            [
                widget.GroupBox(
                    font="Siji",
                    fontsize=18,
                    highlight_method="block",
                    rounded=False,
                    padding_x=5,
                    padding_y=5,
                    active="#ffffff",
                    inactive="#959595",
                    this_current_screen_border="5e81ac",
                    urgent_border="bf616a",
                    disable_drag=True
                ),
                widget.Sep(
                    linewidth=0,
                    padding=10
                ),
                widget.Prompt(
                    font="Siji",
                    fontsize=18,
                    foreground="38FC55"
                ),
                widget.TextBox(
                    text=" ",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="88c0d0"
                ),
                widget.WindowName(
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="88c0d0",
                    max_chars=70
                ),
                widget.Systray(),
                widget.TextBox(
                    text="",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="bf616a"
                ),
                widget.CPU(
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="eceff4",
                    format="CPU {load_percent}%"
                ),
                widget.TextBox(
                    text="    ",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="a3be8c"
                ),
                widget.Memory(
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="eceff4",
                    format="{MemUsed: } /{MemTotal: } MB"
                ),
                widget.TextBox(
                    text="    ",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="88c0d0"
                ),
                widget.PulseVolume(
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="eceff4"
                ),
                widget.Battery(
                    font="SF Pro Display",
                    fontsize=18,
                    charge_char='     ',
                    discharge_char="     ",
                    full_char='     ',
                    format="{char} {percent:2.0%}",
                    foreground="eceff4"
                ),
                widget.TextBox(
                    text="     ",
                    font="SF Pro Display",
                    fontsize=18,
                    foreground="b48ead"
                ),
                widget.Clock(
                    font="Siji",
                    fontsize=18,
                    format="%a  %m/%d/%Y   %H : %M : %S",
                    foreground="eceff4"
                ),
                widget.Sep(
                    linewidth=0,
                    padding=10
                )
            ],
            28,
            background = "#2e3440",
            opacity = 1
        ),
    ),
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
main = None  # WARNING: this is deprecated and will be removed soon
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"

