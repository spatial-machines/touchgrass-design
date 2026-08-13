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
  omaha-walks/
    source/
    web/
      thumbs/
```

Do not commit enormous original exports unless you intentionally want Git to store them. Put originals in `source/` and commit optimized public copies from `web/`.

The optimizer redraws each image into a new JPEG, so EXIF/GPS metadata from the source file is not copied into the public `web/` version.

Update `/content/photos.json` after adding curated portfolio images. Trip pages can contain a larger sequence than the portfolio.
