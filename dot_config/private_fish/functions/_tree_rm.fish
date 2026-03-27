function _tree_rm --description "Remove worktree and Graphite branch"
    set -l root (_tree_root)
    if test -z "$root"
        echo "Not in a git repo"
        return 1
    end

    set -l task
    if test (count $argv) -ge 1
        set task $argv[1]
    else if command -q fzf
        set task (_tree_list_tasks | fzf --prompt="remove> ")
        if test -z "$task"
            return 0
        end
    else
        echo "Usage: tree rm <task>"
        return 1
    end

    set -l tree_path "$root/.trees/$task"

    if not test -d "$tree_path"
        echo "Worktree not found: $task"
        return 1
    end

    # Check for uncommitted changes
    set -l dirty (git -C "$tree_path" status --porcelain 2>/dev/null)
    if test -n "$dirty"
        echo "⚠️  Worktree has uncommitted changes. Remove anyway? (y/N)"
        read -l confirm
        if test "$confirm" != y; and test "$confirm" != Y
            echo "Aborted."
            return 1
        end
    end

    # Remove worktree
    git worktree remove "$tree_path" --force
    if test $status -ne 0
        echo "Failed to remove worktree"
        return 1
    end

    echo "✓ Removed: $task"
end
