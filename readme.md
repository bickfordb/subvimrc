# subvimrc

Plugin to support for subdirectory / per-project .vimrc files.

I find myself working on different projects which often need different project settings.  Examples of this include different ctag/cscope files and different tab and space preferences.

The behavior of this plugin is pretty simple: whenever you open a file, each subdirectory of the file you open is checked for a file named ".vimrc.local".  If it exists and hasn't been sourced yet, it is sourced.

