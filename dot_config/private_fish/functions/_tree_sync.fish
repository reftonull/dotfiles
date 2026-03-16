function _tree_sync --description "Sync Graphite from main checkout"
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -ne 0
        echo "Not in a git repo"
        return 1
    end

    # Warn if inside a worktree
    if string match -q "*/.trees/*" (pwd)
        echo "⚠️  Run tree sync from the main checkout, not from inside a worktree."
        return 1
    end

    pushd "$root"
    gt sync --force
    set -l sync_status $status
    popd

    if test $sync_status -eq 0
        echo "✓ Synced with Graphite"
    else
        echo "Graphite sync failed"
        return 1
    end
end
