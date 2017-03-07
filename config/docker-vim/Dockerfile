FROM aphecetche/alpine-vim-ycm

ARG userName=unknown
ARG userGroup=unknown
ARG userId=1234
ARG userGroupId=1234

RUN (getent group $userGroupId) 2>&1 > /dev/null && delgroup $(getent group $userGroupId | cut -d ':' -f 1) || echo "no conflicting group id to delete" \
; delgroup $userGroup 2>&1 > /dev/null || echo "no conflicting group name to delete" \
; addgroup -S -g $userGroupId $userGroup && adduser -H -D -u $userId -G $userGroup $userName \
; chown -R $userName:$userGroup /usr/share/vim 

COPY vim.sh /usr/local/bin/vim.sh

RUN apk add gcc

USER $userName

ENTRYPOINT ["/usr/local/bin/vim.sh"]

