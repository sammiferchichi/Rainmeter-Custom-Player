try {
  $log = "$env:TEMP\LoadFolder.log"
  $inc = "$env:USERPROFILE\Documents\Rainmeter\Skins\MusicPlayerWidget\@Resources\Variables.inc"
  $folder = $null
  if (Test-Path $inc) { $m = Select-String -Path $inc -Pattern "MusicFolder=(.+)" -ErrorAction SilentlyContinue; if ($m) { $folder = $m.Matches[0].Groups[1].Value.Trim() } }
  if (-not $folder -or -not (Test-Path $folder)) { $folder = "$env:USERPROFILE\Music" }
  if (-not (Test-Path $folder)) { $folder = "$env:USERPROFILE\Downloads" }
  $files = @(Get-ChildItem -Path $folder -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.Extension -match '\.(mp3|mp4|m4a|flac|wav)$' } | Select-Object -ExpandProperty FullName)
  if (-not $files -or $files.Count -eq 0) { "No media found in $folder" | Out-File $log -Append; exit }
  $playlist = "$env:TEMP\RainmeterQueue.m3u8"
  [System.IO.File]::WriteAllLines($playlist, $files, (New-Object System.Text.UTF8Encoding $false))
  $fso = New-Object -ComObject Scripting.FileSystemObject
  $lrcs = @(Get-ChildItem -Path $folder -Recurse -Filter *.lrc -File -ErrorAction SilentlyContinue | ForEach-Object { $fso.GetFile($_.FullName).ShortPath })
  $lrcs | Set-Content "$env:TEMP\RainmeterLRCList.txt" -Encoding ASCII
  Start-Process $playlist -ErrorAction Stop
} catch {
  $_ | Out-File "$env:TEMP\LoadFolderError.txt" -Append
}
