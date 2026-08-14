---
name: file-pr
description: File a concise, review-ready pull request for the current branch. Use when the user asks to file, open, or create a PR.
---

# File PR

Before filing, check whether a pull request already exists for the branch. Review the local diff against `origin/main`, or `origin/master` when that is the repository's default branch, and verify that the changes match the user's goal.

Follow the repository's title conventions because pull request titles often become commit messages. Inspect recently merged pull requests and recent Git history for examples.

Prefer a concise, human-readable title that explains why the change matters:

```text
BAD:  perf(server): negotiate permessage-deflate on the websocket
GOOD: perf(server): cut websocket frame size by 70%+ with gzipping
```

Open the description with a plain explanation of the problem based on the user's original prompt, then briefly explain the solution. Do not lead with an implementation inventory:

```text
BAD:  Removed implicit workspace carry-over from every new-thread entry point...
GOOD: My new-worktree default was ignored when starting new threads on existing
      worktrees. Now those preferences always apply.
```

Open a ready-for-review pull request rather than a draft so review bots run. Use the available GitHub integration or CLI to create it; do not ask the user to finish the operation in a browser.

If the user also asks to watch the pull request, continue with the `babysit-pr` skill.
