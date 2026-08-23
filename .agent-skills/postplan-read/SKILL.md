---
name: postplan-read
description: Read an uploaded Postplan document. Use when the user provides a Postplan file to inspect or extract information from.
metadata:
  harness: [claude, codex]
  platform: [darwin, linux]
  scope: fleet
  requires: "curl"
---

# Postplan Read

Fetch the uploaded HTML with the shell. Do not use web search or a browser.

1. Remove one trailing slash from the supplied URL, then append `/raw` unless it
   already ends in `/raw`.
2. Run:

   ```sh
   curl --fail --silent --show-error --location --max-time 30 --output /tmp/postplan.html '<raw-url>'
   ```

3. Read `/tmp/postplan.html` and continue the user's request using its contents.

If `curl` fails, report its actual HTTP status or network error. Do not substitute
search results.
