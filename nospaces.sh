#!/bin/sh

# nospaces: replace spaces with underscores

#find . -print0 | xargs -0 prename "s/ /_/g"

find . -exec prename "s/ /_/g" {} +
