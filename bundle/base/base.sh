#!/usr/bin/env bash

# $1 = Directory containing scaffold bundles.
setup_base() {
  if [ -z "$1" ] ; then
    echo 'ERROR: Scaffold bundle directory required.'
    return 1
  fi

  mkdir ./dist
  mkdir -p ./src/client

  # EditorConfig
  # EditorConfig helps developers define and maintain consistent coding styles
  # between different editors and IDEs.
  # https://editorconfig.org/
  cp "$1/base/.editorconfig" .

  # Make a README
  # Because no one can read your mind (yet)
  # https://www.makeareadme.com/
  # https://github.com/RichardLitt/standard-readme
  cp "$1/base/README.md" .

  # humans.txt
  # It's an initiative for knowing the people behind a website.
  # http://humanstxt.org/
  cp "$1/base/humans.txt" ./src/client

  # The MIT License
  # https://opensource.org/licenses/MIT

  # Put the current year in the license file.
  sed "s/{{year}}/$(date +%Y)/g" "$1/LICENSE.md" > ./LICENSE.md
}
