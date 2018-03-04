#!/usr/bin/env bash

setup_parcel() {
  declare -n dev="$1"

  # Parcel
  # Blazing fast, zero configuration web application bundler
  # https://parceljs.org/
  dev+=('parcel-bundler')
}
