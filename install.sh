#/usr/bin/evn bash

set -o errexit
set -o nounset
set -o xtrace
set -o pipefail

ln -sfT $(pwd)/.zsh $HOME/.zsh
ln -sfT $(pwd)/.zshrc $HOME/.zshrc

ln -sfT $(pwd)/.tmux.conf $HOME/.tmux.conf
ln -sfT $(pwd)/.tmux $HOME/.tmux

ln -sfT $(pwd)/.config/nvim $HOME/.config/nvim


if [ ! -f "${HOME}/.gitconfig-local" ]; then
	read FULLNAME
	read EMAIL
	cat << EOF > ${HOME}/.gitconfig-local
		[user]
		name = ${FULLNAME}
		email = ${EMAIL}
EOF
fi

ln -sfT $(pwd)/.gitconfig $HOME/.gitconfig



mkdir -p ~/.vim
touch ~/.vim/local.vim
