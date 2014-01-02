The following tools are made available by these scripts.

### Aliases ###

The .bashrc defines a number of convenient aliases:
  * `..`, `...`, `....` moves one, two, three directories up in the current dir's hierarchy
  * `py`, `py2`, `py3` for python, python2 and python3
  * `?` and `??` for pydoc and pydoc2
  * `vi` for vim
  * `venv` for mkvirtualenv
  * `ls` and `grep` have coloration, `grep` also has line numberings
  * `killbg` kills the current shell's jobs that are running in background
  * `doc` and `down` change directory into ~/Documents and ~/Downloads respectively

### (un)compress ###

  * The `mktar foo`, `mktgz foo` and `mktbz foo` commands create tarballs of the 'foo' file or directory, possibly compressed using gzip or bzip2.
  * The `ex <file>` command extracts the contents of the most popular types of archives (tar.bz2, tar.gz, tar.xz, bz2, rar gz, tar, tbz2, tgz, zip, Z, 7z)

### virtualenvwrapper ###

https://pypi.python.org/pypi/virtualenvwrapper/1.12

  * WORKON_HOME is set to `~/.virtualenvs`
  * VIRTUALENVWRAPPER_HOOK_DIR is set to ~/.virtualenvs_hooks according to http://virtualenvwrapper.readthedocs.org/en/latest/scripts.html. This folder is copied from this GitHub repository when deploying it


  * `workon` lists the available environments
  * `mkvirtualenv temp` creates and activates the 'temp' environment
  * `add2virtualenv path_to_source` #TO DO
  * `add2virtualenv` #TO DO

### Optional shell behaviour ###

  Using the [shopt builtin](http://www.gnu.org/software/bash/manual/html_node/The-Shopt-Builtin.html) in .bashrc

  * `dirspell` corrects spelling errors in directories names during completion
  * `checkwinsize` updates the values of LINES and COLUMNS after a command if necessary

### Better autocompletion ###
  * The list of possibilities for an ambiguous completion is shown after the first tab, no need for a second one
  * Hidden files and directories are ignored during tab completion (for an empty query)
  * The user is asked a confirmation when he asks to display more than 50 possible completion

### Enhanced PS1 ###
  * The bash prompt (PS1) looks like `21:51 afnarel @ oxygen in ~/Documents/projects/dotfiles (master) $`.
  * It is git-aware (displays the current branch)
  * It has colors.
  * In unicode X terminals, a green tic or red cross at the beginning indicates whether the previous command was successful or not.
  * If the current working directory is more than 30 characters long, it is shortened.

### Other features ###

  * The default EDITOR is vim
  * Bash completion is enabled
  * HISTCONTROL is set to `ignoreboth` so that duplicate commands and commands that have a leading whitespace are ignored
  * HISTSIZE (number of lines to store in history memory) HISTFILESIZE (number of lines to store in history file) are set to 10000 (the default is 5OO)
  * [PYTHONSTARTUP](http://docs.python.org/2/using/cmdline.html#envvar-PYTHONSTARTUP) is set to `~/.pythonrc.py` and this file is copied from this GitHub repository when deploying it
  * The 'stop' TTY command (^S) is disabled
  * There is a custom .pentadactylrc file and a color scheme for the Firefox Pentadactyl extension
  * The .screenrc file removes screen's startup message
  * .gitconfig sets a few preferences and aliases for git
  * .pythonrc.py contains the list of Python modules to import when running Python in interactive mode

### What is not done ###

  * The Pentadactyl extension must be installed in Firefox
  * [dwm](https://github.com/Afnarel/dwm) and [dwmstatus](https://github.com/Afnarel/dwmstatus) must be set up