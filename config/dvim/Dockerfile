FROM alpine:3.5

ARG userName=unknown
ARG userGroup=unknown
ARG userId=1234
ARG userGroupId=1234

RUN (getent group $userGroupId) 2>&1 > /dev/null && delgroup $(getent group $userGroupId | cut -d ':' -f 1) || echo "no conflicting group id to delete"

RUN delgroup $userGroup 2>&1 > /dev/null || echo "no conflicting group name to delete"

RUN addgroup -S -g $userGroupId $userGroup \
 && adduser $userName -D -u $userId -G $userGroup \
 && mkdir -p /root/.config/nvim/autoload \
 && mkdir -p /root/.config/ycm \
 && apk add --update clang git python ctags ncurses libxt libx11 libstdc++ \
 && apk add --virtual build-deps curl python-dev cmake build-base \
    make libxpm-dev libx11-dev libxt-dev ncurses-dev \
 && cd /tmp \
 && git clone --depth=1 https://github.com/vim/vim \
 && cd /tmp/vim \
 && ./configure --with-features=big \
                --enable-multibyte \
                --enable-pythoninterp \
                --with-python-config-dir=/usr/lib/python2.7/config \
                --disable-gui \
                --disable-netbeans \
                --prefix /usr \
 && make install \
 && rm -rf /tmp/vim \
 && cd /root/.config/nvim \
 && curl -O https://raw.githubusercontent.com/aphecetche/dotfiles/master/config/nvim/init.vim \
 && cd autoload \
 && curl -O https://raw.githubusercontent.com/aphecetche/dotfiles/master/config/nvim/autoload/plug.vim \
 && cd /root/.config/ycm \
 && curl -O https://raw.githubusercontent.com/aphecetche/dotfiles/master/config/ycm/ycm_extra_conf.py \
 && ln -s /root/.config/nvim/init.vim /root/.vimrc \
 && ln -s /root/.config/nvim /root/.vim \
 && vim --not-a-term -c "PlugInstall! | qall!" \
 && cd /root/.config/nvim/plugged/YouCompleteMe \
 && mkdir build \
 && cd build \
 && cmake ../third_party/ycmd/cpp/ -DEXTERNAL_LIBCLANG_PATH=/usr/lib/libclang.so.3.8 \
 && cmake --build . --target ycm_core \
 && cd /root/.config/nvim/plugged/YouCompleteMe \
 && rm -rf build \
 && rm /root/.vimrc /root/.vim \
 && chmod 644 /root/.viminfo \
 && mv /root/.config /home/$userName \
 && mv /root/.viminfo /home/$userName \
 && apk del build-deps \
 && git clone --depth=1 https://github.com/chriskempson/base16-shell /home/$userName/base16-shell
 && chown -R $userName:$userGroup /home/$userName

COPY vim.sh /usr/local/bin/vim.sh

USER $userName

WORKDIR /home/$userName

RUN ln -s .config/nvim .vim \
 && ln -s .config/nvim/init.vim .vimrc \
 && ln -s .config/ycm/ycm_extra_conf.py .ycm_extra_conf.py

ENTRYPOINT ["/bin/sh","/usr/local/bin/vim.sh"]

