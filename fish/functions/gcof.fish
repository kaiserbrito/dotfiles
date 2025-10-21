function gcof
    set branch (git branch --format='%(refname:short)' | fzf)
    if test -n "$branch"
        # Try to checkout local branch first, otherwise track the remote one
        git checkout $branch
    end
end
