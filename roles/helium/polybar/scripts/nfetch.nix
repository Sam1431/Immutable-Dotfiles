{ }:
''
# Terminal code stolen from 6gk
# https://github.com/6gk/fet.sh/blob/d31ae95231d640f0c4e6c48fd2918fc6dd88dd84/fet.sh#L11-L26
while [ ! "$term" ]; do
	while IFS=':	' read -r key val; do
		case $key in
			PPid) ppid=$val; break;;
		esac
	done < "/proc/''${ppid:-$PPID}/status"
	read -r name < "/proc/$ppid/comm"
	case $name in
		*sh) ;;
		"''${0##*/}") ;;
		*[Ll]ogin*|*init*) term=linux;;
		*) term="$name";;
	esac
done
## Packages
nix-user-pkgs() {
                    nix-store -qR ~/.nix-profile
                    nix-store -qR /etc/profiles/per-user/"$USER"
}
## WM Name
id_bloat=$(xprop -root _NET_SUPPORTING_WM_CHECK)
id=''${id_bloat##* }
wm_bloat=$(xprop -id "$id" _NET_WM_NAME)
## Get the fetch info 
user="''${USER}"
host="$(hostname)"
distro=$(. /etc/os-release ; echo "$ID")
shell="$(basename ''${SHELL})"
packages="$(nix-store -qR /run/current-system/sw | wc -l) (sys), $(nix-user-pkgs | wc -l) (usr)"
wm="$(echo $wm_bloat | cut -d'"' -f 2)"
# Colors and formatting
bold='\033[1m'
white='\033[37m'
blue='\033[34m'
bright_black='\033[30;1m'
cyan='\033[36m'
reset='\033[0m'
cr="''${reset}"
c0="''${reset}''${bold}"
# Print out the actual fetch
printf '%b' "
''${c0}''${blue}''${user}''${c0}@''${cyan}''${host}''${reset}
''${cyan}      ----      ''${c0}''${blue} os ''${reset}''${c0}''${blue}  ''${cr}''${white}''${distro}''${reset} 
''${cyan}     / O O\     ''${c0}''${blue} wm ''${reset}''${c0}''${blue}  ''${cr}''${white}''${wm}''${reset}
''${cyan}    |      |    ''${c0}''${blue} tm ''${reset}''${c0}''${blue}  ''${cr}''${white}''${term}''${reset}
''${cyan}    |/\/\/\|    ''${c0}''${blue} pk ''${reset}''${c0}''${blue}  ''${cr}''${white}''${packages}''${reset}
''${bright_black}   ----------   ''${c0}''${blue} sh ''${reset}''${c0}''${blue}  ''${cr}''${white}''${shell}''${reset}
"
''
