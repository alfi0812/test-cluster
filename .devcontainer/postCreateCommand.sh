#!/usr/bin/env bash
set -e
set -o noglob

# Setup fisher plugin manager for fish and install plugins
/usr/bin/fish -c "
curl -sL https://git.io/fisher | source && fisher install jorgebucaran/fisher
fisher install decors/fish-colored-man
fisher install edc/bass
fisher install jorgebucaran/autopair.fish
fisher install nickeb96/puffer-fish
fisher install PatrickF1/fzf.fish
"

curl -fsSLO "https://github.com/kubernetes-sigs/krew/releases/latest/download/krew-linux_amd64.tar.gz" \
    && tar zxvf "krew-linux_amd64.tar.gz" \
    && ./"krew-linux_amd64" install krew \
    && rm ./krew-linux_amd64.tar.gz

export PATH="${KREW_ROOT:-$HOME/.krew}/bin:$PATH"

kubectl krew install pv-mounter
kubectl krew install cnpg
kubectl krew install df-pv