# Vim plugin Installation
if [[ ! -d  "~/.vim/bundle/Vundle.vim" ]]; then
  git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
  vim +PluginInstall +qall
else
  echo "Not cloning Vundle, directory already exits"
fi

#color_coded
if [[ -d  "~/.vim/bundle/color_coded" ]]; then
ans=""
read -s -n1 -p "added the sources for to /etc/apt/sources.list? (y/n)" ans
if [[ "$ans" != "y" ]]; then
  echo ""
  echo "Link for sources: http://apt.llvm.org/"
else
  sudo apt update
  sudo apt install build-essential libclang-3.9-dev libncurses-dev libz-dev cmake xz-utils libpthread-workqueue-dev
  cd ~/.vim/bundle/color_coded
  mkdir build && cd build
  cmake ..
  make && make install # Compiling with GCC is preferred, ironically
  # Clang works on OS X, but has mixed success on Linux and the BSDs

  # Cleanup afterward; frees several hundred megabytes
  make clean && make clean_clang
  cd - # Go back to original directory
fi
fi

#powerline fonts for vim-airline
if [[ -d  "~/.vim/bundle/vim-airline" ]]; then
  # clone
  git clone https://github.com/powerline/fonts.git
  # install
  cd fonts
  ./install.sh
  # clean-up a bit
  cd ..
  rm -rf fonts
else
  echo "Not installing Powerline, as vim-airline doesn't exist"
fi

#Youcompleteme compilation
if [[ -d  "~/.vim/bundle/YouCompleteMe" ]]; then
  sudo apt-get install build-essential cmake python-dev python3-dev
  cd ~/.vim/bundle/YouCompleteMe
  ./install.py --clang-completer
  cd - # Go back to original directory
else
  echo "Not Installing YCM"
fi
