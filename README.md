Credits: note that this is a fork from Alexis' repository at `https://github.com/Alexis-D/.dotfiles.git`.

### Deployment ###

    git clone https://github.com/Afnarel/.dotfiles.git
    cd .dotfiles
    . deploy.sh

Vim plugins are managed (as much as possible) using the excellent Pathogen
plugin created by Tim Pope.

Submodules are used where possible.

You'll need to `sudo pip install flake8 virtualenv virtualenvwrapper` first
(not done in the deploy script because it requires root).

If you are looking for information on the tools provided by these config files,
have a look at the `DOCUMENTATION.md` file instead.
