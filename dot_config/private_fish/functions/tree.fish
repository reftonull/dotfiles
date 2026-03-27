function tree --description "Worktree + agent workflow manager"
    if test (count $argv) -eq 0; or contains -- --help $argv; or contains -- -h $argv
        echo "Usage: tree <command> [args]"
        echo ""
        echo "Commands:"
        echo "  new <task> [claude|codex]   Create worktree, Graphite branch, cmux workspace, start agent"
        echo "  ls                          List active worktrees with Graphite status"
        echo "  rm <task>                   Remove worktree and Graphite branch"
        echo "  go [task]                   Jump into a worktree (fzf picker if no arg)"
        echo "  sync                        Sync Graphite from main checkout"
        return 0
    end

    set -l verb $argv[1]
    set -e argv[1]

    switch $verb
        case new
            _tree_new $argv
        case ls
            _tree_ls $argv
        case rm
            _tree_rm $argv
        case go
            _tree_go $argv
        case sync
            _tree_sync $argv
        case '*'
            echo "tree: unknown command '$verb'"
            echo "Run 'tree --help' for usage."
            return 1
    end
end
