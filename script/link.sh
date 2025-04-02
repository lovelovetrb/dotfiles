#!/bin/sh
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

dotfiles_root=$(cd $(dirname $0)/.. && pwd)

git clone git@github.com:lovelovetrb/nvchad_starter.git ~/.config/nvim

# linklist.txtのコメントを削除
__remove_linklist_comment() {(
    # '#'以降と空行を削除
    sed -e 's/\s*#.*//' \
        -e '/^\s*$/d' \
        $1
)}

# シンボリックリンクを作成
cd ${dotfiles_root}/dotfiles
linklist="../script/linklist.txt"
[ ! -r "$linklist" ] && return
__remove_linklist_comment "$linklist" | while read target link; do
    # ~ や環境変数を展開
    target=$(eval echo "${PWD}/${target}")
    link=$(eval echo "${link}")
    # シンボリックリンクを作成
    mkdir -p $(dirname ${link})
    ln -fsn ${target} ${link}
done
