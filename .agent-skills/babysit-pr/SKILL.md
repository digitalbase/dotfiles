---
name: babysit-pr
description: Monitor a pull request until review bots and required checks pass on its latest commit. Use when the user asks to watch, monitor, follow, or babysit a PR.
---

# Babysit PR

Use harness-native monitoring tools when available. Otherwise, poll the pull request for new comments and checks.

Only act on checks and comments newer than the latest push. Verify every bot finding against the source before changing code. Fix real findings and CI failures, distinguish repository failures from infrastructure flakes, and reply with a written reason when dismissing false positives.

Watch the repository's default branch for changes and rebase when needed. If an overlapping pull request makes this one obsolete, stop monitoring, report it to the user, and ask before closing the pull request unless closure was explicitly authorized.

When replying on Gijs's behalf, use this format:

```md
[MODEL-SLUG] RESPONDING ON BEHALF OF GIJS
------

[actual reply]
```

Use screenshots or videos when they materially help explain or verify a change. Use the `file-upload` skill when it is available and needed.

Do not let review feedback expand the pull request beyond the user's original goal. Address real shortcomings while avoiding scope creep.

If nothing has changed, stay quiet rather than posting filler comments. Stop when review bots and required checks are green on the latest commit. Merge only when the user explicitly requests it; otherwise report that the pull request is ready.
