![BeFunky-snapshot](https://user-images.githubusercontent.com/68412503/120468937-61af9980-c3bf-11eb-99c5-e372df400147.png)

## New Updates

- ****🛠 Found a way to install custom scripts into nix system ( From Javacafe )****
- ****🖥 Gruvboxified Xmonad Setup ( Enigma V.4 )****
- ****🔊 Ncmpcpp config in nix format****
- ****📦 Proper NUR setup****
- ****📝 Made enough changes from my old config to say this is my own config****
- ****📁 Updated Home-Manager Layout ( Modular --> Profiles )****

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
  |------- System
             |
             |-------Apps
             |         |
             |         |---- Repos ---> Alacritty , Ncmpcpp , Neovim
             |         |---- Script ---> Fetch , Search , Preview
             |
             |
             |------- Profiles
             |           |
             |           |-------- tty 
             |           |-------- Wayland ---> Sway
             |           |-------- x11-xorg ---> Awesome (SOON) , BspWM (SOON) , XMonad
             |
             |
             |------- Station
                         |
                         |-------- setup
                         |           |
                         |           |------ Color Scheme
                         |           |------ WallPaper
                         |           |------ Xpm-Icons
                         |
                         |
                         |-------- utilities
                                      |
                              Zsh ----|
                               Nu ----|
                         Starship ----|
```
--------------------------------------------------
 #### System Fetch
 <img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/fe.png" alt="img" align="center" width="230px">


--------------------------------------------------
#### Neovim Editing init.vim
 <img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/vi.png" alt="img" align="center" width="800px">


--------------------------------------------------
#### File Manager ( nnn )
<img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/st.png" alt="img" align="center" width="400px">


--------------------------------------------------
#### Ncmpcpp ( From JavaCafe01 )
<img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/ha.png" alt="img" align="center" width="500px">


--------------------------------------------------
### FULL DESKTOP
![2021-06-02-184125_1366x768_scrot](https://user-images.githubusercontent.com/68412503/120486168-66ca1400-c3d2-11eb-9819-97db20e3ed0c.png)
