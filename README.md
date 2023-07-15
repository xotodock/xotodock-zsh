
### xotodock-zsh

```bash
# run :
docker build https://raw.githubusercontent.com/xotodock/xotodock-zsh/development/Dockerfile -t xoto


# as an alternative you can run :
docker run -e TERM -e COLORTERM -e LC_ALL=C.UTF-8 -it --rm alpine sh -uec '
  apk --no-cache add git zsh nano neovim curl exa ncurses
  adduser -D xoto
  mkdir -p ~/.config
  git clone --depth=1 https://github.com/xotodot/xotodot-zsh.git ~/.config/zsh
  git clone --depth=1 https://github.com/xotovim/xotovim.git ~/.config/nvim
  sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"
  curl -L https://raw.githubusercontent.com/zsh-users/antigen/master/bin/antigen.zsh >~/.config/antigen.zsh
  echo "source ~/.config/zsh/.zshrc" >> ~/.zshrc
  exec zsh'
```




