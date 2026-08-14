# Adding Content

This site is static. Most launch-night edits are plain HTML plus a couple of JSON manifests.

## Edit Text

1. Home page text: edit `/index.html`.
2. Trip list cards: edit `/trips/index.html`.
3. Sturgis page text and captions: edit `/trips/sturgis-2026/index.html`.
4. Omaha walking page text and captions: edit `/trips/walking-around/index.html`.
5. Photography page headings and visible portfolio items: edit `/photography/index.html`.
6. Spatial Machines copy: edit `/spatial-machines/index.html`.

For page metadata, update the `<title>`, `<meta name="description">`, Open Graph tags, and canonical URL in the same HTML file.

## Reorder Photos

1. Open `/content/portfolio.json`.
2. Move photo paths up or down inside the relevant `photos` array.
3. Mirror the visible order in `/photography/index.html` by moving the matching `<figure class="portfolio-item">...</figure>` blocks.
4. For trip pages, reorder the `<figure class="photo-frame ...">...</figure>` blocks inside that trip page.
5. Keep captions with their matching image when moving blocks.

## Add A Trip

1. Create a folder under `/trips/your-trip-slug/`.
2. Copy `/trips/sturgis-2026/index.html` as a starting point.
3. Update the page title, metadata, copy, and photo sequence.
4. Add an entry to `/content/trips.json`.
5. Add a card on `/trips/index.html` and, if featured, on `/index.html`.

## Add Photographs

1. Create a folder for the collection, for example `/photos/omaha-walks/`.
2. Put original edited JPEG exports in `/photos/omaha-walks/source/`.
3. Run the optimizer from the repo root:

```powershell
.\tools\optimize-images.ps1 -Source "photos\omaha-walks\source" -Destination "photos\omaha-walks\web"
```

4. The optimized public images will be written to `/photos/omaha-walks/web/`, with thumbnails in `/photos/omaha-walks/web/thumbs/`.
5. Add curated portfolio images to `/content/portfolio.json`.
6. Add matching `<img>` or `<figure>` blocks to `/photography/index.html` or the relevant trip page.
7. Write useful `alt` text that describes what is actually visible in the image.

Suggested output sizes:

```text
hero: 2000px wide
large: 1600px wide
medium: 1100px wide
thumb: 480px wide
```

The optimizer script creates fresh resized JPEGs and does not copy EXIF metadata, including GPS/location fields.

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

If it is a true trip/project, create `/trips/omaha-walks/`. If it is more of a portfolio collection, keep it on `/photography/` and tag each item in `/content/portfolio.json`.

The current Omaha collection is `/trips/walking-around/` because it is ongoing.

## Edit Portfolio Order

1. Open `/content/portfolio.json`.
2. Reorder the file paths inside each section.
3. Mirror important order changes in `/photography/index.html`.
4. Keep the portfolio selective. Collection pages can show more images than the portfolio.

## Rollback

The fastest rollback is to redeploy the previous commit on `main` or restore the backup captured before the redesign.
