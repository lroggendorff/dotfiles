# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Hub (http://defunkt.io/hub/)
eval "$(hub alias -s)"
fpath=('/usr/local/share/zsh/site-functions' $fpath)

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(fabric)

source $ZSH/oh-my-zsh.sh

# RBENV http://rbenv.org/
if which rbenv > /dev/null; then eval "$(rbenv init - zsh)"; fi

# z
. `brew --prefix`/etc/profile.d/z.sh

# Python
export WORKON_HOME=~/.virtualenvs
source /usr/local/bin/virtualenvwrapper.sh

# Sane nocorrect maintenance
if [ -f ~/.zsh_nocorrect ]; then
    while read -r COMMAND; do
        alias $COMMAND="nocorrect $COMMAND"
    done < ~/.zsh_nocorrect
fi

# Load the shell dotfiles, and then some:
# * ~/.path can be used to set or extend `$PATH`.
# * ~/.extra can be used for settings you don’t want to commit.
for file in ~/.{path,exports,aliases,functions,extra}; do
	[ -r "$file" ] && source "$file"
done
unset file

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
