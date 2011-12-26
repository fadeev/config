import XMonad
import Graphics.X11.Xlib
import XMonad.Hooks.ManageDocks
import XMonad.Hooks.DynamicLog
import XMonad.Hooks.EwmhDesktops
import XMonad.Layout.Tabbed
import XMonad.Util.Run(spawnPipe)
import XMonad.Prompt
import XMonad.Prompt.Shell
import XMonad.Prompt.XMonad
import qualified Data.Map as M
import System.IO

keys' conf@(XConfig {XMonad.modMask = modm}) = M.fromList
      [((modm, xK_p), spawn "dmenu_run -b -fn 'DejaVu Sans Mono' -nb 'grey3' -nf 'grey20' -sb 'grey3' -sf 'grey'" )]
newKeys x = keys' x `M.union` keys defaultConfig x

main = do
  xmproc <- spawnPipe "/usr/bin/xmobar /home/denis/.xmonad/xmobar.hs"
  xmonad $ defaultConfig
    {
      modMask = mod4Mask,
      borderWidth = 0,
      logHook = dynamicLogWithPP xmobarPP
                { ppOutput = hPutStrLn xmproc,
                  ppTitle = xmobarColor "OliveDrab3" "" . shorten 50,
                  ppCurrent = xmobarColor "yellow" "" . wrap " " " ",
                  ppHidden = xmobarColor "grey" "" . wrap " " " ",
                  ppHiddenNoWindows = xmobarColor "grey20" "" . wrap " " " ",
                  ppLayout = xmobarColor "grey3" "" . shorten 0,
                  ppSep = " " },
      workspaces = ["shell", "code", "web", "common"],
      keys = newKeys,
      manageHook = manageHook defaultConfig <+> manageDocks,
      layoutHook = avoidStruts $ layoutHook defaultConfig
    }