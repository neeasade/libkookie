{ i3 }:

{
  enable = true;
  package = i3;
  config = rec {
    modifier = "Mod4";

    # Use iosevka as default font
    fonts = [ "iosevka-term-ss09 10" ];

    keybindings = {

      # Start a terminal
      "${modifier}+Return"  = "exec kitty";

      # Close individual windows
      "${modifier}+Shift+q" = "kill";

      # Start software on <this> or <other> workspace
      "${modifier}+d" = "exec dmenu_run";
      "${modifier}+Shift+d" = "exec ~/.config/i3/dynamic-tagging/i3-dtags-new.sh";

      # Move focus around - vim style
      "${modifier}+h" = "focus left";
      "${modifier}+j" = "focus down";
      "${modifier}+k" = "focus up";
      "${modifier}+l" = "focus right";

      # Move focus around - boring style
      "${modifier}+Left" = "focus left";
      "${modifier}+Down" = "focus down";
      "${modifier}+Up" = "focus up";
      "${modifier}+Right" = "focus right";

      # Move windows - vim style
      "${modifier}+Shift+h" = "move left";
      "${modifier}+Shift+j" = "move down";
      "${modifier}+Shift+k" = "move up";
      "${modifier}+Shift+l" = "move right";

      # Move windows - boring style
      "${modifier}+Shift+Left" = "move left";
      "${modifier}+Shift+Down" = "move down";
      "${modifier}+Shift+Up" = "move up";
      "${modifier}+Shift+Right" = "move right";

      # Move workspaces between multi-monitor setups
      "${modifier}+Ctrl+Shift+Right" = "move workspace to output right";
      "${modifier}+Ctrl+Shift+Left" = " move workspace to output left";

      # Define split behaviours
      "${modifier}+2" = "split h";
      "${modifier}+1" = "split v";

      # A very fortunate lockscreen
      "${modifier}+Ctrl+l" = "exec --no-startup-id locker";

      # Rename workspaces
      "${modifier}+Ctrl+r" = "exec i3-input -F 'rename workspace to \"%s\"' -P 'New name: '";

      # Switch to workspace (optionally dragging windows with)
        "${modifier}+s" = "exec /home/spacekookie/.config/i3/dynamic-tagging/i3-dtags.sh -fn '$dfont'";
        "${modifier}+Shift+s" = "exec $HOME/.config/i3/dynamic-tagging/i3-dtags-moveto.sh -fn '$dfont'";

        # Some layout modifiers
        "${modifier}+e" = "layout default";
        "${modifier}+w" = "layout tabbed";
        "${modifier}+q" = "layout stacked";

        # Do I even use this?!
        "${modifier}+Shift+space" = "floating toggle";
        "${modifier}+space" = "focus mode_toggle";

        # Focus the parent containers
        "${modifier}+a" = "focus parent";

        # Audio is good actually
        "XF86AudioRaiseVolume" = "exec --no-startup-id pactl set-sink-volume 0 +5%";
        "XF86AudioLowerVolume" = "exec --no-startup-id pactl set-sink-volume 0 -5%";
        "XF86AudioMute" = "exec --no-startup-id pactl set-sink-mute 0 toggle";

        # So is brightness control :)
      "XF86MonBrightnessUp" = "exec xbacklight -inc 5";
      "XF86MonBrightnessDown" = "exec xbacklight -dec 5";

      # Reload, restart and quit i3
      "${modifier}+Shift+c" = "reload";
      "${modifier}+Shift+r" = "restart";
      "${modifier}+Shift+e" = "exec i3-nagbar -t warning -m 'Workspaces are sentient, you know. We just have a lot of them' 'i3-msg exit'";

      # Switch to resize mode (defined below)
      "${modifier}+r" = "mode \"resize\"";

      # What was this again?!
      "button4" = "nop";
      "button5" = "nop";
    };

    modes = {

      # Explicitly handle the resize mode
      resize = {
        "h" = "resize shrink width 5 px or 5 ppt";
        "j" = "resize grow height 5 px or 5 ppt";
        "k" = "resize shrink height 5 px or 5 ppt";
        "l" = "resize grow width 5 px or 5 ppt";

        # same bindings, but for the arrow keys
        "Left" = "resize shrink width 5 px or 5 ppt";
        "Down" = "resize grow height 5 px or 5 ppt";
        "Up" = "resize shrink height 5 px or 5 ppt";
        "Right" = "resize grow width 5 px or 5 ppt";

        # back to normal: Enter or Escape or $mod+r
        "Return" = "mode \"default\"";
        "Escape" = "mode \"default\"";
        "$mod+r" = "mode \"default\"";
      } ;
    };

    bars = [{
      statusCommand = "i3status";
      fonts = [ "iosevka-term-ss09 10" ];
      position = "bottom";
      #workspace_buttons = true;
      colors = {
        background = "#0F0F0F";
        statusline = "#D5D5D5";
      };
      # extraConfig = ''
      #   bindsym button4 nop
      #   bindsym button5 nop
      # '';
    }];
  };

  # TODO: Find a more `nix` way of handling these
  extraConfig = ''
    # Compton
    exec_always --no-startup-id "killall -q compton; compton --config ~/.config/i3/compton.conf"

    # Make CAPSLOCK into ESC because it's 2018
    exec_always --no-startup-id "xmodmap -e 'clear lock' #disable caps lock switch"
    exec_always --no-startup-id "xmodmap -e 'keysym Caps_Lock = Escape' #set caps_lock as escape"
    exec_always --no-startup-id "setxkbmap -layout crumbs intl -option caps:escape"

    # Set a wallpaper
    exec --no-startup-id feh --bg-fill ~/Pictures/Wallpapers/robot-wallpaper-pack-1080p-hd.jpg

    # Start redshift automatically
    exec redshift-gtk

    # Start the nm-tray thingy
    exec nm-tray

    # Syncthing is kinda important!
    exec "syncthing-gtk -m -s"

    # Layout and design settings that should _really_ be in the module
    default_border pixel 3
    client.focused #4c7899 #285577 #ffffff #F73E5F #666666
  '';
}
