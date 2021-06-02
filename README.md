![BeFunky-snapshot](https://user-images.githubusercontent.com/68412503/120468937-61af9980-c3bf-11eb-99c5-e372df400147.png)

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
 <img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/fe.png" alt="img" align="left" width="230px">

--------------------------------------------------


#### Neovim Editing init.vim
 <img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/vi.png" alt="img" align="center" width="800px">

--------------------------------------------------


#### File Manager ( nnn )
<img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/st.png" alt="img" align="center" width="400px">

--------------------------------------------------


#### Ncmpcpp ( From JavaCafe01 )
<img src="https://github.com/Sam1431/Immutable-Dotfiles/blob/main/.assets/ha.png" alt="img" align="center" width="500px">



