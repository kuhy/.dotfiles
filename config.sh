#!/usr/bin/env bash
# Author: Kuhy
# Setups system after new installation.

# Configure MIME types and corresponding handlers.
mimeo --create emacs.desktop Emacs 'emacsclient -c -a emacs %F' 'glob:text/*' 'noterm'
mimeo --prefer 'glob:text/*' emacs.desktop
mimeo --create mpv.desktop mpv 'mpv %F' 'glob:video/*' 'noterm'
mimeo --prefer 'glob:video/*' mpv.desktop
mimeo --prefer 'glob:Video/*' mpv.desktop
mimeo --create firefox.desktop Firefox 'firefox %U' 'glob:x-scheme-handler/*' 'noterm'
mimeo --prefer 'glob:x-scheme-handler/*' firefox.desktop
mimeo --create imv.desktop imv 'imv %F' 'glob:image/*' 'noterm'
mimeo --prefer 'glob:image/*' imv.desktop
mimeo --create zathura.desktop zathura 'zathura %F' 'application/pdf' 'noterm'
mimeo --prefer 'application/pdf' zathura.desktop
mimeo --create zathura.desktop zathura 'zathura %F' 'application/pdf' 'noterm'
mimeo --prefer 'application/pdf' zathura.desktop
mimeo --create audacity.desktop Audacity 'audacity %F' 'glob:audio/*' 'noterm'
mimeo --prefer 'glob:audio/*' audacity.desktop
