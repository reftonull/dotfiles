function _tree_new --description "Create worktree, Graphite branch, cmux workspace, start agent"
    if test (count $argv) -lt 1
        echo "Usage: tree new <task> [claude|codex]"
        return 1
    end

    set -l task $argv[1]
    set -l agent claude
    if test (count $argv) -ge 2
        set agent $argv[2]
    end

    # Validate git repo
    set -l root (git rev-parse --show-toplevel 2>/dev/null)
    if test $status -ne 0
        echo "Not in a git repo"
        return 1
    end

    set -l tree_path "$root/.trees/$task"

    # Create worktree if it doesn't exist
    if test -d "$tree_path"
        echo "✓ Worktree exists: $task"
    else
        echo "Creating worktree: $task"
        git worktree add "$tree_path" -b "$task"
        if test $status -ne 0
            echo "Failed to create worktree"
            return 1
        end

        # Register with Graphite
        pushd "$tree_path"
        gt branch track 2>/dev/null
        if test $status -ne 0
            echo "⚠️  Could not register branch with Graphite (continuing anyway)"
        end
        popd
    end

    # Copy env files
    for f in .env .env.local .envrc
        if test -f "$root/$f"
            cp "$root/$f" "$tree_path/$f"
        end
    end

    # cmux workspace setup
    if set -q CMUX_WORKSPACE_ID; and command -q cmux
        echo "Setting up cmux workspace..."
        set -l ws_output (cmux new-workspace --cwd "$tree_path" 2>&1)
        if test $status -eq 0
            # Create a browser pane on the right
            cmux new-pane --type browser --direction right --url "https://app.graphite.dev" 2>/dev/null
            if test $status -ne 0
                echo "⚠️  Could not create browser pane"
            end
        else
            echo "⚠️  Could not create cmux workspace: $ws_output"
            cd "$tree_path"
        end
    else
        cd "$tree_path"
    end

    # Start agent
    echo "Starting $agent..."
    switch $agent
        case codex
            codex
        case '*'
            claude
    end
end
