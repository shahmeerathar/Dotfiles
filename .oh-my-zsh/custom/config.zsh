# Aliases
alias zshrc="vim ~/.zshrc"
alias addalias="nvim $ZSH/custom/config.zsh" 
alias brewtree="brew deps --tree --installed"
alias dev="cd ~/Developer"
alias tree="ls --long --tree"
alias dotfiles="/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME"
alias espidf=". ~/Developer/esp32/esp-idf/export.sh"
alias findalias="eval \$(alias | fzf | sed 's/=.*//')"
alias llm="ollama run \$(ollama ls | sed '1d' | fzf | awk '{print \$1}' | tee /dev/stderr)"
alias llmstop="ollama ps | awk 'NR > 1 {print \$1}' | xargs -n1 ollama stop"
alias venv='source ~/.venvs/$(ls ~/.venvs | fzf)/bin/activate'
alias mkvenv="create_venv"

create_venv() {
    if [ -z "$1" ]; then
        echo "Error: Please specify a venv name."
        return 1
    fi
    VENVNAME="$1"
    if [[ "$VENVNAME" != *-venv ]]; then
        VENVNAME="${VENVNAME}-venv"
    fi
    mkdir -p ~/.venvs
    python3 -m venv ~/.venvs/"$VENVNAME"
    echo "Virtual environment '$VENVNAME' created at ~/.venvs/$VENVNAME"
}

# eza
if type brew &>/dev/null; then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"
    autoload -Uz compinit
    compinit
fi

# fzf
export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git --exclude "Pictures/Photos Library.photoslibrary/" --exclude Movies/TV --exclude Music/Music --exclude Library/ --exclude .zsh_sessions --exclude .DS_Store --exclude .nvm/ --exclude .npm --exclude .cache/ --exclude .oh-my-zsh/themes --exclude .oh-my-zsh/plugins --exclude .oh-my-zsh/lib --exclude .oh-my-zsh/.github --exclude .oh-my-zsh/tools --exclude .tldrc/ --exclude .dotfiles/'
export FZF_DEFAULT_OPTS="--height 40% --layout reverse --border"
alias fzfpreview='fzf --preview="bat --color=always {}" --height=100% --border=none --layout=default'

# brew
alias writebrewfile='brew bundle dump'
alias installbrewfile='brew bundle install'
brew_uninstall_all_packages() {
    while [[ `brew list | wc -l` -ne 0 ]]; do
        for EACH in `brew list`; do
            brew uninstall --ignore-dependencies $EACH --force
        done
    done
}

# nvm
# Lazy loading nvm. From:
# https://github.com/undg/zsh-nvm-lazy-load/blob/master/zsh-nvm-lazy-load.plugin.zsh
typeset -ga __lazyLoadLabels=(nvm node npm npx pnpm yarn pnpx bun bunx)

__load-nvm() {
    export NVM_DIR="${NVM_DIR:-$HOME/.nvm}"

    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
    [ -s "$NVM_DIR/bash_completion" ] && source "$NVM_DIR/bash_completion"
}

__work() {
    for label in "${__lazyLoadLabels[@]}"; do
        unset -f $label
    done
    unset -v __lazyLoadLabels

    __load-nvm
    unset -f __load-nvm __work
}

for label in "${__lazyLoadLabels[@]}"; do
    eval "$label() { __work; $label \$@; }"
done
