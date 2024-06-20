overview
--------
    Simple neovim configuration convenient for viewing and editing C code.    
 

install neovim: https://github.com/neovim/neovim  
------------------------------------------------

    sudo apt install ninja-build gettext cmake unzip curl build-essential
    git clone https://github.com/neovim/neovim
    
    cd neovim && make CMAKE_BUILD_TYPE=Release
    sudo make install
    nvim -v

install nerd-font: https://github.com/ryanoasis/nerd-fonts/releases
-------------------------------------------------------------------

    download and extract zip,put folder to /usr/share/fonts/truetype
    sudo apt install fontconfig
    fc-cache -f -v
    reboot
    
plugin dependency software: 
---------------------------
    for linux mint:
    sudo apt install pip
    pip install pynvim
    sudo apt install astyle   
    sudo apt install universal-ctags
    sudo apt install ripgrep

    for linux gentoo:
    sudo emerge -aq pynvim
    sudo emerge -aq astyle
    sudo emerge -aq ctags
    sudo emerge -aq ripgrep
    

usage
-------------------       
    cd ~/.config
    git clone https://github.com/jiuhao2019/nvim.git    
    nvim
    :checkhealth
