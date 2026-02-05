# Get the directory where this script is located
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path

# Define paths
$zipFile = Join-Path $scriptDir "ahk.zip"
$liveDir = Join-Path $scriptDir "live"

# Check if zip file exists
if (-not (Test-Path $zipFile)) {
    Write-Error "Error: ahk.zip not found in $scriptDir"
    exit 1
}

# Create live directory if it doesn't exist
if (-not (Test-Path $liveDir)) {
    New-Item -ItemType Directory -Path $liveDir | Out-Null
    Write-Host "Created directory: $liveDir"
}

# Create a temporary directory for extraction
$tempDir = Join-Path $env:TEMP ([System.Guid]::NewGuid().ToString())
New-Item -ItemType Directory -Path $tempDir | Out-Null

try {
    # Extract zip to temporary directory
    Write-Host "Extracting ahk.zip..."
    Expand-Archive -Path $zipFile -DestinationPath $tempDir -Force

    # Copy files from temp to live, excluding existing workstation*.ahk files
    Get-ChildItem -Path $tempDir -Recurse | ForEach-Object {
        $relativePath = $_.FullName.Substring($tempDir.Length + 1)
        $targetPath = Join-Path $liveDir $relativePath

        # Skip workstation*.ahk files ONLY if they already exist in live directory
        if ($_.Name -like "workstation*.ahk" -and (Test-Path $targetPath)) {
            Write-Host "Skipping existing: $($_.Name)"
            return
        }

        if ($_.PSIsContainer) {
            # Create directory if it doesn't exist
            if (-not (Test-Path $targetPath)) {
                New-Item -ItemType Directory -Path $targetPath | Out-Null
            }
        } else {
            # Copy file
            Copy-Item -Path $_.FullName -Destination $targetPath -Force
            Write-Host "Copied: $relativePath"
        }
    }

    Write-Host "Extraction complete! Files extracted to: $liveDir"
} finally {
    # Clean up temporary directory
    Remove-Item -Path $tempDir -Recurse -Force
}
