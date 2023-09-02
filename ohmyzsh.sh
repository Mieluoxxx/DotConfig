wget https://gitee.com/mirrors/oh-my-zsh/tree/master/tools/install.sh
chmod a+x install.sh
sh install.sh
rm -rf install.sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions

echo '\n#######################################################################
请修改.zshrc中plugins=(git zsh-syntax-highlighting zsh-autosuggestions)\n以开启zsh的高亮与自动补全'
