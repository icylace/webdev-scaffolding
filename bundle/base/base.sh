#!/usr/bin/env bash

setup_base() {
  mkdir ./dist
  mkdir -p ./src/client

  # EditorConfig
  # EditorConfig helps developers define and maintain consistent coding styles
  # between different editors and IDEs.
  # https://editorconfig.org/
  cp "$WEBDEV_BUNDLE/base/.editorconfig" .

  # Make a README
  # Because no one can read your mind (yet)
  # https://www.makeareadme.com/
  # https://github.com/RichardLitt/standard-readme
  cp "$WEBDEV_BUNDLE/base/README.md" .

  # humans.txt
  # It's an initiative for knowing the people behind a website.
  # http://humanstxt.org/
  cp "$WEBDEV_BUNDLE/base/humans.txt" ./src/client

  # The MIT License
  # https://opensource.org/licenses/MIT

  # Put the current year in the license file.
  sed "s/{{year}}/$(date +%Y)/g" "$WEBDEV_BUNDLE/base/LICENSE.md" > ./LICENSE.md
}
