![BeFunky-snapshot](https://user-images.githubusercontent.com/68412503/120468937-61af9980-c3bf-11eb-99c5-e372df400147.png)

### Info

****
- Switched From Xmonad to Sway 
- Roles System with Roles named after Noble Gases 
- Terminal Switched to Kitty / Foot
- Each Role Contains a different setup 
- Wrote a Custom Bash wrapper for Nix/NIXOS ( coming soon ) ( inspired by Guix )

****

### ANCIENT LAYOUT ( MODULAR STYLE ) - Too Simple

```
Nixpkgs
  |
  |------- Machine
  |
  |------- Modules
  |         |
  |         |---- Conf-Utils ( system utilities )
  |         |---- Conf-Wlr   ( wayland utilities )
  |         |---- Conf-x11   ( xorg utilities )
  |         |---- Wall       ( wallpaper ) 
  |         |---- Xpm        ( icons )
  |
  |
  |------- User
            |
            |-------- Config
            |-------- Nur ( Nix User Repository )
            |-------- Scripts
  
```



### PREVIOUS LAYOUT ( PROFILE STYLE ) Too Complicated

```
Nixpkgs                                                              
  |                                                              
  |-- System                                                              
        |                         --------------------------------------
        |---Apps                  |                                    |       
        |    |                    V                                    |                         
        |    |---- Repos ---> Alacritty , Ncmpcpp , Neovim , Polybar <-|                                                 
        |    |---- Script ---> Fetch , Search , Preview                |                                                                                                     |             ^----------------------------                    |
        |                                         |                    |
        |--- Profiles                             |                    |            
        |       |                                 |                    |        
        |       |-------- tty                     |                    |                     
        |       |-------- Wayland ---> Sway       |                    |                                 
        |       |-------- x11-xorg ---> XMonad----|                    |                                                                                                     |                                                              |
        |                                                              |
        |--- Station                                                   |
                |                                                      |
                |--- setup                                             |
                |      |                                               |
                |      |------ Color Scheme ---------------------------|
                |      |------ WallPaper                |
                |      |------ Xpm-Icons                |
                |                                       |
                |                                       |
                |-------- utilities --------------------|
                              |
                      Zsh ----|
                       Nu ----|
                 Starship ----|
```

### CURRENT LAYOUT ( ROLES ) Just Perfect

```
Nixpkgs
  |
  |------- Machine -> Fonts , Wallpaper , Scripts
  |
  |------- Roles
  |         |
  |         |---- Helium --------------------- Recipes ------|
  |         |---- Neon ----------|        |--- Apps ---------|
  |         |---- Argon ---------|        |--- Options <-----|
  |         |---- Krypton -------|               |
  |         |---- Xenon ---------|               |
  |         |---- Radon ---------|               |
  |         |                                    |
  |         |                                    |
  |         |---- role.nix <---------------------|
  |
  |
  |------- User
            |
            |-------- Free
            |-------- Non-Free
  
```


--------------------------------------------------
### Desktop from ROLE - HELIUM
 <img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/helium.png" alt="img" align="center" width="230px">


--------------------------------------------------
### Desktop from ROLE - NEON
 <img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/neon.png" alt="img" align="center" width="800px">


--------------------------------------------------
### Desktop from ROLE - KRYPTON
<img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/krypton.png" alt="img" align="center" width="400px">


--------------------------------------------------
### Desktop from ROLE - XENON
<img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/xenon.png" alt="img" align="center" width="500px">


--------------------------------------------------
### Desktop from ROLE - RADON
<img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/radon.png" alt="img" align="center" width="500px">

--------------------------------------------------

### System ( Current Role : Radon )
| | |
|-|-|
| **Shell:** | nushell |
| **DM:** | tty with autostart sway |
| **WM:** | sway with waybar |
| **Editor:** | Neovim and Doom |
| **Terminal:** | kitty / Foot |
| **Launcher:** | wofi |
| **Browser:** | firefox |
| **GTK Theme:** | Nordic |

--------------------------------------------------

### Management

- My system is managed by a set configs/rules known as roles
- Each Roles Contains a set of Recipes
- Recipes are app/module config files written in nix
- Recipes are added to nixpkgs/roles/<rolename>/option.nix
- Recipes are added in the format gnu.<recipe-name>
```
Example : -

imports = [
            gnu.kitty
            gnu.nushell
            gnu.neovim
            gnu.ncmpcpp
            gnu.mako
            gnu.desktop
           # gnu.doom
            gnu.starship
            gnu.qutebrowser
            gnu.core
            gnu.xdg
            gnu.foot
     ];

NOTE : Will only work if it is present in the recipes file 
```

- You can you Gix to manage your system

```
Commands:

  gix switch      - rebuild NixOS
  gix edit        - edit System Config
  gix flake-edit  - edit Flake config
  gix home-dir    - go to Home-Manager Dir
  gix up-flake    - update root flake
  gix gc          - clean nix store home
  gix gc-root     - clean nix store root
  gix gcd         - clean all gen nix store in home
  gix gcd-root    - clean all gen nix store in root
  gix switch-home - rebuild Home-Manager
  gix upgrade     - Upgrade NixOS
  gix rec-lock    - recreate system flake lock [ not available ]
  gix install     - install package
  gix pull        - update repo
  gix env         - nix-env
  gix remove      - remove packages
  gix snap        - take a file snapshot of current home-manager role/profile
```
-------

