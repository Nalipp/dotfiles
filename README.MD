#make sure there is no ~/.vimrc file
#mkdir ~/code/dotfiles

#create a simlink
  -ln -s ~/code/dotfiles/.vimrc ~/.vimrc
  -pull repo to ~/code/dotfiles/.vimrc, the ~/.vimrc will update automatically

#on initial install run
  -:PluginInstall
  -:source %


