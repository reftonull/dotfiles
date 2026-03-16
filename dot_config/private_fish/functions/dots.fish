function dots --description "Sync and push dotfiles"
    chezmoi re-add
    set -l src (chezmoi source-path)
    pushd "$src"
    git add -A
    if test (count $argv) -gt 0
        git commit -m "$argv"
    else
        git commit -m "update dotfiles"
    end
    git push
    popd
end
