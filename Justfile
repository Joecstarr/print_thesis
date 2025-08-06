@_default:
    just --list

build:
    nextonic compile main.tex --keep-logs --keep-intermediates

build-cover:
    nextonic compile cover-paperback.tex --keep-logs --keep-intermediates

go: build build-cover 
    echo "done!"
