# vimrc

git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim
cp ~/.vimrc ~/.vimrc.bak
curl https://raw.githubusercontent.com/snowch/vimrc/master/.vimrc > ~/.vimrc
mkdir ~/.vim/colors
curl http://www.vim.org/scripts/download_script.php?src_id=12456 > ~/.vim/colors/github.vim
vim +PluginInstall +qall

# From https://github.com/christoomey/vim-tmux-navigator
cat <<'EOT' >> ~/.tmux.conf
is_vim='echo "#{pane_current_command}" | grep -iqE "(^|\/)g?(view|n?vim?)(diff)?$"'
bind -n C-h if-shell "$is_vim" "send-keys C-h" "select-pane -L"
bind -n C-j if-shell "$is_vim" "send-keys C-j" "select-pane -D"
bind -n C-k if-shell "$is_vim" "send-keys C-k" "select-pane -U"
bind -n C-l if-shell "$is_vim" "send-keys C-l" "select-pane -R"
bind -n C-\ if-shell "$is_vim" "send-keys C-\\" "select-pane -l"
EOT

# For jshint see: http://stackoverflow.com/a/5893447/1033422

