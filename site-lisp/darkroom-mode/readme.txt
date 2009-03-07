#title Emacs darkroom-mode and w32-fullscreen
#author Martin Svenson
#date 2008-02-12

Darkroom-mode is a "pseudo" mode for Emacs on Windows that tries to emulate the no-distractions writing environment in applications like "WriteRoom" and "DarkRoom". It's Windows only since going fullscreen in X is handled natively by most X window managers.

Darkroom mode enables "real" fullscreen mode on a frame, i.e, taking away even the titlebar. It also sets some useful margin- and color settings. It works with multiple monitors (i.e, multiple frames)

There is a [[URL:http://www.martyn.se/code/emacs/darkroom-mode/darkroommode-screenshot.png][screenshot]] available (here used together with [[http://mwolson.org/projects/EmacsMuse.html][Emacs Muse]].

Latest version available for [[martin-darkroom-v02.zip][download]] is [[martin-darkroom-v02.zip][v0.2]]

* Files and short descriptions
 - [[martin-w32-fullscreen.el]] - The module that handles going fullscreen
   on MS Windows
 - [[w32toggletitle.py]] - Python script required to get fullscreen, uses pywin32.
 - [[martin-frame-local-vars.el]] - Module enabling "frame local" variables. Needed in darkroom-mode for remembering margins across buffers.
 - [[martin-darkroom.el]] - Additional to going fullscreen, this module sets some useful margins and other frame-properties to emulate the "DarkRoom" environment.

* Requirements
 - MS Windows. Only support for MS Windows since going fullscreen in X is handled by most window managers anyway.
 - Python (tested with 2.5), http://www.python.org
 - pywin32 (tested with build 210), http://pywin32.sourceforge.net/
 - pyWinAuto (tested with 0.3.7), http://pywinauto.openqa.org/

Also, it might require EmacsW32 available at http://www.ourcomments.org/Emacs/EmacsW32.html (I haven't tested without it yet)

* Installation
First, see that you meet the requirements.

Next, place [[martin-darkroom.el]], [[martin-w32-fullscreen.el]] and [[martin-frame-local-vars.el]] in a good place. You'll also need the python script [[w32toggletitle.py]].

Edit [[martin-w32-fullscreen.el]] and change =w32-toggle-caption-cmd= to point to where you put [[w32toggletitle.py]].

Then edit your .emacs and add the usual:
=(add-to-list 'load-path "path-to-where-you-put-martin-darkroom")=
=(require 'martin-darkroom)=

* Usage
Use =M-x darkroom-mode= to toggle darkroom-mode on/off

If you only want fullscreen and not the other stuff, use =M-x w32-fullscreen= (toggles fullscreen on/off)

* Questions & Feedback
You can contact me (Martin Svenson) at phromo@<common google-based webmail.com>

* Changelog
 - v0.2 (current), 2008-02-14 - added multiple monitor support
 - v0.1, 2008-02-12 - initial release