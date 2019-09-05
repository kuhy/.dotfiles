#!/usr/bin/env bash
# Author: Kuhy
# Installs and tangles literate dotfiles written in Org mode.

# Directory where will be .dotfiles installed.
DOTFILES_HOME=$HOME/.dotfiles

# Clones .dotfiles from GitHub if folder with dotfiles doesn't exist
# and installs all project dependencies.
if [ ! -e "$DOTFILES_HOME" ]; then
    echo "Installing dependencies..."
    sudo dnf install emacs git
    echo "Installing dotfiles to $DOTFILES_HOME."
    git clone https://github.com/kuhy/.dotfiles.git "$DOTFILES_HOME"
fi

cd "$DOTFILES_HOME" || exit

emacs_evaluate() {
    emacs -Q --batch --eval "
      (dolist (file command-line-args-left)
        (with-current-buffer
          (find-file-noselect file)
          ($1)
        )
      )" $FILES
}

# Exports and then tangles Org files inside a specified directory.
# Exporting is needed because #+INCLUDE isn't executed during tangling.
# Omits README.org and colors.org.
FILES=$(find "$DOTFILES_HOME/$*" -path "$DOTFILES_HOME/[!.]*/*.org")

emacs_evaluate 'org-org-export-to-org'

FILES=$(echo "$FILES" | sed 's/$/.org/')

emacs_evaluate 'org-babel-tangle'

rm $FILES

exit 0

