#!/bin/sh

set -x

git submodule update --remote
git submodule foreach git submodule update
