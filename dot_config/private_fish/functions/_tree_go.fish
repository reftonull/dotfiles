function _tree_go --description "Jump into a worktree"
    set -l root (_tree_root)
    if test -z "$root"
        echo "Not in a git repo"
        return 1
    end

    set -l trees_dir "$root/.trees"

    if test (count $argv) -ge 1
        # Direct jump
        set -l tree_path "$trees_dir/$argv[1]"
        if not test -d "$tree_path"
            echo "Worktree not found: $argv[1]"
            return 1
        end
        cd "$tree_path"
        return 0
    end

    # fzf picker
    if not test -d "$trees_dir"
        echo "No active worktrees."
        return 0
    end

    set -l entries (_tree_list_tasks)
    if test (count $entries) -eq 0
        echo "No active worktrees."
        return 0
    end

    if command -q fzf
        set -l choice (printf '%s\n' $entries | fzf --prompt="worktree> ")
        if test -n "$choice"
            cd "$trees_dir/$choice"
        end
    else
        echo "Available worktrees:"
        for e in $entries
            echo "  $e"
        end
        echo ""
        echo "Usage: tree go <task>  (install fzf for interactive picker)"
    end
end
