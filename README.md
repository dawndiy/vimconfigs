# Vim 配置

整理自己用的 Vim 配置，插件使用 Vim-Plug 管理插件。

## 安装

克隆项目到自己的配置目录里
```bash
git clone https://github.com/dawndiy/vimconfigs ~/.vim
```

安装 Vim-Plug
```bash
# Vim (~/.vim/autoload)
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Neovim (~/.local/share/nvim/site/autoload)
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

插件安装及新增请参考：[junegunn/vim-plug](https://github.com/junegunn/vim-plug)


Neovim

在 `~/.config/init.vim` 中添加

```vim
set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc
```
