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
    set -l root (_tree_root)
    if test -z "$root"
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

    # Copy env files (searches all subdirectories, preserving paths)
    set -q TREE_COPY_FILES; or set -l TREE_COPY_FILES .env .env.local .envrc TypoConfig-local.plist
    for f in $TREE_COPY_FILES
        for src in (find "$root" -name "$f" -not -path "*/.trees/*" -not -path "*/.git/*" 2>/dev/null)
            set -l rel (string replace "$root/" "" "$src")
            set -l dest "$tree_path/$rel"
            mkdir -p (dirname "$dest")
            cp "$src" "$dest"
        end
    end

    # cmux workspace setup
    if set -q CMUX_WORKSPACE_ID; and command -q cmux
        echo "Setting up cmux workspace..."
        set -l ws_ref (cmux new-workspace --cwd "$tree_path" 2>/dev/null | string replace 'OK ' '')
        if test $status -eq 0
            cmux rename-workspace --workspace "$ws_ref" "$task" 2>/dev/null
            cmux new-pane --direction right --workspace "$ws_ref" 2>/dev/null
            echo "Starting $agent..."
            cmux send --workspace "$ws_ref" "$agent"
            cmux send-key --workspace "$ws_ref" Enter
        else
            echo "⚠️  Could not create cmux workspace"
            cd "$tree_path"
            switch $agent
                case codex
                    codex
                case '*'
                    claude
            end
        end
    else
        cd "$tree_path"
        switch $agent
            case codex
                codex
            case '*'
                claude
        end
    end
end
