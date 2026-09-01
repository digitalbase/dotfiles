---
name: babysit-pr
description: Monitor a pull request until review bots and required checks pass on its latest commit. Use when the user asks to watch, monitor, follow, or babysit a PR.
---

# Babysit PR

Use harness-native monitoring tools when available. Otherwise, poll the pull request for new comments and checks.

Only act on checks and comments newer than the latest push. Classify each finding before acting as blocking, valid but non-blocking, false positive, stale, or out of scope. Verify every bot finding against the source before changing code. Fix blocking findings and CI failures that are required for checks or review bots to pass. Do not address optional cleanup, refactoring, or non-blocking nits unless the user asks or the change is necessary for the pull request's original goal. Distinguish repository failures from infrastructure flakes, and reply with a written reason when dismissing false positives or declining stale or out-of-scope findings.

Collect and verify all blocking findings on the current commit before pushing. Batch their fixes into one push when practical. Do not push a new commit solely for non-blocking feedback.

Keep a compact record of the current commit, each finding's classification, and completed fixes. Preserve that record across long waits or context compaction so settled findings are not reconsidered.

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

While healthy checks are pending, continue waiting silently. Update the user only when the head changes, a check fails, actionable review feedback appears, or the pull request becomes ready.

A pull request is ready when required checks pass on the latest commit and the latest review-bot verdict for that commit contains no blocking findings. Explicitly non-blocking notes and stale unresolved threads do not prevent readiness. Report them without changing code. Merge only when the user explicitly requests it; otherwise report that the pull request is ready.
