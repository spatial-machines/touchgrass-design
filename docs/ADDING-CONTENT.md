# Adding Content

## Add A Trip

1. Create a folder under `/trips/your-trip-slug/`.
2. Copy `/trips/sturgis-2026/index.html` as a starting point.
3. Update the page title, metadata, copy, and photo sequence.
4. Add an entry to `/content/trips.json`.
5. Add a card on `/trips/index.html` and, if featured, on `/index.html`.

## Add Photographs

1. Copy exported JPEGs into a trip folder like `/photos/sturgis-2026/` or `/photos/sturgis-2026/source/`.
2. Generate web images at reasonable sizes before publishing.
3. Put public optimized files in `/photos/sturgis-2026/web/`.
4. Add curated portfolio images to `/content/photos.json`.
5. Reference the image from the relevant trip page.

Suggested output sizes:

```text
hero: 2000px wide
large: 1600px wide
medium: 1100px wide
thumb: 480px wide
```

Use WebP when available, but keep JPEG fallbacks for compatibility.

## Add A Journal Post

1. Create `/journal/post-slug/index.html`.
2. Copy `/journal/field-notes-start/index.html`.
3. Update title, metadata, and body.
4. Add an entry to `/content/journal.json`.
5. Add the post to `/journal/index.html`.
6. Update `/rss.xml` and `/sitemap.xml`.

## Rollback

The fastest rollback is to redeploy the previous commit on `main` or restore the backup captured before the redesign.
