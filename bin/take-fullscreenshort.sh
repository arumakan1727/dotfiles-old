#!/usr/bin/env bash
set -eu

readonly screenshot_dir=$HOME/Pictures/Screenshots/

[ -d $screenshot_dir ] || command mkdir -p $screenshot_dir
import -window root $screenshot_dir/fullscreenshort_$(date "+%Y-%m-%d_%H:%M:%S").jpeg
