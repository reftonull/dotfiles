function _tree_submit --description "Submit current branch to Graphite"
    # Confirm we're inside a worktree
    if not string match -q "*/.trees/*" (pwd)
        echo "Run tree submit from inside a worktree."
        return 1
    end

    # Check for uncommitted changes
    set -l dirty (git status --porcelain 2>/dev/null)
    if test -n "$dirty"
        echo "You have uncommitted changes. Commit them first with gt modify? (y/N)"
        read -l confirm
        if test "$confirm" = y; or test "$confirm" = Y
            set -l task_name (basename (pwd))
            gt modify -a -m "$task_name: update"
            if test $status -ne 0
                echo "Failed to commit changes"
                return 1
            end
        end
    end

    # Submit
    if contains -- --stack $argv
        gt submit --stack
    else
        gt submit
    end

    set -l submit_status $status

    # Try to open PR URL in cmux browser
    if test $submit_status -eq 0; and set -q CMUX_WORKSPACE_ID; and command -q cmux
        set -l pr_url (gt pr 2>/dev/null | string match -r 'https://[^ ]+')
        if test -n "$pr_url"
            cmux browser goto "$pr_url" 2>/dev/null
        end
    end

    return $submit_status
end
