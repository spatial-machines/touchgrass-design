# Photo Workflow

Put exported originals in a `source` folder and publish optimized web files next to it.

Recommended folders:

```text
photos/
  sturgis-2026/
    source/
    hero.jpg
    sturgis-001.jpg
    sturgis-001.webp
    thumbs/
```

Do not commit enormous original exports unless you intentionally want Git to store them. For large batches, keep originals outside Git and commit only optimized web images.

Update `/content/photos.json` after adding curated portfolio images. Trip pages can contain a larger sequence than the portfolio.
