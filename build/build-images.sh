#!/bin/bash
set -e
cd "$(dirname "$0")"



# Build a devcontainer image for a given directory
build_image() {
  local dir="$1"
  local image_name="devcontainer-$dir"
  local image_tag="latest"

  echo "Building $image_name:$image_tag"
  devcontainer build --workspace-folder "$(dir)" --image-name devcontainer_builder:alpha --output type=registry,name=
  #todo: add new registry link
}