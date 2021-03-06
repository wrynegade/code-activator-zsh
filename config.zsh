# cloned projects will be nested under the specified directories,
# allowing for meaningful project grouping. A friendly name is
# derived from the path
#
# e.g. "$HOME/Projects/GitHub" will be called "GitHub" in the CLI
#
# directories must be fully-qualified
CA__DIRS=(
	"$HOME/Projects/GitHub"
	"$HOME/Projects/BitBucket"
	)

# additional cloning targets; MUST END IN ':' or '/'
#    e.g. 'git@my.githost.com:' or 'git@github.com:w0ryn/'
CA__KNOWN_TARGETS=(
	'https://github.com/'
	'https://bitbucket.org/'
	'git@github.com:'
	'git@bitbucket.org:'
	)


# run from the specified hot-key
CA__SHORTCUT=' ' # CTRL+SPACE

# run from the specified alias
CA__ALIAS='lkj'


# enable / disable the shortcut / alias
# 0 = enabled   1 = disabled
CA__DISABLE_SHORTCUT=0 
CA__DISABLE_ALIAS=0


# structure options
# 
# where LOCAL_PROJECT_NAME is provided through the API / CLI, 
# the plugin will attempt to create the following structure:
#
# LOCAL_PROJECT_NAME
#     | SOURCE_DIR  << cloned repository
#     | VIRTUAL_ENV << the project's virtual environment
#     | CUSTOM_ENV  << CODE_ACTIVATOR's custom environment variables file
#     | NO_ENV      << CODE_ACTIVATOR sentinel to avoid prompting env setup
CA__SOURCE_DIR='code'
CA__VIRTUAL_ENV='env'
CA__CUSTOM_ENV='custom-env'
CA__NO_ENV='no-env'

#####################################################################

[ ! -f $_CA__LOCAL_CONFIG ] && {
	mkdir -p -- $(dirname $_CA__LOCAL_CONFIG) >/dev/null 2>&1
	awk '/##/{exit};1' $_CA/config.zsh | sed 's/^[^#]/#&/; $d'> $_CA__LOCAL_CONFIG
}

source $_CA__LOCAL_CONFIG

export \
	CA__DIRS \
	CA__KNOWN_TARGETS \
	CA__SOURCE_DIR \
	CA__VIRTUAL_ENV \
	CA__CUSTOM_ENV \
	CA__NO_ENV \
	;
