# .vimrc and .tmux.conf

```
git clone git@github.com:snowch/vimrc.git ~/.vim

[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc_$(date +%s)
ln -s ~/.vim/.vimrc ~/.vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ~/.vim/colors
curl -s https://raw.githubusercontent.com/endel/vim-github-colorscheme/master/colors/github.vim > ~/.vim/colors/github.vim
vim +PluginInstall +qall

vim 'https://conque.googlecode.com/files/conque_2.3.vmb' -c ':so % | q'

# fix colorsupport
curl -s http://www.vim.org/scripts/download_script.php?src_id=20938 > ~/.vim/plugin/colorsupport.vim

curl -s https://raw.githubusercontent.com/snowch/vimrc/master/.tmux.conf > ~/.tmux.conf

curl -s https://raw.githubusercontent.com/snowch/vimrc/master/tmux_save_session.sh > ~/.tmux_save_session.sh
chmod +x ~/.tmux_save_session.sh
```

```
# For jshint see: http://stackoverflow.com/a/5893447/1033422
```
