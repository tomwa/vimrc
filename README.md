# .vimrc and .tmux.conf

```
git clone git@github.com:snowch/vimrc.git ~/.vim

cp ~/.vimrc ~/.vimrc.bak
ln -s ~/.vim/.vimrc ~/.vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ~/.vim/colors
curl http://www.vim.org/scripts/download_script.php?src_id=12456 > ~/.vim/colors/github.vim
curl https://raw.githubusercontent.com/altercation/vim-colors-solarized/master/colors/solarized.vim >  ~/.vim/colors/solarized.vim
vim +PluginInstall +qall

curl https://raw.githubusercontent.com/snowch/vimrc/master/.tmux.conf > ~/.tmux.conf

curl https://raw.githubusercontent.com/snowch/vimrc/master/tmux_save_session.sh > ~/.tmux_save_session.sh
chmod +x ~/.tmux_save_session.sh
```

```
# For jshint see: http://stackoverflow.com/a/5893447/1033422
```
