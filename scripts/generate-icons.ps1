Add-Type -AssemblyName System.Drawing
$srcPath = "D:\My Salon\public\logo.jpg"
$source = [System.Drawing.Image]::FromFile($srcPath)

function Save-Resized($img, [int]$w, [int]$h, [string]$dest) {
    $bmp = New-Object System.Drawing.Bitmap($w, $h)
    $g = [System.Drawing.Graphics]::FromImage($bmp)
    $g.InterpolationMode = [System.Drawing.Drawing2D.InterpolationMode]::HighQualityBicubic
    $g.SmoothingMode = [System.Drawing.Drawing2D.SmoothingMode]::HighQuality
    $g.PixelOffsetMode = [System.Drawing.Drawing2D.PixelOffsetMode]::HighQuality
    $g.DrawImage($img, 0, 0, $w, $h)
    $bmp.Save($dest, [System.Drawing.Imaging.ImageFormat]::Png)
    $g.Dispose()
    $bmp.Dispose()
}

Save-Resized $source 1024 1024 "D:\My Salon\public\icon-1024.png"
Save-Resized $source 512 512 "D:\My Salon\public\icon-512.png"
Save-Resized $source 192 192 "D:\My Salon\public\icon-192.png"
Save-Resized $source 180 180 "D:\My Salon\public\apple-touch-icon.png"
Save-Resized $source 64 64 "D:\My Salon\public\favicon-64.png"
Save-Resized $source 32 32 "D:\My Salon\public\favicon-32.png"
Save-Resized $source 512 512 "D:\My Salon\public\logo.png"

$source.Dispose()
Write-Host "Icons converted successfully!"
