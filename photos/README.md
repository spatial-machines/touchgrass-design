# Photo Workflow

Put exported originals in a `source` folder and publish optimized web files next to it.

Recommended folders:

```text
photos/
  sturgis-2026/
    source/
    web/
    hero.jpg
    sturgis-001.jpg
    sturgis-001.webp
    thumbs/
```

Do not commit enormous original exports unless you intentionally want Git to store them. For this Sturgis batch, original JPEGs are kept in `photos/sturgis-2026/` and ignored by Git; optimized public copies live in `photos/sturgis-2026/web/`.

Update `/content/photos.json` after adding curated portfolio images. Trip pages can contain a larger sequence than the portfolio.
