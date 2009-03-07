# Name: w32toggletitle.py
# Description: toggle titlebar on emacs
# Author: Martin Svenson
# License: free for all usages/modifications/distributions/whatever.

# Requires: pywinauto & pywin32

import sys
import win32api
from pywinauto import findwindows

withTitle = 382664704
woTitle = 370081792

# -- main code --
def main(args = None):
    if args == None:
        args = sys.argv[1:]
    if len(args) < 1:
        print "Usage: w32toggletitle.py <'part of title'>"
        sys.exit(0)
    titlematch = ".*%s.*" % args[0]
    try:
        emacsHwnd = findwindows.find_window(title_re=titlematch)
    except:
        print "Window not found : %s " % titlematch
        sys.exit(0)
    
    current = win32api.GetWindowLong(emacsHwnd, -16)
    
    if current == withTitle:
        win32api.SetWindowLong(emacsHwnd, -16, woTitle)
    else:
        win32api.SetWindowLong(emacsHwnd, -16, withTitle)

main()
