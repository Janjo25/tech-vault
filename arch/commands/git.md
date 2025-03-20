# **Useful Git Commands**

## Rebase **All Commits from the Root** While Preserving Dates

Reapplies all commits from the repository’s root, maintaining the original author and committer dates:

```sh
git rebase --root --committer-date-is-author-date
```

This is useful when rewriting history while keeping timestamps intact. If conflicts arise, resolve them and continue the
rebase with:

```sh
git rebase --continue
```

To abort the process at any time, use:

```sh
git rebase --abort
```
