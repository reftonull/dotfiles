function _tree_ls --description "List active worktrees with Graphite status"
    set -l root (_tree_root)
    if test -z "$root"
        echo "Not in a git repo"
        return 1
    end

    set -l trees_dir "$root/.trees"
    if not test -d "$trees_dir"
        echo "No active worktrees."
        return 0
    end

    # Get list of worktree task names
    set -l tasks (_tree_list_tasks)
    if test (count $tasks) -eq 0
        echo "No active worktrees."
        return 0
    end

    # Get Graphite branch list once
    set -l gt_output (gt ls --all 2>/dev/null)

    # Header
    printf "%-30s %-30s %-20s %s\n" "TASK" "BRANCH" "STATUS" "PATH"
    printf "%-30s %-30s %-20s %s\n" "----" "------" "------" "----"

    for task_name in $tasks
        set -l wt "$trees_dir/$task_name"

        # Get branch name from worktree
        set -l branch (git -C "$wt" rev-parse --abbrev-ref HEAD 2>/dev/null)
        if test -z "$branch"
            set branch "$task_name"
        end

        # Check Graphite tracking
        set -l status_str "✗ untracked"
        if echo "$gt_output" | string match -q "*$branch*"
            set status_str "✓ tracked"
        end

        set -l rel_path ".trees/$task_name"
        printf "%-30s %-30s %-20s %s\n" "$task_name" "$branch" "$status_str" "$rel_path"
    end
end
