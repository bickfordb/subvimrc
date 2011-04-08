" Vim plugin to load per-project .vimrc files.  This will look for files named
" '.subvimrc' in subdirectories of files you open and automatically source
" them to enable one to make per project vimrc settings.
" 
" Language:	Python
" Author:	Brandon Bickford <bickfordb@gmail.com>
" Last Change:	2010 June 27
" License: Copyright 2010 Brandon Bickford  
"    This program is free software: you can redistribute it and/or modify
"    it under the terms of the GNU General Public License as published by
"    the Free Software Foundation, either version 3 of the License, or
"    (at your option) any later version.
"
"    This program is distributed in the hope that it will be useful,
"    but WITHOUT ANY WARRANTY; without even the implied warranty of
"    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
"    GNU General Public License for more details.
"
"    You should have received a copy of the GNU General Public License
"    along with this program.  If not, see <http://www.gnu.org/licenses/>.
"
" Version: 1.0	

function! s:SubVimRCInit()
python << endpython
import vim
import os.path
import sys

VIMRC_NESTED = ".subvimrc"

class SubVimRCInit(object):
    def __init__(self):
        self.cache = set()

    def on_read(self):
        filename = vim.current.buffer.name
        filename = os.path.abspath(filename)
        dirname, _ = os.path.split(filename)
        while True:
            if dirname in self.cache:
                break
            self.cache.add(dirname)
            conf_name = os.path.join(dirname, VIMRC_NESTED)
            if os.path.exists(conf_name):
                vim.command("source " + conf_name)
            new_dirname, _= os.path.split(dirname)
            if new_dirname == dirname:
                break
            dirname = new_dirname

_subvimrc = SubVimRCInit()

endpython
endfunction

if has("python")
    call s:SubVimRCInit()
    au BufRead,BufNewFile * :py _subvimrc.on_read()
endif
