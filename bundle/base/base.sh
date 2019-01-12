#!/usr/bin/env bash

# $1 = Directory for the base bundle.
setup_base() {
  mkdir ./dist
  mkdir -p ./src/client

  # EditorConfig
  # EditorConfig helps developers define and maintain consistent coding styles
  # between different editors and IDEs.
  # https://editorconfig.org/
  cp "$1/.editorconfig" .

  # Make a README
  # Because no one can read your mind (yet)
  # https://www.makeareadme.com/
  # https://github.com/RichardLitt/standard-readme
  cp "$1/README.md" .

  # humans.txt
  # It's an initiative for knowing the people behind a website.
  # http://humanstxt.org/
  cp "$1/humans.txt" ./src/client

  # The MIT License
  # https://opensource.org/licenses/MIT

  # Put the current year in the license file.
  sed "s/{{year}}/$(date +%Y)/g" "$1/LICENSE.md" > ./LICENSE.md
}
