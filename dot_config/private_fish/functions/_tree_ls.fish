function _tree_ls --description "List active worktrees with Graphite status"
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -ne 0
        echo "Not in a git repo"
        return 1
    end

    set -l trees_dir "$root/.trees"
    if not test -d "$trees_dir"
        echo "No active worktrees."
        return 0
    end

    # Get list of worktree directories
    set -l worktrees (find "$trees_dir" -mindepth 1 -maxdepth 1 -type d 2>/dev/null)
    if test (count $worktrees) -eq 0
        echo "No active worktrees."
        return 0
    end

    # Get Graphite branch list once
    set -l gt_output (gt ls --all 2>/dev/null)

    # Get list of branches with PRs (gt ls shows PR info)
    set -l gt_stack_output (gt stack 2>/dev/null)

    # Header
    printf "%-24s %-24s %-20s %s\n" "TASK" "BRANCH" "STATUS" "PATH"
    printf "%-24s %-24s %-20s %s\n" "----" "------" "------" "----"

    for wt in $worktrees
        set -l task_name (basename "$wt")

        # Get branch name from worktree
        set -l branch (git -C "$wt" rev-parse --abbrev-ref HEAD 2>/dev/null)
        if test -z "$branch"
            set branch "$task_name"
        end

        # Check Graphite tracking
        set -l status_str "✗ untracked"
        if echo "$gt_output" | string match -q "*$branch*"
            # Check if it has a PR by looking for PR URL in log
            set -l pr_url (cd "$wt" 2>/dev/null; and gt pr 2>/dev/null | string match -r 'https://.*')
            if test -n "$pr_url"
                set status_str "✓ tracked (PR)"
            else
                set status_str "✓ tracked"
            end
        end

        set -l rel_path ".trees/$task_name"
        printf "%-24s %-24s %-20s %s\n" "$task_name" "$branch" "$status_str" "$rel_path"
    end
end
