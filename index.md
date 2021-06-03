![BeFunky-snapshot](https://user-images.githubusercontent.com/68412503/120468937-61af9980-c3bf-11eb-99c5-e372df400147.png)

### New Updates

****
- **🛠️ Found a way to install custom scripts into nix system ( From Javacafe )**
- **🖥️ Gruvboxified Xmonad Setup ( Enigma V.4 )**
- **🎵 Ncmpcpp config in nix format**
- **📦 Proper NUR setup**
- **📝 Made enough changes from my old config to say this is my own config**
- **📁 Updated Home-Manager Layout ( Modular --> Profiles )**

****

### OLD LAYOUT ( MODULAR STYLE )

```
Nixpkgs
  |
  |------- Machine
  |
  |------- Role
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



### NEW LAYOUT ( PROFILE STYLE )

```
Nixpkgs
  |
  |-- System
        |
        |---Apps
        |    |
        |    |---- Repos ---> Alacritty , Ncmpcpp , Neovim
        |    |---- Script ---> Fetch , Search , Preview
        |
        |
        |--- Profiles
        |       |
        |       |-------- tty 
        |       |-------- Wayland ---> Sway
        |       |-------- x11-xorg ---> XMonad
        |
        |
        |--- Station
                |
                |--- setup
                |      |
                |      |------ Color Scheme
                |      |------ WallPaper
                |      |------ Xpm-Icons
                |
                |
                |-------- utilities
                              |
                      Zsh ----|
                       Nu ----|
                 Starship ----|

```  
<p align="left">
--------------------------------------------------

** System Fetch **

![fe](https://user-images.githubusercontent.com/68412503/120594374-798a2a80-c45e-11eb-9b21-b58a3fec0e17.png)


--------------------------------------------------

** Neovim Editing init.vim **

![vi](https://user-images.githubusercontent.com/68412503/120594476-9d4d7080-c45e-11eb-9634-b2f7cb98f31f.png)


--------------------------------------------------

** File Manager ( nnn )**

![st](https://user-images.githubusercontent.com/68412503/120594411-89097380-c45e-11eb-99bf-8b9afd7f2300.png)


--------------------------------------------------

** Ncmpcpp ( From JavaCafe01 ) **

![ha](https://user-images.githubusercontent.com/68412503/120594538-b2c29a80-c45e-11eb-8b9b-0ee04e19b732.png)


--------------------------------------------------

** FULL DESKTOP **

![2021-06-02-184125_1366x768_scrot](https://user-images.githubusercontent.com/68412503/120486168-66ca1400-c3d2-11eb-9819-97db20e3ed0c.png)

  </p>
