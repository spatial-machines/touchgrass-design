# Adding Content

## Add A Trip

1. Create a folder under `/trips/your-trip-slug/`.
2. Copy `/trips/sturgis-2026/index.html` as a starting point.
3. Update the page title, metadata, copy, and photo sequence.
4. Add an entry to `/content/trips.json`.
5. Add a card on `/trips/index.html` and, if featured, on `/index.html`.

## Add Photographs

1. Create a folder for the collection, for example `/photos/omaha-walks/`.
2. Put original edited exports in `/photos/omaha-walks/source/`.
3. Generate optimized web images into `/photos/omaha-walks/web/`.
4. Add thumbnails into `/photos/omaha-walks/web/thumbs/` if needed.
5. Add curated portfolio images to `/content/photos.json`.
6. Reference the images from a trip, photography, or journal page.

Suggested output sizes:

```text
hero: 2000px wide
large: 1600px wide
medium: 1100px wide
thumb: 480px wide
```

Use WebP when available, but keep JPEG fallbacks for compatibility.

The optimizer script creates fresh resized JPEGs and does not copy EXIF metadata, including GPS/location fields:

```powershell
.\tools\optimize-images.ps1 -Source "photos\omaha-walks\source" -Destination "photos\omaha-walks\web"
```

For an Omaha walking set of about 20 images, use:

```text
photos/
  omaha-walks/
    source/
      DSC01234.jpg
    web/
      DSC01234.jpg
      thumbs/
        DSC01234.jpg
```

If it is a true trip/project, create `/trips/omaha-walks/`. If it is more of a portfolio collection, keep it on `/photography/` and tag each item in `/content/photos.json` with `"category": "omaha"` and `"trip": null`.

The current Omaha collection is `/trips/walking-around/` because it is ongoing.

## Edit Portfolio Order

1. Open `/content/portfolio.json`.
2. Reorder the file paths inside each section.
3. Mirror important order changes in `/photography/index.html`.
4. Keep the portfolio selective. Collection pages can show more images than the portfolio.

## Add A Journal Post

1. Create `/journal/post-slug/index.html`.
2. Copy `/journal/field-notes-start/index.html`.
3. Update title, metadata, and body.
4. Add an entry to `/content/journal.json`.
5. Add the post to `/journal/index.html`.
6. Update `/rss.xml` and `/sitemap.xml`.

## Rollback

The fastest rollback is to redeploy the previous commit on `main` or restore the backup captured before the redesign.
