# .vimrc and .tmux.conf

```
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vimrc ~/.vimrc.bak
curl https://raw.githubusercontent.com/snowch/vimrc/master/.vimrc > ~/.vimrc
mkdir ~/.vim/colors
curl http://www.vim.org/scripts/download_script.php?src_id=12456 > ~/.vim/colors/github.vim
vim +PluginInstall +qall

curl https://raw.githubusercontent.com/snowch/vimrc/master/.tmux.conf > ~/.tmux.conf
```

```
# For jshint see: http://stackoverflow.com/a/5893447/1033422
```
