# Get the script's directory
$scriptPath = $PSScriptRoot
$zipPath = Join-Path $scriptPath "ahk.zip"

# Remove existing zip if it exists
if (Test-Path $zipPath) {
    Remove-Item $zipPath -Force
    Write-Host "Removed existing ahk.zip"
}

# Get all files and folders, excluding the script itself, .gitignore, and .git directory
$itemsToZip = Get-ChildItem -Path $scriptPath -Recurse | Where-Object {
    # Exclude the script itself
    $_.FullName -ne $PSCommandPath -and
    # Exclude .gitignore
    $_.Name -ne ".gitignore" -and
    # Exclude anything in .git directory
    $_.FullName -notlike "*\.git\*" -and
    $_.FullName -notlike "*\.git"
}

# Create the zip file
Write-Host "Creating ahk.zip..."
Compress-Archive -Path $itemsToZip.FullName -DestinationPath $zipPath -CompressionLevel Optimal

Write-Host "Successfully created ahk.zip at: $zipPath"
