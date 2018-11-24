module Main (main) where

import XMonad
import XMonad.Layout.ResizableTile
import XMonad.Layout.Mosaic
import XMonad.Hooks.ManageDocks

import qualified Data.Map as M
import Graphics.X11.Xlib
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad

myWide = Mirror $ Tall nmaster delta ratio
    where
        -- The default number of windows in the master pane
        nmaster = 1
        -- Percent of screen to increment by when resizing panes
        delta   = 3/100
        -- Default proportion of screen occupied by master pane
        ratio   = 65/100

myLayout = avoidStruts (myWide ||| ResizableTall 1 (3/100) (1/2) [] ||| Full ||| mosaic 2 [3,2])

main :: IO ()
main = xmonad $ docks defaultConfig
    { terminal = "xfce4-terminal"
    , manageHook = manageDocks <+> manageHook defaultConfig
    , layoutHook = myLayout
    , modMask = mod4Mask
    , borderWidth = 6
    , normalBorderColor = "#333333"
    , focusedBorderColor = "#404040"
    , keys = myKeys <+> keys defaultConfig
    }

myKeys conf@(XConfig {XMonad.modMask = modm}) = M.fromList
         [ ((modm, xK_a), sendMessage MirrorShrink)
         , ((modm, xK_z), sendMessage MirrorExpand)
         ]
