# FOR DEBUG
# zmodload zsh/zprof

# Japanese language settings
export LANG=ja_JP.UTF-8

# Path settings
export PATH="$HOME/bin:$PATH"
export PATH="$HOME/.composer/vendor/bin:$PATH"

# Android Studio
export ANDROID_HOME="$HOME/Library/Android/sdk"
export PATH=$ANDROID_HOME/tools:$PATH
export PATH=$ANDROID_HOME/platform-tools:$PATH

# Alias settings
alias ll="ls -l"
alias where="command -v"
alias su="su -l"
alias gs="git status "
alias ga="git add "
alias gb="git branch "
alias gc="git commit"
alias gd="git diff"
alias go="git checkout "

# Completion configuration
# zplugが読み込むためコメントアウト
# autoload -U compinit
# compinit -c

# Move directory from directory name
setopt AUTO_CD
cdpath=(.. ~ /data/works/workspace)

# Command correct edition before each completion attempt
setopt correct

# Aliased ls needs if file/dir completions work
setopt complete_aliases

# 語の途中でもカーソル位置で補完
setopt complete_in_word

# 日本語ファイル名等8ビットを通す
setopt print_eight_bit

# 拡張グロブで補完(~とか^とか。例えばless *.txt~memo.txt ならmemo.txt 以外の *.txt にマッチ)
# setopt extended_glob

# 明確なドットの指定なしで.から始まるファイルをマッチ
# setopt globdots

# No remove postfix slash of command line
setopt noautoremoveslash

# ディレクトリ名の補完で末尾の / を自動的に付加し、次の補完に備える
setopt auto_param_slash

# ファイル名の展開でディレクトリにマッチした場合 末尾に / を付加
setopt mark_dirs

# 補完候補一覧でファイルの種別を識別マーク表示 (訳注:ls -F の記号)
setopt list_types

# 補完キー連打で順に補完候補を自動で補完
# setopt auto_menu

# コマンドラインの引数で --prefix=/usr などの = 以降でも補完できる
setopt magic_equal_subst

# No beep sound when complete list displayed
setopt nolistbeep

# Display cd histories
setopt auto_pushd

# Make sure propt is able to be generated properly.
setopt prompt_subst

##############################
# PROMPT
##############################
# https://www.alexscotton.com/post/a-modular-responsive-zsh-theme-and-some-bonus-unix-commands
# https://gist.github.com/smileart/3750104
# https://github.com/unixorn/awesome-zsh-plugins
# https://github.com/caiogondim/bullet-train-oh-my-zsh-theme
# autoload colors
# colors
# PROMPT="%{${fg[blue]}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
# PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
# SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "

##############################
# history
##############################
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end


#色の定義
# http://voidy21.hatenablog.jp/entry/20090902/1251918174
# https://h2ham.net/zsh-prompt-color
# http://futurismo.biz/archives/1363
# http://qiita.com/syui/items/ed2d36698a5cc314557d
local DEFAULT=$'%{\e[m%}'$
local RED=$'%{\e[1;31m%}'$
local GREEN=$'%{\e[1;32m%}'$
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'$
local PURPLE=$'%{\e[1;35m%}'$
local LIGHT_BLUE=$'%{\e[1;36m%}'$
local WHITE=$'%{\e[1;37m%}'$


##############################
# zstyle
##############################
# 補間をカーソルキーで選択できるようにする
zstyle ':completion:*:default' menu select=2

zstyle ':completion:*' list-separator '-->'
zstyle ':completion:*' verbose yes
zstyle ':completion:*' completer _expand _complete _match _prefix _approximate _list _history
zstyle ':completion:*:messages' format $YELLOW'%d'$DEFAULT
zstyle ':completion:*:warnings' format $RED'No matches for:'$YELLOW' %d'$DEFAULT
zstyle ':completion:*:descriptions' format $YELLOW'completing %B%d%b'$DEFAULT
zstyle ':completion:*:corrections' format $YELLOW'%B%d '$RED'(errors: %e)%b'$DEFAULT
zstyle ':completion:*:options' description 'yes'

# カレントディレクトリに候補がない場合のみ cdpath 上のディレクトリを候補に出す
zstyle ':completion:*:cd:*' tag-order local-directories path-directories

#cd は親ディレクトリからカレントディレクトリを選択しないので表示させないようにする (例: cd ../<TAB>):
zstyle ':completion:*:cd:*' ignore-parents parent pwd

#LS_COLORSを設定しておく
export LS_COLORS='di=36:ln=35:so=32:pi=33:ex=31:bd=46;36:cd=43;36:su=41;30:sg=46;30:tw=42;30:ow=43;30'

#ファイル補完候補に色を付ける
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# グループ名に空文字列を指定すると，マッチ対象のタグ名がグループ名に使われる。
# したがって，すべての マッチ種別を別々に表示させたいなら以下のようにする
zstyle ':completion:*' group-name ''

# brew等後入れのライブラリも補間を可能にする
fpath=("$HOME/bin/zsh-completions/src" $fpath)

##############################
# phpbrew
# TOO HEAVY なため不要
###############################
# source $HOME/.phpbrew/bashrc

##############################
# Node.js
##############################
export NODE_PATH=$NODE_PATH:./
export PATH=$HOME/.nodebrew/current/bin:$PATH

##############################
# Python
# http://qiita.com/nakazonor/items/258496fc442f7937c478
##############################
# PYENV_ROOT=~/.pyenv
# export PATH=$PATH:$PYENV_ROOT/bin
# eval "$(pyenv init -)"
# eval "$(pyenv virtualenv-init -)"

##############################
# direnv
##############################
# export EDITOR=atom
# eval "$(direnv hook zsh)"

##############################
# zplug
##############################
# http://qiita.com/b4b4r07/items/cd326cd31e01955b788b
# https://github.com/zplug/zplug
# http://post.simplie.jp/posts/59
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "plugins/brew", from:oh-my-zsh, defer:1
zplug "plugins/git", from:oh-my-zsh, defer:1
zplug "plugins/npm", from:oh-my-zsh, defer:1
# zplug "plugins/fabric", from:oh-my-zsh, nice:1
# zplug "plugins/git-hubflow", from:oh-my-zsh, nice:1
# zplug "plugins/git-flow", from:oh-my-zsh, nice:1
# zplug "plugins/osx", from:oh-my-zsh, nice:1, if:"[[ $OSTYPE == *darwin* ]]"
# Theme
# https://github.com/sindresorhus/pure
zplug "mafredri/zsh-async", from:github
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# zplug check returns true if all packages are installed
# Therefore, when it returns false, run zplug install
if ! zplug check; then
    zplug install
fi

# source plugins and add commands to the PATH
zplug load

# zplug check returns true if the given repository exists
if zplug check b4b4r07/enhancd; then
    # setting if enhancd is available
    export ENHANCD_FILTER=fzf-tmux
fi

# FOR DEBUG
# if type zprof > /dev/null 2>&1; then
#   zprof | less
# fi

# [ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# # The next line updates PATH for the Google Cloud SDK.
# if [ -f '/Users/suttang/bin/google-cloud-sdk/path.zsh.inc' ]; then source '/Users/suttang/bin/google-cloud-sdk/path.zsh.inc'; fi

# # The next line enables shell command completion for gcloud.
# if [ -f '/Users/suttang/bin/google-cloud-sdk/completion.zsh.inc' ]; then source '/Users/suttang/bin/google-cloud-sdk/completion.zsh.inc'; fi
