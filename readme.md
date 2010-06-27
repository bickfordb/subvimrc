# subvimrc

## Description 

Vim plugin for subdirectory or per-project .vimrc files.

I find myself working on different projects which often need different project settings.  Examples of this include per project ctag/cscope files and whitespace settings. 

The behavior of this plugin is pretty simple.  Whenever you open a file each subdirectory of the file you open is checked for a file named ".subvimrc".  If it exists and hasn't been sourced yet it is sourced. 

Here's how I use it.  I organize my programming projects into a directory named "$HOME/projects" and whenever I need to customize settings for a project, I store those settings in "$HOME/projects/<project>/.subvimrc".

## Installation

    mkdir -p $HOME/.vim/plugins
    curl http://github.com/bickfordb/subvimrc/raw/master/subvimrc.vim > $HOME/.vim/plugins/subvimrc.vim

## Alternatives
 
 * localvimrc: http://www.vim.org/scripts/script.php?script_id=441 (found this after I wrote this)
