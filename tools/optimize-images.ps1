param(
  [Parameter(Mandatory = $true)]
  [string]$Source,

  [Parameter(Mandatory = $true)]
  [string]$Destination
)

if (-not (Get-Command magick -ErrorAction SilentlyContinue)) {
  Write-Error "ImageMagick is required. Install it, then rerun this script."
  exit 1
}

New-Item -ItemType Directory -Force -Path $Destination | Out-Null
New-Item -ItemType Directory -Force -Path (Join-Path $Destination "thumbs") | Out-Null

Get-ChildItem -LiteralPath $Source -File -Include *.jpg,*.jpeg | ForEach-Object {
  $name = [System.IO.Path]::GetFileNameWithoutExtension($_.Name).ToLowerInvariant()
  $jpg = Join-Path $Destination "$name.jpg"
  $webp = Join-Path $Destination "$name.webp"
  $thumb = Join-Path $Destination "thumbs\$name.jpg"

  magick $_.FullName -auto-orient -resize "2000x2000>" -quality 86 $jpg
  magick $_.FullName -auto-orient -resize "2000x2000>" -quality 82 $webp
  magick $_.FullName -auto-orient -resize "520x520>" -quality 78 $thumb
}
