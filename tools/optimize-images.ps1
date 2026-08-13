param(
  [Parameter(Mandatory = $true)]
  [string]$Source,

  [Parameter(Mandatory = $true)]
  [string]$Destination,

  [int]$MaxSize = 2000,
  [int]$ThumbSize = 620,
  [int]$Quality = 84,
  [int]$ThumbQuality = 78
)

Add-Type -AssemblyName System.Drawing

$resolvedSource = (Resolve-Path -LiteralPath $Source).Path
New-Item -ItemType Directory -Force -Path $Destination | Out-Null
$resolvedDestination = (Resolve-Path -LiteralPath $Destination).Path
$thumbDestination = Join-Path $resolvedDestination "thumbs"
New-Item -ItemType Directory -Force -Path $thumbDestination | Out-Null

$jpegCodec = [System.Drawing.Imaging.ImageCodecInfo]::GetImageEncoders() |
  Where-Object { $_.MimeType -eq "image/jpeg" }

function Save-Jpeg {
  param(
    [System.Drawing.Image]$Image,
    [string]$Path,
    [int]$JpegQuality
  )

  $encoderParams = New-Object System.Drawing.Imaging.EncoderParameters(1)
  $encoderParams.Param[0] = New-Object System.Drawing.Imaging.EncoderParameter(
    [System.Drawing.Imaging.Encoder]::Quality,
    [int64]$JpegQuality
  )
  $Image.Save($Path, $jpegCodec, $encoderParams)
  $encoderParams.Dispose()
}

function Resize-Photo {
  param(
    [string]$InputPath,
    [string]$OutputPath,
    [int]$MaxDimension,
    [int]$JpegQuality
  )

  $sourceImage = [System.Drawing.Image]::FromFile($InputPath)
  try {
    $scale = [Math]::Min(1.0, [Math]::Min($MaxDimension / $sourceImage.Width, $MaxDimension / $sourceImage.Height))
    $width = [int][Math]::Round($sourceImage.Width * $scale)
    $height = [int][Math]::Round($sourceImage.Height * $scale)

    # Draw into a fresh bitmap so EXIF/GPS metadata is not copied to the public image.
    $bitmap = New-Object System.Drawing.Bitmap $width, $height
    $graphics = [System.Drawing.Graphics]::FromImage($bitmap)
    try {
      $graphics.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
      $graphics.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
      $graphics.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
      $graphics.DrawImage($sourceImage, 0, 0, $width, $height)
      Save-Jpeg -Image $bitmap -Path $OutputPath -JpegQuality $JpegQuality
    }
    finally {
      $graphics.Dispose()
      $bitmap.Dispose()
    }
  }
  finally {
    $sourceImage.Dispose()
  }
}

$files = Get-ChildItem -LiteralPath $resolvedSource -File |
  Where-Object { $_.Extension -match '^\.(jpg|jpeg)$' } |
  Sort-Object Name

foreach ($file in $files) {
  $safeName = ([System.IO.Path]::GetFileNameWithoutExtension($file.Name) + ".jpg")
  $webPath = Join-Path $resolvedDestination $safeName
  $thumbPath = Join-Path $thumbDestination $safeName

  Resize-Photo -InputPath $file.FullName -OutputPath $webPath -MaxDimension $MaxSize -JpegQuality $Quality
  Resize-Photo -InputPath $file.FullName -OutputPath $thumbPath -MaxDimension $ThumbSize -JpegQuality $ThumbQuality
  Write-Output "optimized $safeName"
}
