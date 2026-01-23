from libqtile import bar, layout, widget, hook
from libqtile.config import Key, Screen, Group, Match, Drag, Click
from libqtile.lazy import lazy
from libqtile.layout import Spiral
# Standard library
import os
import subprocess

# Qtile Extras (make sure you have qtile-extras installed)
from qtile_extras.widget import Volume, Backlight, CurrentLayoutIcon, WindowName





mod = "mod4"
terminal = "kitty"

colors = []

colors = []

#pywal stuff

import os
colors = []
cache = os.path.expanduser('~/.cache/wal/colors')

def load_colors(cache):
    with open(cache, 'r') as file:
        for i in range(8):
            colors.append(file.readline().strip())
    colors.append('#ffffff')  # fallback color
    lazy.reload()

load_colors(cache)

keys = [
    # Focus windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),
    Key([mod], "space", lazy.layout.next(), desc="Move window focus to other window"),

    # Move windows
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(), desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(), desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(), desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    # Grow windows
    Key([mod, "control"], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
    Key([mod, "control"], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
    Key([mod, "control"], "j", lazy.layout.grow_down(), desc="Grow window down"),
    Key([mod, "control"], "k", lazy.layout.grow_up(), desc="Grow window up"),
    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle split stack
    Key([mod, "shift"], "Return", lazy.layout.toggle_split(), desc="Toggle split/unsplit stack"),

    # Launchers
    Key([mod], "Return", lazy.spawn("kitty"), desc="Launch kitty terminal"),
    Key([mod, "shift"], "Return", lazy.spawn("rofi -show run"), desc="Launch rofi run launcher"),
    Key([mod], "w", lazy.spawn("firefox"), desc="Launch Firefox"),
    Key([mod], "b", lazy.spawn("./scripts/rofi/launcher.sh"), desc="Rofi Master Launcher"),

    # Layouts and windows
    Key([mod], "f", lazy.window.toggle_fullscreen(), desc="Toggle fullscreen on focused window"),
    Key([mod], "q", lazy.window.kill(), desc="Kill focused window"),
    Key([mod, "shift"], "q", lazy.shutdown(), desc="Shutdown Qtile (logout)"),
    Key([mod], "t", lazy.window.toggle_floating(), desc="Toggle floating on focused window"),
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload config"),
    Key([mod], "r", lazy.spawncmd(), desc="Spawn command using prompt widget"),

    # Restart/Quit Qtile
    Key([mod, "control"], "r", lazy.reload_config(), desc="Reload config"),
    Key([mod, "control"], "q", lazy.shutdown(), desc="Shutdown Qtile"),

    # Volume Control 
    Key([], "XF86AudioRaiseVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ +5%")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ -5%")),
    Key([], "XF86AudioMute", lazy.spawn("pactl set-sink-mute @DEFAULT_SINK@ toggle")),

    # Brightness Control
    Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set +10%")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 10%-")),
]

groups = [Group(i) for i in "123456789"]

for i in groups:
    keys.extend([
        Key([mod], i.name, lazy.group[i.name].toscreen(), desc="Switch to group {}".format(i.name)),
        Key([mod, "shift"], i.name, lazy.window.togroup(i.name), desc="Move focused window to group {}".format(i.name)),
    ])

layouts = [
    layout.Columns(
        margin=[5,5,5,5],  # outer gaps (top, right, bottom, left)
        border_focus= "#ffffff",
        border_normal="#000000",
        border_width= 2 # birder wudtg
    ),
    layout.Max(),
    Spiral(
        margin=[5,5,5,5],
        border_focus=colors[7],
        border_normal="#000000",
        border_width=2,
        clockwise=True,
        main_pane='left',
        ratio=0.618,
        ratio_increment=0.05,
        new_client_position='top'
    ),
]


widget_defaults = dict(
    font="DejaVuSansMono",
    fontsize=14,
    padding=5,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        bottom=bar.Bar(
            [
                # Workspaces
                widget.GroupBox(highlight_method='line',
                    active=colors[7],
                    background="#000000",
                    
                ),

                # Layout Switcher
                CurrentLayoutIcon(scale=0.5, mouse_callbacks={"Button1": lazy.next_layout()}),

                # Current Window Name (Pywal-colored)
                widget.WindowName(
                    background=colors[0],
                    foreground="#ffffff",
                ),

                # Push the rest to the right
                widget.Spacer(),

                # Memory Usage
                widget.Memory(format="🧠 {MemUsed:.0f}{mm}", measure_mem='M',
                background="#000000",
                foreground="#ffffff",
                ),

                

                # Battery Widget
                widget.Battery(
                    format="🔋 {percent:2.0%}",
                    low_foreground="FF0000",
                    low_percentage=0.2,
                    show_short_text=False,
                    background="#000000",
                    foreground="#ffffff",
                ),

                # Brightness
                Backlight(fmt="☀️ {}", backlight_name="intel_backlight",
                background="#000000",
                foreground="#ffffff",
                ),

                # Volume
                Volume(fmt="🔊 {}",
                background="#000000",
                foreground="#ffffff",
                ),

                # Clock (date + time)
                widget.Clock(format="📅 %Y-%m-%d",
                background="#000000",
                foreground="#ffffff",
                ),
                widget.Clock(format="🕒 %I:%M %p",
                background="#000000",
                foreground="#ffffff",
                ),

                # System Tray
                widget.Systray(),
            ],
            28,
            opacity=0.85,
            background=colors[0],
        ),
    ),
]


mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front()),
]

dgroups_key_binder = None
dgroups_app_rules = []
follow_mouse_focus = True
bring_front_click = False
floats_kept_above = True
cursor_warp = False

floating_layout = layout.Floating(
    float_rules=[
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),
        Match(wm_class="makebranch"),
        Match(wm_class="maketag"),
        Match(wm_class="ssh-askpass"),
        Match(title="branchdialog"),
        Match(title="pinentry"),
    ]
)

auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True
auto_minimize = True
wl_input_rules = None
wl_xcursor_theme = None
wl_xcursor_size = 24

@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser("~")
    subprocess.Popen([home + "/.config/qtile/autostart.sh"])

wmname = "LG3D"
