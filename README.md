# VimSettings

**DEPRECATED** in favor of [dotfiles](https://github.com/cloutiertyler/dotfiles)

In order to set up your Vim. First clone this repository to your home directory. Then:

- `mv VimSettings .vimsettings`
- `cp .vimsettings/vimrc .vimrc`
- `git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim`
- `vim +PluginInstall +qall`
- `mkdir ~/.vim/backup ~/.vim/undo ~/.vim/tmp`

At that point your should be all set!
