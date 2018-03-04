#!/usr/bin/env bash

# http://www.ostricher.com/2014/10/the-right-way-to-get-the-directory-of-a-bash-script/
# https://stackoverflow.com/a/246128/1935675
HERE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

source "$HERE/webdev-base.sh"
source "$HERE/css.sh"
source "$HERE/javascript.sh"
source "$HERE/webpack.sh"
source "$HERE/webdev-app.sh"

setup_base_css_system
setup_base_javascript_system
setup_base_build
setup_base_webpack
setup_app_system
