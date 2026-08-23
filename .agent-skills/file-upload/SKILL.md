---
name: file-upload
description: "Use when uploading files to uploadcare."
version: 1.0.0
author: Gijs Nelissen
license: unknown
platforms: [linux, macos]
metadata:
  hermes:
    tags: [file-upload, files, sharing, pr]
    source: "written by Gijs"
  harness: [claude, codex]
  platform: [darwin, linux]
  requires: "UPLOADCARE_API_KEY in the environment"
---

# File upload

## When to Use

Use this when the user asks to upload a file, or when a public file URL is needed for PR descriptions, issue comments, reviews, or sharing generated artifacts.

Upload files to `https://uploads.uc.assets.prezly.com`. Authenticate with
`UPLOADCARE_API_KEY`. A successful upload response is JSON that maps the file
name to its UUID; it is not itself a public URL. Build and return the permanent
public URL as `https://cdn.uc.assets.prezly.com/$uuid/`.

## Upload

```bash
response="$(curl -sS --fail-with-body \
  -F "UPLOADCARE_PUB_KEY=${UPLOADCARE_API_KEY}" \
  -F "UPLOADCARE_STORE=1" \
  -F "file=@${file_path}" \
  "https://uploads.uc.assets.prezly.com/base/")"

uuid="$(jq -er 'to_entries[0].value' <<<"$response")"
public_url="https://cdn.uc.assets.prezly.com/${uuid}/"
printf '%s\n' "$public_url"
```

## Rules

1. Before uploading, verify the file exists and is the intended file.
2. Never invent or guess `UPLOADCARE_API_KEY`; if it is missing, stop and say so.
3. Parse the UUID from the successful JSON response and return the constructed
   permanent public URL.
4. Do not expose the API key in logs, notes, final answers, screenshots, or
   command output.
