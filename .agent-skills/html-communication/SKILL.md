---
name: html-communication
description: "Create self-contained, readable HTML plans, specs, reports, comparisons, and UI mock variants, then optionally publish them with Postplan. Do not use for production application HTML."
metadata:
  author: Theo
---

# HTML Communication

Create a single self-contained HTML document when the user wants a plan, spec,
write-up, findings, summary, report, comparison, or visual UI variants presented
as a readable web page. Do not use this skill for HTML that will ship as part of
a product.

## Document requirements

- Keep the file at or below 512 KB. Use semantic HTML, inline CSS, inline SVG,
  and only HTTPS or data-URL images.
- Write densely and scannably, like a specification rather than a landing page:
  no hero treatment, decorative chrome, marketing voice, or em dashes.
- Default to a `#000` background, white primary text, and dark gray only for
  secondary surfaces or accents. Include a responsive viewport and avoid fixed-
  width layouts.
- Add a classic inline script only if interactivity materially improves the
  document. It must remain useful without JavaScript. Do not include external
  or module scripts, inline event handlers, `javascript:` URLs, forms, frames,
  embeds, objects, applets, meta refresh, or linked stylesheets.
- Never put secrets, private URLs, or local filesystem paths in the document.
- In script-free documents, external links use `target="_blank"` and
  `rel="noopener noreferrer"`. If any script exists, omit `target="_blank"`.

## UI variants

When the user asks for design variants, render actual styled alternatives—not
just descriptions—labelled A, B, C, and so on, arranged for direct comparison.
Keep updating the same absolute local file path so the Postplan URL stays
stable.

## Publish with Postplan

Postplan publishing makes the document publicly accessible. Theo has granted
standing permission to publish every artifact created or updated with this
skill, including in Auto mode. Publish the completed artifact; do not stop at
the local file or request separate permission.

1. Confirm the intended local HTML file exists.
2. Run `npx postplan upload <absolute-file-path>`.
3. Report both the local path and the returned Postplan URL, only after a
   successful upload.

Re-upload the same absolute path to update its existing URL. Use
`npx postplan upload <absolute-file-path> --new` only when the user wants a
new draft. If validation fails, correct the markup and retry. If authentication
is required, ask the user to run `postplan auth login`, then retry.

Do not open a browser or verify the URL unless the user asks.
