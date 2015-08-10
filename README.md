# .vimrc and .tmux.conf

```
git clone git@github.com:snowch/vimrc.git ~/.vim

[[ -f ~/.vimrc ]] && mv ~/.vimrc ~/.vimrc_$(date +%s)
ln -s ~/.vim/.vimrc ~/.vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

mkdir ~/.vim/colors
curl -s https://raw.githubusercontent.com/endel/vim-github-colorscheme/master/colors/github.vim > ~/.vim/colors/github.vim
vim +PluginInstall +qall

curl -s https://raw.githubusercontent.com/snowch/vimrc/master/.tmux.conf > ~/.tmux.conf

curl -s https://raw.githubusercontent.com/snowch/vimrc/master/tmux_save_session.sh > ~/.tmux_save_session.sh
chmod +x ~/.tmux_save_session.sh
```

```
# For jshint see: http://stackoverflow.com/a/5893447/1033422
```
