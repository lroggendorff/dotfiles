# Add `~/bin` to the `$PATH`
export PATH="$HOME/bin:$PATH"

eval "$(/opt/homebrew/bin/brew shellenv)"
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi
eval "$(pyenv init --path)"

