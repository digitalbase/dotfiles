---
name: babysit-pr
description: Monitor a pull request until review bots and required checks pass on its latest commit. Use when the user asks to watch, monitor, follow, or babysit a PR.
---

# Babysit PR

Use harness-native monitoring tools when available. Otherwise, poll the pull request for new comments and checks.

Only act on checks and comments newer than the latest push. Classify each finding before acting as blocking, valid but non-blocking, false positive, stale, or out of scope. Verify every bot finding against the source before changing code. Fix blocking findings and CI failures that are required for checks or review bots to pass. Do not address optional cleanup, refactoring, or non-blocking nits unless the user asks or the change is necessary for the pull request's original goal. Distinguish repository failures from infrastructure flakes, and reply with a written reason when dismissing false positives or declining stale or out-of-scope findings.

Watch the repository's default branch for changes and rebase when needed. If an overlapping pull request makes this one obsolete, stop monitoring, report it to the user, and ask before closing the pull request unless closure was explicitly authorized.

When replying on Gijs's behalf, use this format:

```md
[MODEL-SLUG] RESPONDING ON BEHALF OF GIJS
------

[actual reply]
```

Use screenshots or videos when they materially help explain or verify a change. Use the `file-upload` skill when it is available and needed.

Do not let review feedback expand the pull request beyond the user's original goal.

Verify each fix with the smallest relevant test or check. Add or update a regression test when the finding exposes untested behavior and the test is practical within the pull request's scope.

If nothing has changed, stay quiet rather than posting filler comments. Stop when review bots and required checks are green on the latest commit. Merge only when the user explicitly requests it; otherwise report that the pull request is ready.
