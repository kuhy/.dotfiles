#! /bin/bash
# Author: Kuhy
# Installs and tangles literate dotfiles written in Org mode.

# Directory where will be .dotfiles installed.
DOTFILES_HOME=$HOME/.dotfiles

# Clones .dotfiles from GitHub if folder with dotfiles doesn't exist
# and installs all project dependencies.
if [ ! -e $DOTFILES_HOME ]; then
    echo "Installing dependencies..."
    sudo dnf install emacs git
    echo "Installing dotfiles to $DOTFILES_HOME."
    git clone https://github.com/kuhy/.dotfiles.git $DOTFILES_HOME
fi

cd $DOTFILES_HOME

# Exports and then tangles Org files in directory.
# Exporting is needed because of #+INCLUDE isn't executed during tangling.
# Omits README.org and colors.org.
for file in `ls -1 | awk '/\..*org$/ && !/README.org/ && !/variables.org/'`; do
    emacs $file -Q --batch -f org-org-export-to-org -kill
    emacs $file.org -Q --batch -f org-babel-tangle --kill
    rm $file.org
done

exit 0

