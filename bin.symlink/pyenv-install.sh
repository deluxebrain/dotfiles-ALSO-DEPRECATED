#!/usr/bin/env bash

pyenv install --list | sed -n 's/^[ \t]*\(\(.*\)-\)\?\([0-9]*\.[0-9]*\.[0-9]*\)$/\3/p' | sort -V | tail -n 1
