#!/bin/bash

# Choose best editor available on system
editor() {
    if command -v lvim &>/dev/null; then
        lvim "$@"
    elif command -v nvim &>/dev/null; then
        nvim "$@"
    elif command -v vim &>/dev/null; then
        vim "$@"
    else
        vi "$@"
    fi
}
