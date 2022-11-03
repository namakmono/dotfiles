# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#!/bin/zsh

## zsh専用設定
# setup for zinit
source $(brew --prefix)/opt/zinit/zinit.zsh

# theme
zinit ice depth=1; zinit light romkatv/powerlevel10k
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# brew管理のアプリの補完ファイル等をFPATHに追加
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

fi

# zshの補完機能を有効にする
autoload -Uz compinit
compinit


## シェル汎用設定
# set CLICOLOR to color 'ls' and so on
export CLICOLOR=true

# setup for asdf
. /usr/local/opt/asdf/libexec/asdf.sh

# set PATH for psql etc.
export PATH="/usr/local/opt/libpq/bin:$PATH"

# set PATH for nand2tetris
export PATH=$PATH:~/workplace/nand2tetris/tools
