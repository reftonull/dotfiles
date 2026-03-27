function _tree_list_tasks --description "List task names for all worktrees under .trees/"
    set -l root (_tree_root)
    set -l trees_dir "$root/.trees"
    for line in (git worktree list --porcelain 2>/dev/null)
        if string match -q "worktree *" $line
            set -l wt_path (string replace "worktree " "" $line)
            if string match -q "$trees_dir/*" "$wt_path"
                string replace "$trees_dir/" "" "$wt_path"
            end
        end
    end
end
