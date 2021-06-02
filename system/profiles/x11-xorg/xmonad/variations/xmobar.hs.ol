-- http://projects.haskell.org/xmobar/
-- install xmobar with these flags: --flags="with_alsa" --flags="with_mpd" --flags="with_xft"  OR --flags="all_extensions"
-- you can find weather location codes here: http://weather.noaa.gov/index.html

Config { font    = "xft:Iosevka Nerd Font Mono:weight=Regular:pixelsize=12:antialias=true:hinting=true"
       , additionalFonts = [ "xft:Droid Sans:pixelsize=11:antialias=true:hinting=true"
                           , "xft:Iosevka Nerd Font:pixelsize=16:antialias=true:hinting=true"
                           , "xft:FontAwesome:pixelsize=13"
                           ]
       , textOffset = 19
       -- , bgColor = "#333333"
       , bgColor = "#000000"
       , fgColor = "#f5f5f5"
       , position = Static { xpos = 0, ypos = 0, width = 1366, height = 30 }
       , lowerOnStart = True
       , hideOnStart = False
       , allDesktops = True
       , persistent = True
       , iconRoot = "/home/shiva/.config/nixpkgs/role/config/xpms/"  -- default: "."
       , commands = [ 
                      -- Time and date
                      Run Date "<fn=1></fn>D : %b %d %Y" "date" 50
                    , Run Date "<fn=1></fn>T : %H:%M" "time" 50
                    , Run Network "wlp2s0" ["-t", "<fn=0> :</fn> <rx>kb <fn=0> :</fn> <tx>kb"] 20
                    , Run Cpu ["-t", "<fn=1></fn>C : <total>%","-H","50","--high","red"] 20
                    , Run Memory ["-t", "<fn=1>\xf233</fn> mem: <used>M (<usedratio>%)"] 20
                    , Run DiskU [("/", "<fn=1>\xf0c7</fn> hdd: <free> free")] [] 60
                    , Run MPD ["-t", "<state>: <artist> - <track>"] 10
                    , Run Com "uname" ["-r"] "" 3600 

                      -- Prints out the left side items such as workspaces, layout, etc.
                      -- The workspaces are 'clickable' in my configs.
                    , Run UnsafeStdinReader
                    ]
       , sepChar = "%"
       , alignSep = ")("
      -- , template = "%UnsafeStdinReader% )( <fc=#333333> %cpu% </fc> | <fc=#333333> %date% </fc> | <fc=#333333> %time% </fc> | <fc=#f5f5f5>  <action=`cmst -d -i Papirus-Dark`><icon=network.xpm/></action>  <action=`alacritty -h pfetch`><icon=cpu.xpm/></action>  <action=`alacritty -e htop`><icon=ram.xpm/></action>  </fc>"
       , template = " %UnsafeStdinReader% )( <fc=#f5f5f5> %cpu% </fc> | <fc=#f5f5f5> %date% </fc> | <fc=#f5f5f5> %time% </fc> | <fc=#f5f5f5> <action=`cmst -d -i Papirus-Dark`><icon=network.xpm/></action>  <action=`alacritty -h pfetch`><icon=cpu.xpm/></action>  <action=`alacritty -e htop`><icon=ram.xpm/></action>  </fc>"
      -- , template = "<fc=#5c6180> {</fc>%UnsafeStdinReader% )( <fc=#8be9fd> { %cpu% } </fc><fc=#ffb86c> { %date% } </fc><fc=#50fa7b> { %time% } </fc> <fc=#6272a4>{  <action=`cmst -d -i Papirus-Dark`><icon=network.xpm/></action>  <action=`alacritty -h pfetch`><icon=cpu.xpm/></action>  <action=`alacritty -e htop`><icon=ram.xpm/></action>  } </fc>"
      -- , template = "  <action=`xdotool key super+Return`><icon=menu.xpm/></action>  %UnsafeStdinReader% } <fc=#689d6a>  %cpu% </fc> | <fc=#d79921> %date% </fc> |<fc=#a0cf44>  %time%  </fc> {  <action=`xdotool key super+Return`><icon=network.xpm/></action>  <action=`xdotool key super+Return`><icon=cpu.xpm/></action>  <action=`xdotool key super+Return`><icon=ram.xpm/></action>   "
       }
