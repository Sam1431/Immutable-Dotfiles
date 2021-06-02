  -- Base
import XMonad
import System.IO (hPutStrLn)
import System.Exit (exitSuccess)
import qualified XMonad.StackSet as W

    -- Actions
import XMonad.Actions.CopyWindow (kill1, killAllOtherCopies)
import XMonad.Actions.CycleWS (moveTo, shiftTo, WSType(..), nextScreen, prevScreen)
import XMonad.Actions.GridSelect
import XMonad.Actions.MouseResize
import XMonad.Actions.Promote
import XMonad.Actions.RotSlaves (rotSlavesDown, rotAllDown)
import qualified XMonad.Actions.TreeSelect as TS
import XMonad.Actions.WindowGo (runOrRaise)
import XMonad.Actions.WithAll (sinkAll, killAll)
import qualified XMonad.Actions.Search as S
import XMonad.Actions.FloatKeys

    -- Data
import Data.Char (isSpace)
import Data.Monoid
import Data.Maybe (isJust)
import Data.Tree
import qualified Data.Map as M

    -- Hooks
import XMonad.Hooks.DynamicLog (dynamicLogWithPP, wrap, xmobarPP, xmobarColor, shorten, PP(..))
import XMonad.Hooks.EwmhDesktops  -- for some fullscreen events, also for xcomposite in obs.
import XMonad.Hooks.FadeInactive
import XMonad.Hooks.ManageDocks (avoidStruts, docksEventHook, manageDocks, ToggleStruts(..))
import XMonad.Hooks.ManageHelpers (isFullscreen, doFullFloat)
import XMonad.Hooks.ServerMode
import XMonad.Hooks.SetWMName
import XMonad.Hooks.WorkspaceHistory

    -- Layouts
import XMonad.Layout.SimplestFloat
import XMonad.Layout.ResizableTile

    -- Layouts modifiers
import XMonad.Layout.LayoutModifier
import XMonad.Layout.LimitWindows (limitWindows, increaseLimit, decreaseLimit)
import XMonad.Layout.MultiToggle (mkToggle, single, EOT(EOT), (??))
import XMonad.Layout.MultiToggle.Instances (StdTransformers(NBFULL, MIRROR, NOBORDERS))
import XMonad.Layout.NoBorders
import XMonad.Layout.Renamed (renamed, Rename(Replace))
import XMonad.Layout.Spacing
import XMonad.Layout.WindowArranger (windowArrange, WindowArrangerMsg(..))
import qualified XMonad.Layout.ToggleLayouts as T (toggleLayouts, ToggleLayout(Toggle))
import qualified XMonad.Layout.MultiToggle as MT (Toggle(..))

    -- Prompt
import XMonad.Prompt
import XMonad.Prompt.Input
import XMonad.Prompt.FuzzyMatch
import XMonad.Prompt.Shell (shellPrompt)
import XMonad.Prompt.XMonad
import Control.Arrow (first)

   -- Utilities
import XMonad.Util.EZConfig (additionalKeysP)
import XMonad.Util.Run (runProcessWithInput, safeSpawn, spawnPipe)
import XMonad.Util.SpawnOnce



--------------------------------------------------------------------------------------
-------------------------- DEFAULTS SETTINGS / APPS ----------------------------------
--------------------------------------------------------------------------------------

myFont :: String
myFont = "xft:Iosevka Slab:regular:size=11:antialias=true:hinting=true"

myModMask :: KeyMask
myModMask = mod4Mask            -- Sets modkey to super/windows key

myTerminal :: String
myTerminal = "alacritty"        -- Sets default terminal

myBrowser :: String
myBrowser = "qutebrowser "      -- Sets qutebrowser as browser for tree select

myEditor :: String
myEditor = "alacritty -e nvim"  -- Sets emacs as editor for tree select

myBorderWidth :: Dimension
myBorderWidth = 1               -- Sets border width for windows

myNormColor :: String
myNormColor   = "#131313"       -- Border color of normal windows

myFocusColor :: String
myFocusColor  = "#948d79"       -- Border color of focused windows

altMask :: KeyMask
altMask = mod1Mask              -- Setting this for use in xprompts

windowCount :: X (Maybe String)
windowCount = gets $ Just . show . length . W.integrate' . W.stack . W.workspace . W.current . windowset


--------------------------------------------------------------------------------------
-------------------------------- XMONAD STARTUP --------------------------------------
--------------------------------------------------------------------------------------

myStartupHook :: X ()
myStartupHook = do
          spawnOnce "sh /home/shiva/.fehbg"
          spawnOnce "picom &"
          spawnOnce "mpd"
          spawnOnce "xsetroot -cursor_name left_ptr &"
          setWMName "LG3D"

--------------------------------------------------------------------------------------
---------------------------------- GRID SETTTINGS ------------------------------------
--------------------------------------------------------------------------------------

myColorizer :: Window -> Bool -> X (String, String)
myColorizer = colorRangeFromClassName
                  (0x28,0x28,0x28) -- lowest inactive bg
                  (0x28,0x28,0x28) -- highest inactive bg
                  (0xeb,0xdb,0xb2) -- active bg
                  (0xeb,0xdb,0xb2) -- inactive fg
                  (0x28,0x28,0x28) -- active fg

mygridConfig :: p -> GSConfig Window
mygridConfig colorizer = (buildDefaultGSConfig myColorizer)
    { gs_cellheight   = 70
    , gs_cellwidth    = 200
    , gs_cellpadding  = 6
    , gs_originFractX = 0.5
    , gs_originFractY = 0.5
    , gs_font         = myFont
    }

spawnSelected' :: [(String, String)] -> X ()
spawnSelected' lst = gridselect conf lst >>= flip whenJust spawn
    where conf = def
                   { gs_cellheight   = 40
                   , gs_cellwidth    = 200
                   , gs_cellpadding  = 6
                   , gs_originFractX = 0.5
                   , gs_originFractY = 0.5
                   , gs_font         = myFont
                   }

myAppGrid = [ ("Audacity", "audacity")
                 , ("Deadbeef", "deadbeef")
                 , ("Firefox", "firefox")
                 , ("Geary", "geary")
                 , ("Gimp", "gimp")
                 , ("PCManFM", "pcmanfm")
                 ]



--------------------------------------------------------------------------------------
-------------------------------- RUN PROMPT THEME ------------------------------------
--------------------------------------------------------------------------------------

dtXPConfig :: XPConfig
dtXPConfig = def
      { font                = myFont
      , bgColor             = "#282828"
      , fgColor             = "#ebdbb2"
      , bgHLight            = "#ebdbb2"
      , fgHLight            = "#282828"
      , borderColor         = "#3b3b3b"
      , promptBorderWidth   = 1
      , position            = CenteredAt { xpCenterY = 0.3, xpWidth = 0.3 }
      , height              = 40
      , historySize         = 256
      , historyFilter       = id
      , defaultText         = []
      , autoComplete        = Just 100000  -- set Just 100000 for .1 sec
      , showCompletionOnTab = False
      , searchPredicate     = fuzzyMatch
      , alwaysHighlight     = True
      , maxComplRows        = Just 7     -- set to Just 5 for 5 rows
      }

--------------------------------------------------------------------------------------
------------------------------ PER-LAYOUT SETTINGS -----------------------------------
--------------------------------------------------------------------------------------

mySpacing :: Integer -> l a -> XMonad.Layout.LayoutModifier.ModifiedLayout Spacing l a
mySpacing i = spacingRaw False (Border i i i i) True (Border i i i i) True

--- LAYOUT

tall     = renamed [Replace "tall"]
           $ limitWindows 12
           $ mySpacing 8
           $ ResizableTall 1 (3/100) (6/10) []
monocle  = renamed [Replace "monocle"]
           $ limitWindows 20 Full
floats   = renamed [Replace "floats"]
           $ limitWindows 20 simplestFloat

-- LAYOUT HOOK
myLayoutHook = avoidStruts $ mouseResize $ windowArrange $ T.toggleLayouts floats $
               mkToggle (NBFULL ?? NOBORDERS ?? EOT) myDefaultLayout
             where
               myDefaultLayout =     tall
                                 ||| floats
                                 ||| monocle



--------------------------------------------------------------------------------------
------------------------------------ WORKSPACES --------------------------------------
--------------------------------------------------------------------------------------

xmobarEscape :: String -> String
xmobarEscape = concatMap doubleLts
  where
        doubleLts '<' = "<<"
        doubleLts x   = [x]

myWorkspaces :: [String]
myWorkspaces = (map xmobarEscape)
               $[" TERM ", " MUSIC ", " WEB ", " FILES ", " DEV "]


--------------------------------------------------------------------------------------
----------------- SHIFTING APP TO DESIRED WORKSPACE ON APP STARTUP -------------------
--------------------------------------------------------------------------------------

myManageHook :: XMonad.Query (Data.Monoid.Endo WindowSet)
myManageHook = composeAll
     [ className =? "htop"    --> doShift ( myWorkspaces !! 5 )
     , className =? "Gimp"    --> doShift ( myWorkspaces !! 5 )
     ]


--------------------------------------------------------------------------------------
------------------------------- RUN PROMPT / WIDGET FADE -----------------------------
--------------------------------------------------------------------------------------

myLogHook :: X ()
myLogHook = fadeInactiveLogHook fadeAmount
    where fadeAmount = 1.0


--------------------------------------------------------------------------------------
-------------------------------- XMONAD KEYBINDINGS ----------------------------------
--------------------------------------------------------------------------------------

myKeys :: [(String, X ())]
myKeys =

   -- XMONAD
         [ ("M-C-r", spawn "xmonad --recompile")      -- Recompiles xmonad
         , ("M-S-r", spawn "xmonad --restart && notify-send 'Xmonad Recompiled'")             -- Restarts xmonad

   -- TERMINAL
         , ("M-S-<Return>", spawn (myTerminal))
         , ("M-C-n", spawn (myTerminal ++ " -e ncmpcpp"))
         , ("M-e", spawn (myTerminal ++ " -e nvim"))

   -- MENU
         , ("M-<Return>", shellPrompt dtXPConfig)                                             -- Shell Prompt
   
   -- WINDOW
         , ("M-q", kill1)                                                                     -- Kill the currently focused client
         , ("M-S-a", killAll)                                                                 -- Kill all windows on current workspace
   
   -- FLOAT LAYOUT
         , ("M-w", withFocused $ windows . W.sink)                                            -- Push floating window back to tile
         , ("M-S-<Delete>", sinkAll)                                                          -- Push ALL floating windows to tile
         , (("M-d"), withFocused (keysResizeWindow (-10,-10) (1,1)))
         , (("M-s"), withFocused (keysResizeWindow (10,10) (1,1)))
         , (("M-S-d"), withFocused (keysAbsResizeWindow (-10,-10) (1024,752)))
         , (("M-S-s"), withFocused (keysAbsResizeWindow (10,10) (1024,752)))

   -- GRID SELECT
         , ("C-g g", spawnSelected' myAppGrid)                                                -- grid select favorite apps
         , ("C-g t", goToSelected $ mygridConfig myColorizer)                                 -- goto selected window

   -- WINDOW NAVIGATION
         , ("M-m", windows W.focusMaster)                                                     -- Move focus to the master window
         , ("M-j", windows W.focusDown)                                                       -- Move focus to the next window
         , ("M-k", windows W.focusUp)                                                         -- Move focus to the prev window
         , ("M-S-j", windows W.swapDown)                                                      -- Swap focused window with next window
         , ("M-S-k", windows W.swapUp)                                                        -- Swap focused window with prev window
         , ("M-<Backspace>", promote)                                                         -- Moves focused window to master, others maintain order
         , ("M1-S-<Tab>", rotSlavesDown)                                                      -- Rotate all windows except master and keep focus in place
         , ("M1-C-<Tab>", rotAllDown)                                                         -- Rotate all the windows in the current stack
         , ("M-C-s", killAllOtherCopies)

   -- LAYOUT KEY
         , ("M-<Tab>", sendMessage NextLayout)                                                -- Switch to next layout
         , ("M-C-M1-<Up>", sendMessage Arrange)
         , ("M-C-M1-<Down>", sendMessage DeArrange)
         , ("M-<Space>", sendMessage (MT.Toggle NBFULL) >> sendMessage ToggleStruts)          -- Toggles noborder/full
         , ("M-S-<Space>", sendMessage ToggleStruts)                                          -- Toggles struts
         , ("M-S-n", sendMessage $ MT.Toggle NOBORDERS)                                       -- Toggles noborder
         , ("M-<KP_Multiply>", sendMessage (IncMasterN 1))                                    -- Increase number of clients in master pane
         , ("M-<KP_Divide>", sendMessage (IncMasterN (-1)))                                   -- Decrease number of clients in master pane
         , ("M-S-<KP_Multiply>", increaseLimit)                                               -- Increase number of windows
         , ("M-S-<KP_Divide>", decreaseLimit)                                                 -- Decrease number of windows

   -- RESIZING
         , ("M-h", sendMessage Shrink)                                                        -- Shrink horiz window width
         , ("M-l", sendMessage Expand)                                                        -- Expand horiz window width
         , ("M-C-j", sendMessage MirrorShrink)                                                -- Shrink vert window width
         , ("M-C-k", sendMessage MirrorExpand)                                                -- Exoand vert window width

   -- MPD
         , ("M-o", spawn "mpc next")                                                          -- Switch focus to next monitor
         , ("M-p", spawn "mpc prev")                                                          -- Switch focus to prev monitor
         , ("M-S-o", spawn "mpc pause")                                                       -- Shifts focused window to next ws
         , ("M-S-p", spawn "mpc play")                                                        -- Shifts focused window to prev ws

   -- SCRIPTS
         , ("M-u s", spawn "bash ~/.config/nixpkgs/user/scripts/system/screen.sh")
         , ("M-a", spawn "bash -c ~/.config/rofi/wifi/rofi-wifi-menu.sh")

   -- SYSTEM APPS
         , ("M-n", spawn "cmst -d")
      ]

main :: IO ()
main = do
-- START XMOBAR
    xmproc0 <- spawnPipe "xmobar -x 0 /home/shiva/.config/nixpkgs/system/profiles/x11-xorg/xmonad/xmobar.hs"

-- XMONAD HOOKS
    xmonad $ ewmh def
        { manageHook = ( isFullscreen --> doFullFloat ) <+> myManageHook <+> manageDocks
        , handleEventHook    = serverModeEventHookCmd
                               <+> serverModeEventHook
                               <+> serverModeEventHookF "XMONAD_PRINT" (io . putStrLn)
                               <+> docksEventHook
        , modMask            = myModMask
        , terminal           = myTerminal
        , startupHook        = myStartupHook
        , layoutHook         = myLayoutHook
        , workspaces         = myWorkspaces
        , borderWidth        = myBorderWidth
        , normalBorderColor  = myNormColor
        , focusedBorderColor = myFocusColor
        , logHook = workspaceHistoryHook <+> myLogHook <+> dynamicLogWithPP xmobarPP
                        { ppOutput = \x -> hPutStrLn xmproc0 x
                        , ppCurrent = xmobarColor "#a0cf44" "" . wrap "[" "]"   -- Current workspace in xmobar
                        , ppVisible = xmobarColor "#a0cf44" ""                  -- Visible but not current workspace
                        , ppHidden = xmobarColor "#83c9c7" "" . wrap "" ""      -- Hidden workspaces in xmobar
                        , ppHiddenNoWindows = xmobarColor "#d8bae6" ""          -- Hidden workspaces (no windows)
                        , ppTitle = xmobarColor "#ebdbb2" "" . shorten 30       -- Title of active window in xmobar
                        , ppSep =  "<fc=#666666> <fn=0>|</fn> </fc>"                       -- Separators in xmobar
                        , ppUrgent = xmobarColor "#C45500" "" . wrap "!" "!"    -- Urgent workspace
                        , ppExtras  = [windowCount]                             -- # of windows current workspace
                        , ppOrder  = \(ws:l:t:ex) -> [ws]
                        }
        } `additionalKeysP` myKeys
