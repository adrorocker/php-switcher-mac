#!/bin/bash
# @author adro
echo "🍺   php switcher for Mac  🍺"
version=$1
if [[ "7.1" != $version && "7.2" != $version && "7.3" != $version && "0" != $version ]]
then
    echo "You must specify php version (7.3, 7.2, 7.1, 7.0 or 5.6)"
    exit 1
else
    if [[ "0" != $version ]]
    then
        echo "> Preparing to load php $version"
    fi
fi
function unload_php {
    echo "> Unloading current php version"
    brew unlink php@7.3 > /dev/null
    brew unlink php@7.2 > /dev/null
    brew unlink php@7.1 > /dev/null
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php.plist 2> /dev/null
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php@7.2.plist 2> /dev/null
    launchctl unload -w ~/Library/LaunchAgents/homebrew.mxcl.php@7.1.plist 2> /dev/null
}
function load_php {
    echo "> Loading desired php version"
    brew link php@$1 --force > /dev/null
    if [[ "7.3" != $1 ]]
    then
        launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php@$1.plist
    else
        launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.php.plist
    fi
    sed -i '' 's;^PHP_HOME=.*;PHP_HOME='"$(brew --prefix php@$1)/bin"';' ~/.bash_profile
    source ~/.bash_profile
    echo "> "`php -v | head -n 1`" Loaded"
}
unload_php
if [[ "0" != $version ]]
then
    load_php $version
fi